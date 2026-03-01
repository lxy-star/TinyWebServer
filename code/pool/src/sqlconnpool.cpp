#include "../include/sqlconnpool.h"
#include <assert.h>
#include <cstring> // for strlen / strncpy

// 实现构造函数，初始化所有成员变量
SqlConnPool::SqlConnPool()
    : host_(nullptr), port_(0), user_(nullptr), pwd_(nullptr), dbName_(nullptr),
      MAX_CONN_(0), useCount_(0), freeCount_(0), mtx_(), semId_()
{
    // 必须在初始化列表后，在构造函数体内显式初始化 sem_t
    sem_init(&semId_, 0, 0);
}

// 实现析构函数，清理资源
SqlConnPool::~SqlConnPool()
{
    ClosePool();

    // 释放动态分配的字符串内存
    if (host_)
    {
        delete[] host_;
        host_ = nullptr;
    }
    if (user_)
    {
        delete[] user_;
        user_ = nullptr;
    }
    if (pwd_)
    {
        delete[] pwd_;
        pwd_ = nullptr;
    }
    if (dbName_)
    {
        delete[] dbName_;
        dbName_ = nullptr;
    }

    // 销毁信号量
    sem_destroy(&semId_);
}

SqlConnPool *SqlConnPool::Instance()
{
    static SqlConnPool connpool;
    return &connpool;
}

void SqlConnPool::Init(const char *host, int port, const char *user, const char *pwd, const char *dbName,
                       int connSize)
{
    assert(connSize > 0);
    assert(host && user && pwd && dbName);

    // 保存连接参数（深拷贝），供后续重建连接使用
    size_t len;
    len = strlen(host) + 1;
    host_ = new char[len];
    strncpy(host_, host, len);

    len = strlen(user) + 1;
    user_ = new char[len];
    strncpy(user_, user, len);

    len = strlen(pwd) + 1;
    pwd_ = new char[len];
    strncpy(pwd_, pwd, len);

    len = strlen(dbName) + 1;
    dbName_ = new char[len];
    strncpy(dbName_, dbName, len);

    port_ = port;
    MAX_CONN_ = connSize;

    // 创建连接池
    for (int i = 0; i < connSize; ++i)
    {
        MYSQL *sql = mysql_init(nullptr);
        if (!sql)
        {
            LOG_ERROR("MySQL init error!");
            assert(sql);
        }

        sql = mysql_real_connect(sql, host, user, pwd, dbName, port, nullptr, 0);
        if (!sql)
        {
            LOG_ERROR("MySql Connect error: %s", mysql_error(sql));
            mysql_close(sql); // 连接失败，必须关闭句柄
            continue;         // 跳过此次循环，不影响后续连接创建
        }

        // 连接成功，加入队列并增加信号量
        {
            std::lock_guard<std::mutex> locker(mtx_);
            connQue_.push(sql);
        }
        sem_post(&semId_);
    }

    // 检查最终连接数
    int actual_conn = GetFreeConnCount();
    if (actual_conn == 0)
    {
        LOG_ERROR("Failed to create any database connections!");
        assert(actual_conn > 0);
    }
    else if (actual_conn < connSize)
    {
        LOG_WARN("Only %d/%d database connections created.", actual_conn, connSize);
    }
}

MYSQL *SqlConnPool::GetConn()
{
    if (sem_wait(&semId_) != 0) // 等待可用连接
    {
        LOG_ERROR("Semaphore wait failed!");
        return nullptr;
    }

    std::lock_guard<std::mutex> locker(mtx_);
    if (connQue_.empty())
    {
        // 理论上不会发生，因为 sem 控制了数量
        sem_post(&semId_);
        LOG_WARN("Connection queue is empty despite semaphore!");
        return nullptr;
    }

    MYSQL *conn = connQue_.front();
    connQue_.pop();

    // 【新增】在交给调用者之前，检查连接是否有效
    if (mysql_ping(conn) != 0)
    {
        LOG_WARN("Stale connection found in pool, recreating...");

        // 关闭无效连接
        mysql_close(conn);

        // 尝试创建一个新连接来替代它
        MYSQL *new_conn = mysql_init(nullptr);
        if (new_conn && mysql_real_connect(new_conn, host_, user_, pwd_, dbName_, port_, nullptr, 0))
        {
            LOG_INFO("Successfully recreated a new connection for the pool.");
            conn = new_conn; // 将新连接交给调用者
        }
        else
        {
            LOG_ERROR("Failed to recreate connection for pool: %s",
                      new_conn ? mysql_error(new_conn) : "mysql_init failed");

            if (new_conn)
            {
                mysql_close(new_conn);
            }

            // 重新将信号量加回去，因为我们没有成功提供一个连接
            sem_post(&semId_);
            return nullptr;
        }
    }

    return conn;
}

void SqlConnPool::FreeConn(MYSQL *conn)
{
    if (!conn)
        return;

    // 【核心改进】：归还前检查连接是否还活着
    if (mysql_ping(conn) != 0)
    {
        LOG_WARN("Dead connection detected, closing and replacing...");
        mysql_close(conn); // 关闭坏连接

        // 尝试创建一个新连接来替代
        MYSQL *new_conn = mysql_init(nullptr);
        if (new_conn && mysql_real_connect(new_conn, host_, user_, pwd_, dbName_, port_, nullptr, 0))
        {
            // 新连接成功，放回池中
            std::lock_guard<std::mutex> locker(mtx_);
            connQue_.push(new_conn);
            sem_post(&semId_); // 补回信号量
        }
        else
        {
            LOG_ERROR("Failed to create replacement connection: %s",
                      new_conn ? mysql_error(new_conn) : "mysql_init failed");
            if (new_conn)
                mysql_close(new_conn);
            // 注意：这里信号量没有补回，池容量会暂时减少。
            // 但这可以防止在数据库宕机时无限循环创建失败连接。
        }
        return;
    }

    // 连接正常，归还到池中
    std::lock_guard<std::mutex> locker(mtx_);
    connQue_.push(conn);
    sem_post(&semId_);
}

int SqlConnPool::GetFreeConnCount()
{
    std::lock_guard<std::mutex> locker(mtx_);
    return connQue_.size();
}

void SqlConnPool::ClosePool()
{
    std::lock_guard<std::mutex> locker(mtx_);
    while (!connQue_.empty())
    {
        MYSQL *sql = connQue_.front();
        connQue_.pop();
        mysql_close(sql);
    }
    mysql_library_end();
}