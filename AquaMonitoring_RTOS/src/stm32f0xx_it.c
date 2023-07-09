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

void USART1_IRQHandler(void)
{
	//RX
	if( USART_GetITStatus(USART1, USART_IT_RXNE) == SET )
	{
		USART1_RX();
	}

	//TX
	if( USART_GetITStatus(USART1, USART_IT_TXE) == SET )
	{
		USART1_TX();
	}
}

void USART2_IRQHandler(void)
{
	//RX
	if( USART_GetITStatus(USART2, USART_IT_RXNE) == SET )
	{
		USART2_RX();
	}

	//TX
	if( USART_GetITStatus(USART2, USART_IT_TXE) == SET )
	{
		USART2_TX();
	}
}

void USART3_8_IRQHandler(void)
{
	//RX
	if( USART_GetITStatus(USART3, USART_IT_RXNE) == SET )
	{
		USART3_RX();
	}
	if( USART_GetITStatus(USART4, USART_IT_RXNE) == SET )
	{
		USART4_RX();
	}
	if( USART_GetITStatus(USART5, USART_IT_RXNE) == SET )
	{
		USART5_RX();
	}

	//TX
	if( USART_GetITStatus(USART3, USART_IT_TXE) == SET )
	{
		USART3_TX();
	}
	if( USART_GetITStatus(USART4, USART_IT_TXE) == SET )
	{
		USART4_TX();
	}
	if( USART_GetITStatus(USART5, USART_IT_TXE) == SET )
	{
		USART5_TX();
	}
}
