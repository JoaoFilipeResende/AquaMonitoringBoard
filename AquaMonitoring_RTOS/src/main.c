/**
  ******************************************************************************
  * @file    main.c
  * @author  AquaMonitoring
  * @version V1.0
  * @date    06/07/2023
  * @brief   FreeRTOS project for acquisitions of parameters from sensors using USART.
  ******************************************************************************
*/

/* Standard includes. */
#include <string.h>
#include <stdbool.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

/* Scheduler includes. */
#include <FreeRTOS.h>
#include <queue.h>
#include <semphr.h>
#include <task.h>

/* My includes. */
#include "my_task.h"


int main( void )
{
	init_tasks();

    /* Start the scheduler. */
	vTaskStartScheduler();

	/* Will only get here if there was not enough heap space to create the idle task. */
	return 0;
}
/*-----------------------------------------------------------*/
