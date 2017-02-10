#include "service_config.h"

static const int threadpool_threads_count = 20;


/**
 * @brief  Return the pre-defined threads count to initialize the threadpool.
 *
 * The return value is used to initializes a threadpool, as the input parameter 
 * num_threads in the API: threadpool thpool_init(int num_threads);
 *
 * @example
 *
 *    ..
 *    ..
 *
 * @param  N/A
 * @return num_threads   To be used to initializes a threadpool.
 *                       Default value: threadpool_threads_count
 */
int get_threadpool_threads_count()
{
    return threadpool_threads_count;
}
