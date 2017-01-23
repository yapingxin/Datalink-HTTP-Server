#include <stdio.h>
#include <pthread.h>
#include "../thpool.h"

#include <stdlib.h>
#include <unistd.h>

#include "test1.h"

static int task1_count = 0;
static int task2_count = 0;

static pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t mutex2 = PTHREAD_MUTEX_INITIALIZER;

static void task1();
static void task2();

int run_test1()
{
    int i;
    
    puts("Making threadpool with 12 threads");
    threadpool thpool = thpool_init(12);
    
    puts("Adding 40 tasks to threadpool");
    
    for (i=0; i<20; i++)
    {
        thpool_add_work(thpool, (void*)task1, NULL);
        thpool_add_work(thpool, (void*)task2, NULL);
    };
    
    puts("Killing threadpool");
    
    thpool_wait(thpool);
    thpool_destroy(thpool);
    
    return 0;
}

static void task1()
{
    sleep(7);
    
    pthread_mutex_lock(&mutex1);
    task1_count++;
    printf("Thread #%u working on *** task1: %d\n", (int)pthread_self(), task1_count);
    pthread_mutex_unlock(&mutex1);
}


static void task2()
{
    sleep(2);
    
    pthread_mutex_lock(&mutex2);
    task2_count++;
    printf("Thread #%u working on --- task2: %d\n", (int)pthread_self(), task2_count);
    pthread_mutex_unlock(&mutex2);
}
