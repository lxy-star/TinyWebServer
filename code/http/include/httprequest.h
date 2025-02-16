#ifndef HTTPREQUEST_H
#define HTTPREQUEST_H

#include <regex>
#include <mysql/mysql.h>
#include <unordered_map>
#include <unordered_set>
#include <algorithm>
#include "../../buffer/include/buffer.h"
#include "../../pool/include/sqlconnRAII.h"
#include "../../log/include/log.h"

class HttpRequest
{
public:
    enum class PARSE_STATE
    {
        REQUEST_LINE,
        REQUEST_HEAD,
        REQUEST_BODY,
        FINISH
    };
    HttpRequest() { Init(); };
    ~HttpRequest() = default;
    void Init();
    bool parse(Buffer &buffer);
    std::string path() const;
    std::string &path();
    std::string method() const;
    std::string version() const;
    std::string GetPost(const std::string &key) const;
    std::string GetPost(const char *key) const;

    bool IsKeepAlive() const;

private:
    bool ParseRequestLine_(const std::string &line); // 处理请求行
    void ParseHeader_(const std::string &line);      // 处理请求头
    void ParseBody_(const std::string &line);        // 处理请求体

    void ParsePath_();           // 处理请求路径
    void ParsePost_();           // 处理Post事件
    void ParseFromUrlencoded_(); // 从url种解析编码

    static bool UserVerify(const std::string &name, const std::string &pwd, bool isLogin); // 用户验证

    PARSE_STATE state_;
    std::string path_, method_, version_, body_;
    std::unordered_map<std::string, std::string> header_;
    std::unordered_map<std::string, std::string> post_;
    static const std::unordered_set<std::string> DEFAULT_HTML;
    static const std::unordered_map<std::string, int> DEFAULT_HTML_TAG;
    static int ConverHex(char ch);
};

#endif // HTTPREQUEST_H