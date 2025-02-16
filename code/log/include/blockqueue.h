#ifndef BLOCKQUEUE_H
#define BLOCKQUEUE_H

#include <deque>
#include <condition_variable>
#include <mutex>
#include <sys/time.h>

template <typename T>
class BlockQueue
{
public:
    explicit BlockQueue(size_t maxsize = 1000);
    ~BlockQueue();
    bool empty();
    bool full();
    void push_back(const T &item);
    void push_front(const T &item);
    bool pop(T &item);              // 弹出的任务放入item
    bool pop(T &item, int timeout); // 等待时间
    void clear();
    T front();
    T back();
    size_t capacity();
    size_t size();

    void flush();
    void Close();

private:
    std::deque<T> deq_;                    // 底层数据结构
    std::mutex mtx_;                       // 锁
    bool isClose_;                         // 关闭标志
    size_t capacity_;                      // 容量
    std::condition_variable condConsumer_; // 消费者条件变量
    std::condition_variable condProducer_; // 生产者条件变量
};

template <typename T>
BlockQueue<T>::BlockQueue(size_t maxsize) : capacity_(maxsize)
{
    assert(maxsize > 0);
    isClose_ = false;
}

template <typename T>
BlockQueue<T>::~BlockQueue()
{
    Close();
}

template <typename T>
void BlockQueue<T>::Close()
{
    // lock_guard<mutex> locker(mtx_); // 操控队列之前，都需要上锁
    // deq_.clear();                   // 清空队列
    clear();
    isClose_ = true;
    condConsumer_.notify_all();
    condProducer_.notify_all();
}

template <typename T>
void BlockQueue<T>::clear()
{
    std::lock_guard<std::mutex> locker(mtx_);
    deq_.clear();
}

template <typename T>
bool BlockQueue<T>::empty()
{
    std::lock_guard<std::mutex> locker(mtx_);
    return deq_.empty();
}

template <typename T>
bool BlockQueue<T>::full()
{
    std::lock_guard<std::mutex> locker(mtx_);
    return deq_.size() >= capacity_;
}

template <typename T>
void BlockQueue<T>::push_back(const T &item)
{
    // 注意，条件变量需要搭配unique_lock
    std::unique_lock<std::mutex> locker(mtx_);
    while (deq_.size() >= capacity_)
    {                               // 队列满了，需要等待
        condProducer_.wait(locker); // 暂停生产，等待消费者唤醒生产条件变量
    }
    deq_.push_back(item);
    condConsumer_.notify_one(); // 唤醒消费者
}

template <typename T>
void BlockQueue<T>::push_front(const T &item)
{
    std::unique_lock<std::mutex> locker(mtx_);
    while (deq_.size() >= capacity_)
    {                               // 队列满了，需要等待
        condProducer_.wait(locker); // 暂停生产，等待消费者唤醒生产条件变量
    }
    deq_.push_front(item);
    condConsumer_.notify_one(); // 唤醒消费者
}

template <typename T>
bool BlockQueue<T>::pop(T &item)
{
    std::unique_lock<std::mutex> locker(mtx_);
    while (deq_.empty())
    {
        condConsumer_.wait(locker); // 队列空了，需要等待
    }
    item = deq_.front();
    deq_.pop_front();
    condProducer_.notify_one(); // 唤醒生产者
    return true;
}

template <typename T>
bool BlockQueue<T>::pop(T &item, int timeout)
{
    std::unique_lock<std::mutex> locker(mtx_);
    while (deq_.empty())
    {
        if (condConsumer_.wait_for(locker, std::chrono::seconds(timeout)) == std::cv_status::timeout)
        {
            return false;
        }
        if (isClose_)
        {
            return false;
        }
    }
    item = deq_.front();
    deq_.pop_front();
    condProducer_.notify_one();
    return true;
}

template <typename T>
T BlockQueue<T>::front()
{
    std::lock_guard<std::mutex> locker(mtx_);
    return deq_.front();
}

template <typename T>
T BlockQueue<T>::back()
{
    std::lock_guard<std::mutex> locker(mtx_);
    return deq_.back();
}

template <typename T>
size_t BlockQueue<T>::capacity()
{
    std::lock_guard<std::mutex> locker(mtx_);
    return capacity_;
}

template <typename T>
size_t BlockQueue<T>::size()
{
    std::lock_guard<std::mutex> locker(mtx_);
    return deq_.size();
}

// 唤醒消费者
template <typename T>
void BlockQueue<T>::flush()
{
    condConsumer_.notify_one();
}
#endif