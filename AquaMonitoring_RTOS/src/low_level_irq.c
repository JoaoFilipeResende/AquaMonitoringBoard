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
#include "low_level_irq.h"

void USARTn_RX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	uint16_t RxData = USART_ReceiveData(USART1);

	xQueueSendToBackFromISR( xQueueUSART1_RX, &RxData, &pxHigherPriorityTaskWoken );

	if(RxData=='\0')
	{
		USART_ClearITPendingBit(USART1, USART_IT_RXNE);
		USART_ClearFlag(USART1,USART_FLAG_RXNE);
	}

	if( pxHigherPriorityTaskWoken == pdTRUE )
	{
		taskYIELD(); //Forces a context switch before exit the ISR.
	}
}

void USARTn_TX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	char TxData;

	if (xQueueReceiveFromISR( xQueueUSART1_TX, &TxData, &pxHigherPriorityTaskWoken ) == pdTRUE)
	{
		USART_SendData(USART1, (uint16_t)TxData);
	}
	else
	{
		USART_ITConfig(USART1, USART_IT_TXE, DISABLE);
	}

	if( pxHigherPriorityTaskWoken == pdTRUE )
	{
		taskYIELD(); //Forces a context switch before exit the ISR.
	}
}



void USART1_RX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	uint16_t RxData = USART_ReceiveData(USART1);

	xQueueSendToBackFromISR( xQueueUSART1_RX, &RxData, &pxHigherPriorityTaskWoken );

	if(RxData=='\0')
	{
		USART_ClearITPendingBit(USART1, USART_IT_RXNE);
		USART_ClearFlag(USART1,USART_FLAG_RXNE);
	}

	if( pxHigherPriorityTaskWoken == pdTRUE )
	{
		taskYIELD(); //Forces a context switch before exit the ISR.
	}
}

void USART1_TX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	char TxData;

	if (xQueueReceiveFromISR( xQueueUSART1_TX, &TxData, &pxHigherPriorityTaskWoken ) == pdTRUE)
	{
		USART_SendData(USART1, (uint16_t)TxData);
	}
	else
	{
		USART_ITConfig(USART1, USART_IT_TXE, DISABLE);
	}

	if( pxHigherPriorityTaskWoken == pdTRUE )
	{
		taskYIELD(); //Forces a context switch before exit the ISR.
	}
}

void USART2_RX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	uint16_t RxData = USART_ReceiveData(USART2);

	xQueueSendToBackFromISR( xQueueUSART2_RX, &RxData, &pxHigherPriorityTaskWoken );

	if(RxData=='\0')
	{
		USART_ClearITPendingBit(USART2, USART_IT_RXNE);
		USART_ClearFlag(USART2,USART_FLAG_RXNE);
	}
}

void USART2_TX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	char TxData;

	if (xQueueReceiveFromISR( xQueueUSART2_TX, &TxData, &pxHigherPriorityTaskWoken ) == pdTRUE)
	{
		USART_SendData(USART2, (uint16_t)TxData);
	}
	else
	{
		USART_ITConfig(USART2, USART_IT_TXE, DISABLE);
	}

	if( pxHigherPriorityTaskWoken == pdTRUE )
	{
		taskYIELD(); //Forces a context switch before exit the ISR.
	}
}

void USART3_RX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	uint16_t RxData = USART_ReceiveData(USART3);

	xQueueSendToBackFromISR( xQueueUSART3_RX, &RxData, &pxHigherPriorityTaskWoken );

	if(RxData=='\0')
	{
		USART_ClearITPendingBit(USART3, USART_IT_RXNE);
		USART_ClearFlag(USART3,USART_FLAG_RXNE);
	}
}

void USART3_TX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	//TX
	char TxData;

	if (xQueueReceiveFromISR( xQueueUSART3_TX, &TxData, &pxHigherPriorityTaskWoken ) == pdTRUE)
	{
		USART_SendData(USART3, (uint16_t)TxData);
	}
	else
	{
		USART_ITConfig(USART3, USART_IT_TXE, DISABLE);
	}

	if( pxHigherPriorityTaskWoken == pdTRUE )
	{
		taskYIELD(); //Forces a context switch before exit the ISR.
	}
}

void USART4_RX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	uint16_t RxData = USART_ReceiveData(USART4);

	xQueueSendToBackFromISR( xQueueUSART4_RX, &RxData, &pxHigherPriorityTaskWoken );

	if(RxData=='\0')
	{
		USART_ClearITPendingBit(USART4, USART_IT_RXNE);
		USART_ClearFlag(USART4,USART_FLAG_RXNE);
	}
}

void USART4_TX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	char TxData;

	if (xQueueReceiveFromISR( xQueueUSART4_TX, &TxData, &pxHigherPriorityTaskWoken ) == pdTRUE)
	{
		USART_SendData(USART4, (uint16_t)TxData);
	}
	else
	{
		USART_ITConfig(USART4, USART_IT_TXE, DISABLE);
	}

	if( pxHigherPriorityTaskWoken == pdTRUE )
	{
		taskYIELD(); //Forces a context switch before exit the ISR.
	}
}

void USART5_RX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	uint16_t RxData = USART_ReceiveData(USART5);

	xQueueSendToBackFromISR( xQueueUSART5_RX, &RxData, &pxHigherPriorityTaskWoken );

	if(RxData=='\0')
	{
		USART_ClearITPendingBit(USART5, USART_IT_RXNE);
		USART_ClearFlag(USART5,USART_FLAG_RXNE);
	}
}

void USART5_TX (void)
{
	static BaseType_t pxHigherPriorityTaskWoken;

	//TX
	char TxData;

	if (xQueueReceiveFromISR( xQueueUSART5_TX, &TxData, &pxHigherPriorityTaskWoken ) == pdTRUE)
	{
		USART_SendData(USART5, (uint16_t)TxData);
	}
	else
	{
		USART_ITConfig(USART5, USART_IT_TXE, DISABLE);
	}

	if( pxHigherPriorityTaskWoken == pdTRUE )
	{
		taskYIELD(); //Forces a context switch before exit the ISR.
	}
}
