#include "../include/sqlconnRAII.h"

//**sql 说明sql这个参数存放着调用这个函数的对象的MYSQL指针，通过*sql我们可以对这个MYSQL指针自身进行修改
SqlConnRAII::SqlConnRAII(MYSQL **sql, SqlConnPool *pool)
{
    assert(pool);
    *sql = pool->GetConn(); // 对传入的MYSQL指针修改成连接池的mysql指针
    sql_ = *sql;            // 存放修改后的MYSQL指针
    connpool_ = pool;       // 存放连接池
}

SqlConnRAII::~SqlConnRAII()
{
    if (sql_)
    {
        connpool_->FreeConn(sql_);
    }
}