#include <stdio.h>
#include <pthread.h>
#include "../thpool.h"

#include <stdlib.h>
#include <unistd.h>

#include "test2.h"

static int task_alpha_1_count = 0;
static int task_alpha_2_count = 0;
static int task__beta_1_count = 0;

static pthread_mutex_t mutex_alpha_1 = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t mutex_alpha_2 = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t mutex__beta_1 = PTHREAD_MUTEX_INITIALIZER;

static void task_alpha_1();
static void task_alpha_2();
static void task__beta_1();

int run_test2()
{
    int i = 0;
    threadpool thpool_alpha;
    threadpool thpool__beta;
    
    puts("Making the 1st threadpool with 12 threads");
    thpool_alpha = thpool_init(12);
    
    puts("Making the 2nd threadpool with 40 threads");
    thpool__beta = thpool_init(40);
    
    
    puts("Adding 40 tasks to the 1st thread pool.");
    for (i = 0; i < 20; i++)
    {
        thpool_add_work(thpool_alpha, (void*)task_alpha_1, NULL);
        thpool_add_work(thpool_alpha, (void*)task_alpha_2, NULL);
    };
    
    puts("Adding 50 tasks to the 2nd thread pool.");
    for (i = 0; i < 50; i++)
    {
        thpool_add_work(thpool__beta, (void*)task__beta_1, NULL);
    }
    
    puts("Killing the 1st thread pool.");
    thpool_wait(thpool_alpha);
    thpool_destroy(thpool_alpha);
        
    puts("Killing the 2nd thread pool.");
    thpool_wait(thpool__beta);
    thpool_destroy(thpool__beta);
    
    return 0;
}

static void task_alpha_1()
{
    sleep(7);
    
    pthread_mutex_lock(&mutex_alpha_1);
    task_alpha_1_count++;
    printf("Thread alpha #%u working on *** task1: %d\n", (int)pthread_self(), task_alpha_1_count);
    pthread_mutex_unlock(&mutex_alpha_1);
}


static void task_alpha_2()
{
    sleep(2);
    
    pthread_mutex_lock(&mutex_alpha_2);
    task_alpha_2_count++;
    printf("Thread alpha #%u working on --- task2: %d\n", (int)pthread_self(), task_alpha_2_count);
    pthread_mutex_unlock(&mutex_alpha_2);
}

static void task__beta_1()
{
    sleep(1);
    
    pthread_mutex_lock(&mutex__beta_1);
    task__beta_1_count++;
    printf("Thread  beta #%u working on +++ task__beta_1: %d\n", (int)pthread_self(), task__beta_1_count);
    pthread_mutex_unlock(&mutex__beta_1);
}
