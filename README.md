# TinyWebServer
## Introduction
用C++实现的高性能WEB服务器，经过webbenchh压力测试可以实现上万的QPS

## Function
* 利用IO复用技术Epoll与线程池实现多线程的Reactor高并发模型；
* 利用正则与状态机解析HTTP请求报文，实现处理静态资源的请求；
* 利用标准库容器封装char，实现自动增长的缓冲区；
* 基于小根堆实现的定时器，关闭超时的非活动连接；
* 利用单例模式与阻塞队列实现异步的日志系统，记录服务器运行状态；
* 利用RAII机制实现了数据库连接池，减少数据库连接建立与关闭的开销，同时实现了用户注册登录功能。

## Environment
* Ubuntu 22
* Modern C++
* MySql
* Vscode
* git

## 目录树
```
├── build
│   ├── CMakeCache.txt
│   ├── CMakeFiles
│   │   ├── 3.22.1
│   │   │   ├── CMakeCCompiler.cmake
│   │   │   ├── CMakeCXXCompiler.cmake
│   │   │   ├── CMakeDetermineCompilerABI_C.bin
│   │   │   ├── CMakeDetermineCompilerABI_CXX.bin
│   │   │   ├── CMakeSystem.cmake
│   │   │   ├── CompilerIdC
│   │   │   │   ├── a.out
│   │   │   │   ├── CMakeCCompilerId.c
│   │   │   │   └── tmp
│   │   │   └── CompilerIdCXX
│   │   │       ├── a.out
│   │   │       ├── CMakeCXXCompilerId.cpp
│   │   │       └── tmp
│   │   ├── cmake.check_cache
│   │   ├── CMakeDirectoryInformation.cmake
│   │   ├── CMakeOutput.log
│   │   ├── CMakeTmp
│   │   ├── Makefile2
│   │   ├── Makefile.cmake
│   │   ├── progress.marks
│   │   ├── TargetDirectories.txt
│   │   └── TinyWebService.dir
│   │       ├── build.make
│   │       ├── cmake_clean.cmake
│   │       ├── code
│   │       │   ├── buffer
│   │       │   │   └── src
│   │       │   │       ├── buffer.cpp.o
│   │       │   │       └── buffer.cpp.o.d
│   │       │   ├── http
│   │       │   │   └── src
│   │       │   │       ├── httpconn.cpp.o
│   │       │   │       ├── httpconn.cpp.o.d
│   │       │   │       ├── httprequest.cpp.o
│   │       │   │       ├── httprequest.cpp.o.d
│   │       │   │       ├── httpresponse.cpp.o
│   │       │   │       └── httpresponse.cpp.o.d
│   │       │   ├── log
│   │       │   │   └── src
│   │       │   │       ├── log.cpp.o
│   │       │   │       └── log.cpp.o.d
│   │       │   ├── main.cpp.o
│   │       │   ├── main.cpp.o.d
│   │       │   ├── pool
│   │       │   │   └── src
│   │       │   │       ├── sqlconnpool.cpp.o
│   │       │   │       ├── sqlconnpool.cpp.o.d
│   │       │   │       ├── sqlconnRAII.cpp.o
│   │       │   │       └── sqlconnRAII.cpp.o.d
│   │       │   ├── server
│   │       │   │   └── src
│   │       │   │       ├── epoller.cpp.o
│   │       │   │       ├── epoller.cpp.o.d
│   │       │   │       ├── webserver.cpp.o
│   │       │   │       └── webserver.cpp.o.d
│   │       │   └── timer
│   │       │       └── src
│   │       │           ├── heaptimer.cpp.o
│   │       │           └── heaptimer.cpp.o.d
│   │       ├── compiler_depend.internal
│   │       ├── compiler_depend.make
│   │       ├── compiler_depend.ts
│   │       ├── DependInfo.cmake
│   │       ├── depend.make
│   │       ├── flags.make
│   │       ├── link.txt
│   │       └── progress.make
│   ├── cmake_install.cmake
│   ├── Makefile
│   └── TinyWebService
├── build.sh
├── chmod.sh
├── clean.sh
├── CMakeLists.txt
├── code
│   ├── buffer
│   │   ├── include
│   │   │   └── buffer.h
│   │   └── src
│   │       └── buffer.cpp
│   ├── http
│   │   ├── include
│   │   │   ├── httpconn.h
│   │   │   ├── httprequest.h
│   │   │   └── httpresponse.h
│   │   └── src
│   │       ├── httpconn.cpp
│   │       ├── httprequest.cpp
│   │       └── httpresponse.cpp
│   ├── log
│   │   ├── include
│   │   │   ├── blockqueue.h
│   │   │   └── log.h
│   │   └── src
│   │       └── log.cpp
│   ├── main.cpp
│   ├── pool
│   │   ├── include
│   │   │   ├── sqlconnpool.h
│   │   │   ├── sqlconnRAII.h
│   │   │   └── threadpool.h
│   │   └── src
│   │       ├── sqlconnpool.cpp
│   │       └── sqlconnRAII.cpp
│   ├── server
│   │   ├── include
│   │   │   ├── epoller.h
│   │   │   └── webserver.h
│   │   └── src
│   │       ├── epoller.cpp
│   │       └── webserver.cpp
│   ├── timer
│   │   ├── include
│   │   │   ├── heaptimer.h
│   │   │   └── rbtreetimer.h
│   │   └── src
│   │       └── heaptimer.cpp
│   └── uml
│       ├── all.uxf
│       ├── buffer.uxf
│       └── timmer.uxf
├── LICENSE
├── log
│   └── 2025_02_16.log
├── README.md
├── resources
│   ├── 400.html
│   ├── 403.html
│   ├── 404.html
│   ├── css
│   │   ├── animate.css
│   │   ├── bootstrap.min.css
│   │   ├── font-awesome.min.css
│   │   ├── magnific-popup.css
│   │   └── style.css
│   ├── error.html
│   ├── fonts
│   │   ├── FontAwesome.otf
│   │   ├── fontawesome-webfont.eot
│   │   ├── fontawesome-webfont.svg
│   │   ├── fontawesome-webfont.ttf
│   │   ├── fontawesome-webfont.woff
│   │   └── fontawesome-webfont.woff2
│   ├── images
│   │   ├── favicon.ico
│   │   ├── instagram-image1.jpg
│   │   ├── instagram-image2.jpg
│   │   ├── instagram-image3.jpg
│   │   ├── instagram-image4.jpg
│   │   ├── instagram-image5.jpg
│   │   └── profile-image.jpg
│   ├── index.html
│   ├── js
│   │   ├── bootstrap.min.js
│   │   ├── custom.js
│   │   ├── jquery.js
│   │   ├── jquery.magnific-popup.min.js
│   │   ├── magnific-popup-options.js
│   │   ├── smoothscroll.js
│   │   └── wow.min.js
│   ├── judge.html
│   ├── login.html
│   ├── picture.html
│   ├── register.html
│   ├── video
│   │   └── xxx.mp4
│   ├── video.html
│   └── welcome.html
├── run.sh
└── webbench-1.5
    ├── Makefile
    ├── socket.c
    ├── webbench
    ├── webbench.c
    └── webbench.o

```
## Build & Usage
```
mkdir build
cd build
cmake ..
make
cd ..
./build/TinyWebServer

需要先配置好对应的数据库
bash
// 建立yourdb库
create database yourdb;

// 创建user表
USE yourdb;
CREATE TABLE user(
    username char(50) NULL,
    password char(50) NULL
)ENGINE=InnoDB;

// 添加数据
INSERT INTO user(username, password) VALUES('name', 'password');
```

服务器压力测试：
cd webbench-1.5
make
webbench -c 1000 -t 30 http://ip:port/

参数：
	-c 表示客户端数
	-t 表示时间
```
root@1739711330295:/home/TinyWebServer/TinyWebServer# ./webbench-1.5/webbench -c 10000 -t 5 http://116.196.71.150:1316/
Webbench - Simple Web Benchmark 1.5
Copyright (c) Radim Kolar 1997-2004, GPL Open Source Software.

Benchmarking: GET http://116.196.71.150:1316/
10000 clients, running 5 sec.

Speed=13212 pages/min, 814234 bytes/sec.
Requests: 1101 susceed, 0 failed.


## Thanks
Linux高性能服务器编程，游双著. 

[@qinguoyi](https://github.com/qinguoyi/TinyWebServer)

[@markparticle](https://github.com/markparticle/WebServer)

[@JehanRio](https://github.com/JehanRio/TinyWebServer)
