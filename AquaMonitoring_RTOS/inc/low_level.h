#ifndef LOW_LEVEL_H_
#define LOW_LEVEL_H_

#include <stdbool.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "queue.h"


/* Queue variable. Used by stm32f10x_it.c */
QueueHandle_t xQueueUSART1_TX;
QueueHandle_t xQueueUSART1_RX;

QueueHandle_t xQueueUSART2_TX;
QueueHandle_t xQueueUSART2_RX;

QueueHandle_t xQueueUSART3_TX;
QueueHandle_t xQueueUSART3_RX;

QueueHandle_t xQueueUSART4_TX;
QueueHandle_t xQueueUSART4_RX;

QueueHandle_t xQueueUSART5_TX;
QueueHandle_t xQueueUSART5_RX;

enum usart_t{
	usart_do_enum,
	usart_ph_enum,
	usart_temp_enum,
	usart_ec_enum,
	usart_pc_enum
};

void startup_lowlevel(void);
void send_char(char put_char, enum usart_t usart);
bool receive_string(enum usart_t usart, char *data);
void send_string(char *put_string, enum usart_t usart);
/***************************************/

#endif
