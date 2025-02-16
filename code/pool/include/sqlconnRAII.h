#ifndef SQLCONNRAII_H
#define SQLCONNRAII_H

#include "sqlconnpool.h"

class SqlConnRAII
{
private:
    MYSQL *sql_;
    SqlConnPool *connpool_;

public:
    SqlConnRAII(MYSQL **sql, SqlConnPool *pool);
    ~SqlConnRAII();
};

#endif // SQLCONNRAII_H