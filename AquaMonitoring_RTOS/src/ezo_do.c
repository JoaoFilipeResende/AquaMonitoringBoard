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
#include "ezo_do.h"

bool DO_status (enum do_commands_t command, char* status)
{
	switch (command)
	{
		case do_baud_enum:
			send_string("Baud,?\r",usart_do_enum);
			break;

		case do_c_enum:
			send_string("C,?\r",usart_do_enum);
			break;

		case do_cal_enum:
			send_string("Cal,?\r",usart_do_enum);
			break;

		case do_d_enum:
			send_string("D,?\r",usart_do_enum);
			break;

		case do_i_enum:
			send_string("i\r",usart_do_enum);
			break;

		case do_l_enum:
			send_string("L,?\r",usart_do_enum);
			break;

		case do_m_enum:
			send_string("M,?\r",usart_do_enum);
			break;

		case do_name_enum:
			send_string("Name,?\r",usart_do_enum);
			break;

		case do_plock_enum:
			send_string("Plock,?\r",usart_do_enum);
			break;

		case do_s_enum:
			send_string("S,?\r",usart_do_enum);
			break;

		case do_status_enum:
			send_string("Status\r",usart_do_enum);
			break;

		case do_ok_enum:
			send_string("*OK,?\r",usart_do_enum);
			break;

		default:
			break;
	}

	vTaskDelay( ( ( TickType_t ) 100 / portTICK_PERIOD_MS ) ); //wait for response from ezo_do

	if( receive_string(usart_do_enum, status) == true )
	{
		return true;
	}
	return false;
}

struct ezo_do getDO ( void )
{
	struct ezo_do r;

	char buffer_tx[50]={0}; /* largest string received: 40 characters */

	send_string("R\r",usart_do_enum);

	vTaskDelay( ( ( TickType_t ) 600 / portTICK_PERIOD_MS ) ); /* ezo_do takes up to 600ms to get a reading */

	receive_string(usart_do_enum, buffer_tx);

	r.reading = strtof(buffer_tx,NULL); /* second parameter is not used */

	return r;
}
