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
#include "ezo_rtd.h"

bool RTD_status (enum rtd_commands_t command, char* answer)
{
	switch (command)
	{
		case rtd_baud_enum:
			send_string("Baud,?\r",usart_temp_enum);
			break;

		case rtd_c_enum:
			send_string("C,?\r",usart_temp_enum);
			break;

		case rtd_cal_enum:
			send_string("Cal,?\r",usart_temp_enum);
			break;

		case rtd_d_enum:
			send_string("D,?\r",usart_temp_enum);
			break;

		case rtd_i_enum:
			send_string("i\r",usart_temp_enum);
			break;

		case rtd_l_enum:
			send_string("L,?\r",usart_temp_enum);
			break;

		case rtd_m_enum:
			send_string("M,?\r",usart_temp_enum);
			break;

		case rtd_name_enum:
			send_string("Name,?\r",usart_temp_enum);
			break;

		case rtd_plock_enum:
			send_string("Plock,?\r",usart_temp_enum);
			break;

		case rtd_s_enum:
			send_string("S,?\r",usart_temp_enum);
			break;

		case rtd_status_enum:
			send_string("Status\r",usart_temp_enum);
			break;

		case rtd_ok_enum:
			send_string("*OK,?\r",usart_temp_enum);
			break;

		default:
			break;
	}

	vTaskDelay( ( ( TickType_t ) 100 / portTICK_PERIOD_MS ) ); /* ezo_rtd takes up to 600ms to get a reading */

	if( receive_string(usart_temp_enum, answer) == true )
	{
		return true;
	}
	return false;
}

struct ezo_rtd getRTD ( void )
{
	struct ezo_rtd r;

	char buffer_tx[50]={1}; /* largest string received: 40 characters */

	send_string("R\r",usart_temp_enum);

	vTaskDelay( ( ( TickType_t ) 600 / portTICK_PERIOD_MS ) ); /* ezo_rtd takes up to 600ms to get a reading */

	receive_string(usart_temp_enum, buffer_tx);

	r.reading = strtof(buffer_tx,NULL); /* second parameter is not used */

	return r;
}
