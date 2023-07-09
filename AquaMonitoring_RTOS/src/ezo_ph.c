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
#include "ezo_ph.h"

bool pH_status (enum ph_commands_t command, char* status)
{
	switch (command)
	{
		case ph_baud_enum:
			send_string("Baud,?\r",usart_ph_enum);
			break;

		case ph_c_enum:
			send_string("C,?\r",usart_ph_enum);
			break;

		case ph_cal_enum:
			send_string("Cal,?\r",usart_ph_enum);
			break;

		case ph_d_enum:
			send_string("D,?\r",usart_ph_enum);
			break;

		case ph_i_enum:
			send_string("i\r",usart_ph_enum);
			break;

		case ph_l_enum:
			send_string("L,?\r",usart_ph_enum);
			break;

		case ph_m_enum:
			send_string("M,?\r",usart_ph_enum);
			break;

		case ph_name_enum:
			send_string("Name,?\r",usart_ph_enum);
			break;

		case ph_plock_enum:
			send_string("Plock,?\r",usart_ph_enum);
			break;

		case ph_s_enum:
			send_string("S,?\r",usart_ph_enum);
			break;

		case ph_status_enum:
			send_string("Status\r",usart_ph_enum);
			break;

		case ph_ok_enum:
			send_string("*OK,?\r",usart_ph_enum);
			break;

		default:
			break;
	}

	vTaskDelay( ( ( TickType_t ) 100 / portTICK_PERIOD_MS ) ); //wait for response from ezo_ph

	if( receive_string(usart_ph_enum, status) == true )
	{
		return true;
	}
	return false;
}

struct ezo_ph getpH ( void )
{
	struct ezo_ph r;

	char buffer_tx[50]={0}; /* largest string received: 40 characters */

	send_string("R\r",usart_ph_enum);

	vTaskDelay( ( ( TickType_t ) 800 / portTICK_PERIOD_MS ) ); /* ezo_ph takes up to 800ms to get a reading */

	receive_string(usart_ph_enum, buffer_tx);

	//send_string(buffer_tx,usart_pc_enum);

	r.reading = strtof(buffer_tx,NULL); /* second parameter is not used */

	return r;
}


