/* Standard includes. */
#include <string.h>
#include <stdbool.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <stm32f0xx.h>

/* Scheduler includes. */
#include <FreeRTOS.h>
#include <queue.h>
#include <semphr.h>
#include <task.h>

/* My includes. */
#include "my_task.h"
#include "ezo_rtd.h"
#include "ezo_ph.h"
#include "ezo_ec.h"
#include "ezo_do.h"

/* Task priorities. */
#define mainFLASH_TASK_PRIORITY	( tskIDLE_PRIORITY + 1)
/***************************************/

/* Tasks handle variable. */
TaskHandle_t HandleTask[2];
TaskHandle_t BlockedINFOTask;

enum taskenum
{
	HandleTask1,
	HandleTask2,
};


void init_tasks (void)
{
	startup_lowlevel();


	xTaskCreate( LeituraSensoresTask,		"LED_TOGGLE", 	configMINIMAL_STACK_SIZE+100,
						NULL, mainFLASH_TASK_PRIORITY, 	 &HandleTask[HandleTask1] );

}

void LeituraSensoresTask( void *pvParameters )
{
	ezo_rtd ezo_rtd;
	ezo_ph ezo_ph;
	ezo_do ezo_do;
	ezo_ec ezo_ec;

    char buffer_tx[50]={0}; /* largest string received: 40 characters */

    TickType_t xLastExecutionTime;
    xLastExecutionTime = xTaskGetTickCount();
    TickType_t one_second_delay = ( ( TickType_t ) 500 / portTICK_PERIOD_MS );

    for( ;; )
	{

    	//Acquire RTD measurement
    	ezo_rtd = getRTD();
    	sprintf(buffer_tx,"TEMP:%.2f\n",ezo_rtd.reading);
    	send_string(buffer_tx,usart_pc_enum);
    	memset(buffer_tx, 0, sizeof(buffer_tx));

		//Acquire pH measurement
		ezo_ph = getpH();
		sprintf(buffer_tx,"PH:%.2f\n",ezo_ph.reading);
		send_string(buffer_tx,usart_pc_enum);
		memset(buffer_tx, 0, sizeof(buffer_tx));

		//Acquire OD measurement
		ezo_do = getDO();
		sprintf(buffer_tx,"OD:%.2f\n",ezo_do.reading);
		send_string(buffer_tx,usart_pc_enum);

		//Acquire EC measurement
		ezo_ec = getEC();
		sprintf(buffer_tx,"EC:%.2f\n",ezo_ec.reading);
		send_string(buffer_tx,usart_pc_enum);

		vTaskDelayUntil( &xLastExecutionTime, one_second_delay );
	}
}
