// <title="threadpool.h">
#ifndef THREADPOOL_H
#define THREADPOOL_H

#include <vector>
#include <thread>
#include <memory>
#include <mutex>
#include <condition_variable>
#include <cassert>
#include <functional>
#include <queue>

class ThreadPool
{
private:
    std::vector<std::thread> threads_;
    std::queue<std::function<void()>> tasks_;
    std::mutex mtx_;
    std::condition_variable cond_;
    bool isClose_ = false;

public:
    // 默认四个线程可以修改
    explicit ThreadPool(int capacity = 4);
    // 删除默认构造函数
    ThreadPool() = delete;

    // 删除拷贝构造函数和拷贝赋值操作符
    ThreadPool(const ThreadPool &) = delete;
    ThreadPool &operator=(const ThreadPool &) = delete;

    // 使用默认移动构造函数和移动赋值操作符
    ThreadPool(ThreadPool &&) noexcept = default;
    ThreadPool &operator=(ThreadPool &&) noexcept = default;
    ~ThreadPool();

    template <class C>
    void AddTask(C &&task);
};

// 构造函数
inline ThreadPool::ThreadPool(int capacity)
{
    assert(capacity > 0);
    for (int i = 0; i < capacity; ++i)
    {
        threads_.emplace_back([this]
                              {
            while(true){
                
                std::function<void()> task;

                {
                    std::unique_lock<std::mutex> locker(mtx_);
                    cond_.wait(locker,[this]{return isClose_||!tasks_.empty();});
                    if(isClose_&&tasks_.empty()){
                        break;
                    }
                    task = std::move(tasks_.front());
                    tasks_.pop();
                }
                
                task();
                
            } });
    }
}

// 添加任务
template <class C>
inline void ThreadPool::AddTask(C &&task)
{
    {
        std::lock_guard<std::mutex> locker(mtx_);
        tasks_.emplace(std::forward<C>(task));
    }
    cond_.notify_one();
}

// 析构函数
inline ThreadPool::~ThreadPool()
{
    {
        std::lock_guard<std::mutex> locker(mtx_);
        isClose_ = true;
    }
    cond_.notify_all();
    for (auto &thread : threads_)
    {
        if (thread.joinable())
        {
            thread.join();
        }
    }
}

#endif // THREADPOOL_H