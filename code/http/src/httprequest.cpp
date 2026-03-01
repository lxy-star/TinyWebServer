#include "../include/httprequest.h"

const std::unordered_set<std::string> HttpRequest::DEFAULT_HTML{
    "/index", "/register", "/login", "/welcome", "/video", "/picture", "/judge"};

// 登录/注册
const std::unordered_map<std::string, int> HttpRequest::DEFAULT_HTML_TAG{
    {"/login.html", 1}, {"/register.html", 0}};

// 初始化操作，一些清零操作
void HttpRequest::Init()
{
    state_ = PARSE_STATE::REQUEST_LINE; // 初始状态
    method_ = path_ = version_ = body_ = "";
    header_.clear();
    post_.clear();
}

// 解析处理
bool HttpRequest::parse(Buffer &buff)
{
    const char END[] = "\r\n";
    // 没有可读的字节
    if (buff.ReadableBytes() < 0)
    {
        return false;
    }
    while (buff.ReadableBytes() && state_ != PARSE_STATE::FINISH)
    {
        const char *lineEnd = std::search(buff.Peek(), buff.BeginWriteConst(), END, END + 2);
        std::string line(buff.Peek(), lineEnd);
        switch (state_)
        {
        case PARSE_STATE::REQUEST_LINE:
            // 解析错误
            if (!ParseRequestLine_(line))
            {
                return false;
            }
            ParsePath_(); // 解析路径
            break;
        case PARSE_STATE::REQUEST_HEAD:
            ParseHeader_(line);
            // get方法没有body
            if (buff.ReadableBytes() <= 2)
            {
                state_ = PARSE_STATE::FINISH;
            }
            break;
        case PARSE_STATE::REQUEST_BODY:
            ParseBody_(line);
            break;
        default:
            break;
        }
        if (lineEnd == buff.BeginWrite())
        { // 读完了
            buff.RetrieveAll();
            break;
        }
        buff.RetrieveUntil(lineEnd + 2); // 跳过回车换行
    }
    LOG_DEBUG("[%s], [%s], [%s]", method_.c_str(), path_.c_str(), version_.c_str());
    return true;
}

bool HttpRequest::ParseRequestLine_(const std::string &line)
{
    std::regex patten("^([^ ]*) ([^ ]*) HTTP/([^ ]*)$");
    std::smatch match;
    if (std::regex_match(line, match, patten))
    {
        method_ = match[1];
        path_ = match[2];
        version_ = match[3];
        state_ = PARSE_STATE::REQUEST_HEAD;
        return true;
    }
    LOG_ERROR("RequestLine Error");
    return false;
}

void HttpRequest::ParsePath_()
{
    if (path_ == "/")
    {
        path_ = "/judge.html";
    }
    else
    {
        if (DEFAULT_HTML.find(path_) != DEFAULT_HTML.end())
        {
            path_ += ".html";
        }
    }
}

void HttpRequest::ParseHeader_(const std::string &line)
{
    std::regex patten("^([^:]*): ?(.*)$");
    std::smatch match;
    if (std::regex_match(line, match, patten))
    {
        header_[match[1]] = match[2];
    }
    else
    {
        state_ = PARSE_STATE::REQUEST_BODY;
    }
}

void HttpRequest::ParseBody_(const std::string &line)
{
    body_ = line;
    ParsePost_();
    state_ = PARSE_STATE::FINISH; // 状态转换为下一个状态
    LOG_DEBUG("Body:%s, len:%d", line.c_str(), line.size());
}

void HttpRequest::ParsePost_()
{
    if (method_ == "POST" && header_["Content-Type"] == "application/x-www-form-urlencoded")
    {
        ParseFromUrlencoded_();
        if (DEFAULT_HTML_TAG.count(path_))
        { // 如果是登录/注册的path
            int tag = DEFAULT_HTML_TAG.find(path_)->second;
            LOG_DEBUG("Tag:%d", tag);
            if (tag == 0 || tag == 1)
            {
                bool isLogin = (tag == 1); // 为1则是登录
                if (UserVerify(post_["username"], post_["password"], isLogin))
                {
                    path_ = "/welcome.html";
                }
                else
                {
                    path_ = "/error.html";
                }
            }
        }
    }
}

// 16进制转化为10进制
int HttpRequest::ConverHex(char ch)
{
    if (ch >= 'A' && ch <= 'F')
        return ch - 'A' + 10;
    if (ch >= 'a' && ch <= 'f')
        return ch - 'a' + 10;
    if (ch >= '0' && ch <= '9')
        return ch - '0';
    throw std::invalid_argument("Invalid hex character");
}

// 从url中解析编码
void HttpRequest::ParseFromUrlencoded_()
{
    if (body_.size() == 0)
    {
        return;
    }

    std::string key, value;
    int num = 0;
    int n = body_.size();
    int i = 0, j = 0;

    for (; i < n; i++)
    {
        char ch = body_[i];
        switch (ch)
        {
        case '=':
            key = body_.substr(j, i - j);
            j = i + 1;
            break;
        case '+':
            body_[i] = ' ';
            break;
        case '%':
            num = ConverHex(body_[i + 1]) * 16 + ConverHex(body_[i + 2]);
            body_[i] = static_cast<char>(num);
            body_.erase(i + 1, 2); // 删除接下来的两个字符
            n -= 2;                // 更新长度
            --i;                   // 因为我们删除了两个字符，所以需要回退一次
            break;
        case '&':
            value = body_.substr(j, i - j);
            j = i + 1;
            post_[key] = value;
            LOG_DEBUG("%s = %s", key.c_str(), value.c_str());
            break;
        default:
            break;
        }
    }
    assert(j <= i);
    if (post_.count(key) == 0 && j < i)
    {
        value = body_.substr(j, i - j);
        post_[key] = value;
    }
}

bool HttpRequest::UserVerify(const std::string &name, const std::string &pwd, bool isLogin)
{
    // 检查用户名和密码是否为空
    if (name.empty() || pwd.empty())
    {
        LOG_INFO("Empty username or password");
        return false;
    }
    LOG_INFO("Verify name:%s", name.c_str());

    MYSQL *sql = nullptr;
    bool retry = false; // 标记是否需要重试

try_connect:
{
    // 使用花括号限制 RAII 的作用域，以便在需要重试时能重新获取
    SqlConnRAII raii(&sql, SqlConnPool::Instance());
    assert(sql);

    // 【新增】关键步骤：检查连接是否存活
    if (mysql_ping(sql) != 0)
    {
        LOG_ERROR("Database connection lost (ping failed): %s", mysql_error(sql));

        // 如果这是第一次尝试，且是因为超时断开，我们可以尝试重试一次
        if (!retry)
        {
            LOG_INFO("Attempting to reconnect and retry...");
            retry = true;
            // 重要：raii 离开作用域时会自动归还这个坏掉的连接
            // 然后我们 goto 到 try_connect 重新获取一个新连接
            goto try_connect;
        }
        else
        {
            // 重试过一次还是失败，说明数据库可能挂了或网络严重问题
            LOG_ERROR("Failed to reconnect to database.");
            return false;
        }
    }

    bool flag = false;

    // 初始化预处理语句和绑定参数
    MYSQL_STMT *stmt = nullptr;
    MYSQL_BIND bind[2];
    memset(bind, 0, sizeof(bind));

    if (isLogin)
    {
        // 登录操作
        const char *query = "SELECT password FROM user WHERE username=? LIMIT 1";
        stmt = mysql_stmt_init(sql);
        if (!stmt || mysql_stmt_prepare(stmt, query, strlen(query)))
        {
            // 再次检查是否是连接断开导致的错误（双重保险）
            int err_code = mysql_errno(sql);
            if (err_code == CR_SERVER_GONE_ERROR || err_code == CR_SERVER_LOST)
            {
                if (!retry)
                {
                    LOG_INFO("Prepare failed due to lost connection, retrying...");
                    retry = true;
                    goto try_connect;
                }
            }

            LOG_ERROR("Failed to prepare login statement: %s", mysql_error(sql));
            if (stmt)
                mysql_stmt_close(stmt);
            return false;
        }

        // 绑定用户名参数
        bind[0].buffer_type = MYSQL_TYPE_STRING;
        bind[0].buffer = (char *)name.c_str();
        bind[0].buffer_length = name.size();

        if (mysql_stmt_bind_param(stmt, bind))
        {
            LOG_ERROR("Failed to bind parameters: %s", mysql_stmt_error(stmt));
            mysql_stmt_close(stmt);
            return false;
        }

        // 执行查询
        if (mysql_stmt_execute(stmt))
        {
            LOG_ERROR("Failed to execute login statement: %s", mysql_stmt_error(stmt));
            mysql_stmt_close(stmt);
            return false;
        }

        // 绑定结果列
        MYSQL_BIND result_bind[1];
        memset(result_bind, 0, sizeof(result_bind));
        char password_buffer[256];
        // 初始化 buffer 以防万一
        memset(password_buffer, 0, sizeof(password_buffer));

        result_bind[0].buffer_type = MYSQL_TYPE_STRING;
        result_bind[0].buffer = password_buffer;
        result_bind[0].buffer_length = sizeof(password_buffer);
        // result_bind[0].length 不需要设为 nullptr，mysql 会处理，但设为 0 更安全
        result_bind[0].length = nullptr;

        if (mysql_stmt_bind_result(stmt, result_bind))
        {
            LOG_ERROR("Failed to bind result: %s", mysql_stmt_error(stmt));
            mysql_stmt_close(stmt);
            return false;
        }

        if (mysql_stmt_store_result(stmt))
        {
            LOG_ERROR("Failed to store result: %s", mysql_stmt_error(stmt));
            mysql_stmt_close(stmt);
            return false;
        }

        int fetch_ret = mysql_stmt_fetch(stmt);
        if (fetch_ret == 0)
        {
            // 确保字符串以 null 结尾，因为 MYSQL_TYPE_STRING 不会自动加 \0
            // buffer_length 限制了最大读取长度，我们需要手动截断或确保有空间
            // mysql_stmt_bind_result 不会自动添加 \0，必须手动处理
            unsigned long len = result_bind[0].length ? *result_bind[0].length : strlen(password_buffer);
            if (len >= sizeof(password_buffer))
                len = sizeof(password_buffer) - 1;
            password_buffer[len] = '\0';

            std::string stored_password(password_buffer);
            if (pwd == stored_password)
            {
                flag = true;
            }
            else
            {
                flag = false;
                LOG_INFO("Password error!");
            }
        }
        else if (fetch_ret == 1)
        {
            // 没有数据
            LOG_INFO("User not found!");
        }
        else
        {
            // 出错
            LOG_ERROR("Fetch failed: %s", mysql_stmt_error(stmt));
        }

        // 清理资源
        mysql_stmt_free_result(stmt);
        mysql_stmt_close(stmt);
    }
    else
    {
        // 注册逻辑 (同样建议加上 errno 检查重试，此处省略以保持简洁，原理同上)
        const char *query = "INSERT INTO user(username, password) VALUES(?, ?)";
        stmt = mysql_stmt_init(sql);
        if (!stmt || mysql_stmt_prepare(stmt, query, strlen(query)))
        {
            int err_code = mysql_errno(sql);
            if (!retry && (err_code == CR_SERVER_GONE_ERROR || err_code == CR_SERVER_LOST))
            {
                retry = true;
                goto try_connect;
            }
            LOG_ERROR("Failed to prepare register statement: %s", mysql_error(sql));
            if (stmt)
                mysql_stmt_close(stmt);
            return false;
        }

        bind[0].buffer_type = MYSQL_TYPE_STRING;
        bind[0].buffer = (char *)name.c_str();
        bind[0].buffer_length = name.size();

        bind[1].buffer_type = MYSQL_TYPE_STRING;
        bind[1].buffer = (char *)pwd.c_str();
        bind[1].buffer_length = pwd.size();

        if (mysql_stmt_bind_param(stmt, bind))
        {
            LOG_ERROR("Failed to bind parameters: %s", mysql_stmt_error(stmt));
            mysql_stmt_close(stmt);
            return false;
        }

        // 执行插入操作
        if (mysql_stmt_execute(stmt))
        {
            LOG_ERROR("Failed to execute register statement: %s", mysql_stmt_error(stmt));
            mysql_stmt_close(stmt);
            return false;
        }

        LOG_DEBUG("Registration successful!");
        mysql_stmt_close(stmt);
        flag = true;
    }

    LOG_DEBUG("UserVerify success!!");
    return flag;

} // Raai 在这里析构，归还连接
}

std::string HttpRequest::path() const
{
    return path_;
}

std::string &HttpRequest::path()
{
    return path_;
}
std::string HttpRequest::method() const
{
    return method_;
}

std::string HttpRequest::version() const
{
    return version_;
}

std::string HttpRequest::GetPost(const std::string &key) const
{
    assert(key != "");
    if (post_.count(key) == 1)
    {
        return post_.find(key)->second;
    }
    return "";
}

std::string HttpRequest::GetPost(const char *key) const
{
    assert(key != nullptr);
    if (post_.count(key) == 1)
    {
        return post_.find(key)->second;
    }
    return "";
}

bool HttpRequest::IsKeepAlive() const
{
    if (header_.count("Connection") == 1)
    {
        return header_.find("Connection")->second == "keep-alive" && version_ == "1.1";
    }
    return false;
}