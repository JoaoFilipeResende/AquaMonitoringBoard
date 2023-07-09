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
#include "ezo_ec.h"

bool EC_status (enum ec_commands_t command, char* status)
{
	switch (command)
	{
		case ec_baud_enum:
			send_string("Baud,?\r",usart_ec_enum);
			break;

		case ec_c_enum:
			send_string("C,?\r",usart_ec_enum);
			break;

		case ec_cal_enum:
			send_string("Cal,?\r",usart_ec_enum);
			break;

		case ec_d_enum:
			send_string("D,?\r",usart_ec_enum);
			break;

		case ec_i_enum:
			send_string("i\r",usart_ec_enum);
			break;

		case ec_l_enum:
			send_string("L,?\r",usart_ec_enum);
			break;

		case ec_m_enum:
			send_string("M,?\r",usart_ec_enum);
			break;

		case ec_name_enum:
			send_string("Name,?\r",usart_ec_enum);
			break;

		case ec_plock_enum:
			send_string("Plock,?\r",usart_ec_enum);
			break;

		case ec_s_enum:
			send_string("S,?\r",usart_ec_enum);
			break;

		case ec_status_enum:
			send_string("Status\r",usart_ec_enum);
			break;

		case ec_ok_enum:
			send_string("*OK,?\r",usart_ec_enum);
			break;

		default:
			break;
	}

	vTaskDelay( ( ( TickType_t ) 100 / portTICK_PERIOD_MS ) ); //wait for response from ezo_od

	if( receive_string(usart_ec_enum, status) == true )
	{
		return true;
	}
	return false;
}

struct ezo_ec getEC ( void )
{
	struct ezo_ec r;

	char buffer_tx[50]={0}; /* largest string received: 40 characters */

	send_string("R\r",usart_ec_enum);

	vTaskDelay( ( ( TickType_t ) 600 / portTICK_PERIOD_MS ) ); /* ezo_ec takes up to 600ms to get a reading */

	receive_string(usart_ec_enum, buffer_tx);

	r.reading = strtof(buffer_tx,NULL); /* second parameter is not used */

	return r;
}
