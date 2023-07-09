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
#include "low_level.h"

/* USART Semaphore */
SemaphoreHandle_t xSemaphoreMutex_USART;

static void initRCC (void);
static void initUSART1 (void);
static void initUSART2 (void);
static void initUSART3 (void);
static void initUSART4 (void);
static void initUSART5 (void);

#define BAUDRATE 9600
#define QUEUE_SIZE 100

uint16_t ADC1_Addr[1];

void startup_lowlevel(void)
{
	initRCC();

	xSemaphoreMutex_USART = xSemaphoreCreateMutex();

	initUSART1();  /* O.D  (PB6 -> TX / PB7 -> RX) */
	initUSART2();  /* pH   (PA2 -> TX / PA3 -> RX) */
	initUSART3();  /* RTD (PC4 -> TX / PC5 -> RX) */
	initUSART4();  /* EC   (PA0 -> TX / PA1 -> RX) */
	initUSART5();  /* PC   (PC12 -> TX / PD2 -> RX) */

}

void send_char(char put_char, enum usart_t usart)
{
	switch (usart)
	{
		case usart_do_enum:
			xQueueSendToBack( xQueueUSART1_TX, &put_char, ( TickType_t ) portMAX_DELAY );
			USART_ITConfig(USART1, USART_IT_TXE, ENABLE);
			break;

		case usart_ph_enum:
			xQueueSendToBack( xQueueUSART2_TX, &put_char, ( TickType_t ) portMAX_DELAY );
			USART_ITConfig(USART2, USART_IT_TXE, ENABLE);
			break;

		case usart_temp_enum:
			xQueueSendToBack( xQueueUSART3_TX, &put_char, ( TickType_t ) portMAX_DELAY );
			USART_ITConfig(USART3, USART_IT_TXE, ENABLE);
			break;

		case usart_ec_enum:
			xQueueSendToBack( xQueueUSART4_TX, &put_char, ( TickType_t ) portMAX_DELAY );
			USART_ITConfig(USART4, USART_IT_TXE, ENABLE);
			break;

		case usart_pc_enum:
			xQueueSendToBack( xQueueUSART5_TX, &put_char, ( TickType_t ) portMAX_DELAY );
			USART_ITConfig(USART5, USART_IT_TXE, ENABLE);
			break;

		default:
			break;
	}
}

bool receive_string(enum usart_t usart, char *data)
{
	xSemaphoreTake( xSemaphoreMutex_USART, (TickType_t)portMAX_DELAY);

	int i=0;

	switch (usart)
		{
			case usart_do_enum:
				if (uxQueueMessagesWaiting (xQueueUSART1_RX) != 0)
				{
					while ( uxQueueMessagesWaiting (xQueueUSART1_RX) != 0 )
					{
						xQueueReceive( xQueueUSART1_RX, &data[i],( TickType_t ) portMAX_DELAY);
						i++;
					}

					data[i]='\0';

					xSemaphoreGive( xSemaphoreMutex_USART );

					return true;
				}
				else
				{
					xSemaphoreGive( xSemaphoreMutex_USART );
					return false;
				}
				break;

			case usart_ph_enum:
				if (uxQueueMessagesWaiting (xQueueUSART2_RX) != 0)
				{
					while ( uxQueueMessagesWaiting (xQueueUSART2_RX) != 0 )
					{
						xQueueReceive( xQueueUSART2_RX, &data[i],( TickType_t ) portMAX_DELAY);
						i++;
					}

					data[i]='\0';

					xSemaphoreGive( xSemaphoreMutex_USART );

					return true;
				}
				else
				{
					xSemaphoreGive( xSemaphoreMutex_USART );
					return false;
				}
				break;

			case usart_temp_enum:
				if (uxQueueMessagesWaiting (xQueueUSART3_RX) != 0)
				{
					while ( uxQueueMessagesWaiting (xQueueUSART3_RX) != 0 )
					{
						xQueueReceive( xQueueUSART3_RX, &data[i],(TickType_t) portMAX_DELAY);
						i++;
					}

					data[i]='\0';

					xSemaphoreGive( xSemaphoreMutex_USART );

					return true;
				}
				else
				{
					xSemaphoreGive( xSemaphoreMutex_USART );
					return false;
				}
				break;

			case usart_ec_enum:
				if (uxQueueMessagesWaiting (xQueueUSART4_RX) != 0)
				{
					while ( uxQueueMessagesWaiting (xQueueUSART4_RX) != 0 )
					{
						xQueueReceive( xQueueUSART4_RX, &data[i],( TickType_t ) portMAX_DELAY);
						i++;
					}

					data[i]='\0';

					xSemaphoreGive( xSemaphoreMutex_USART );

					return true;
				}
				else
				{
					xSemaphoreGive( xSemaphoreMutex_USART );
					return false;
				}
				break;

			case usart_pc_enum:
				if (uxQueueMessagesWaiting (xQueueUSART5_RX) != 0)
				{
					while ( uxQueueMessagesWaiting (xQueueUSART5_RX) != 0 )
					{
						xQueueReceive( xQueueUSART5_RX, &data[i],( TickType_t ) portMAX_DELAY);
						i++;
					}

					data[i]='\0';

					xSemaphoreGive( xSemaphoreMutex_USART );

					return true;
				}
				else
				{
					xSemaphoreGive( xSemaphoreMutex_USART );
					return false;
				}
				break;

			default:
				break;
		}
	return false;
}

void send_string(char *put_string, enum usart_t usart)
{
	uint16_t cont_aux=0;
	size_t string_length = strlen(put_string);

	xSemaphoreTake( xSemaphoreMutex_USART, (TickType_t)portMAX_DELAY);

    while(cont_aux != string_length)
    {
    	switch (usart)
		{
			case usart_do_enum:
				send_char(put_string[cont_aux], usart_do_enum);
				cont_aux++;
				break;

			case usart_ph_enum:
				send_char(put_string[cont_aux], usart_ph_enum);
				cont_aux++;
				break;

			case usart_temp_enum:
				send_char(put_string[cont_aux], usart_temp_enum);
				cont_aux++;
				break;

			case usart_ec_enum:
				send_char(put_string[cont_aux], usart_ec_enum);
				cont_aux++;
				break;

			case usart_pc_enum:
				send_char(put_string[cont_aux], usart_pc_enum);
				cont_aux++;
				break;

			default:
				break;
		}
    }
    xSemaphoreGive( xSemaphoreMutex_USART );
}

static void initRCC( void )    /* RCC configuration - 48 MHz */
{
    ErrorStatus HSEStartUpStatus;

    RCC_DeInit();

    RCC_HSEConfig(RCC_HSE_ON);

    HSEStartUpStatus = RCC_WaitForHSEStartUp();
    if(HSEStartUpStatus == SUCCESS)
    {
        FLASH_PrefetchBufferCmd(ENABLE);
        FLASH_SetLatency(FLASH_Latency_1);


        RCC_HCLKConfig(RCC_SYSCLK_Div1);
        RCC_PLLConfig(RCC_PLLSource_PREDIV1, RCC_PLLMul_4);
        RCC_PLLCmd(ENABLE);
        while (RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET );

        RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
        while( RCC_GetSYSCLKSource() != 0x08 );
    }
    else
    {
        while(1);
    }
}

static void initUSART1 (void)/* O.D  (PB6 -> TX / PB7 -> RX) */
{
	xQueueUSART1_RX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );
	xQueueUSART1_TX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );

    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOB , ENABLE );

	GPIO_InitTypeDef GPIO_InitStructure;

    GPIO_PinAFConfig(GPIOB, GPIO_PinSource6, GPIO_AF_0);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_6; //TX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    GPIO_PinAFConfig(GPIOB, GPIO_PinSource7, GPIO_AF_0);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_7; //RX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);

    USART_InitTypeDef USART_InitStructure;

    USART_InitStructure.USART_BaudRate = BAUDRATE;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
    USART_Init(USART1, &USART_InitStructure);

    USART_Cmd(USART1, ENABLE);

    USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);

    NVIC_InitTypeDef NVIC_InitStructure;

	NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);
 }

static void initUSART2 (void)/* pH   (PA2 -> TX / PA3 -> RX) */
{
	xQueueUSART2_RX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );
	xQueueUSART2_TX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );

    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOA , ENABLE );

	GPIO_InitTypeDef GPIO_InitStructure;

    GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_1);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_2; //TX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    GPIO_PinAFConfig(GPIOA, GPIO_PinSource3, GPIO_AF_1);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_3; //RX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);

	USART_InitTypeDef USART_InitStructure;

    USART_InitStructure.USART_BaudRate = BAUDRATE;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
    USART_Init(USART2, &USART_InitStructure);

    USART_Cmd(USART2, ENABLE);

    USART_ITConfig(USART2, USART_IT_RXNE, ENABLE);

    NVIC_InitTypeDef NVIC_InitStructure;

	NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);
 }

static void initUSART3 (void)/* Temp (PC4 -> TX / PC5 -> RX) */
{
	xQueueUSART3_RX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );
	xQueueUSART3_TX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );

	RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOC , ENABLE );

	GPIO_InitTypeDef GPIO_InitStructure;

	GPIO_PinAFConfig(GPIOC, GPIO_PinSource4, GPIO_AF_1);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_4;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOC, &GPIO_InitStructure);

    GPIO_PinAFConfig(GPIOC, GPIO_PinSource5, GPIO_AF_1);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_5;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOC, &GPIO_InitStructure);

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE);

    USART_InitTypeDef USART_InitStructure;

    USART_InitStructure.USART_BaudRate = BAUDRATE;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
    USART_Init(USART3, &USART_InitStructure);

    USART_Cmd(USART3, ENABLE);

    USART_ITConfig(USART3, USART_IT_RXNE, ENABLE);

    NVIC_InitTypeDef NVIC_InitStructure;

    NVIC_InitStructure.NVIC_IRQChannel = USART3_8_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);
 }

static void initUSART4 (void)	/* EC (PA0 -> TX / PA1 -> RX) */
{
	xQueueUSART4_RX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );
	xQueueUSART4_TX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );

    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOA , ENABLE );

	GPIO_InitTypeDef GPIO_InitStructure;

    GPIO_PinAFConfig(GPIOA, GPIO_PinSource0, GPIO_AF_4);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_0; //TX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    GPIO_PinAFConfig(GPIOA, GPIO_PinSource1, GPIO_AF_4);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_1; //RX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART4, ENABLE);

	USART_InitTypeDef USART_InitStructure;

    USART_InitStructure.USART_BaudRate = BAUDRATE;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
    USART_Init(USART4, &USART_InitStructure);

    USART_Cmd(USART4, ENABLE);

    USART_ITConfig(USART4, USART_IT_RXNE, ENABLE);

    NVIC_InitTypeDef NVIC_InitStructure;

    NVIC_InitStructure.NVIC_IRQChannel = USART3_8_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);
 }


static void initUSART5 (void)/* PC   (PC12 -> TX / PD2 -> RX) */
{
	xQueueUSART5_RX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );
	xQueueUSART5_TX = xQueueCreate( QUEUE_SIZE, sizeof( char ) );

    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOC , ENABLE );

	GPIO_InitTypeDef GPIO_InitStructure;

    GPIO_PinAFConfig(GPIOC, GPIO_PinSource12, GPIO_AF_2);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_12; //TX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOC, &GPIO_InitStructure);

    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOD , ENABLE );

    GPIO_PinAFConfig(GPIOD, GPIO_PinSource2, GPIO_AF_2);
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_2; //RX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOD, &GPIO_InitStructure);

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART5, ENABLE);

	USART_InitTypeDef USART_InitStructure;

    USART_InitStructure.USART_BaudRate = BAUDRATE;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
    USART_Init(USART5, &USART_InitStructure);

    USART_Cmd(USART5, ENABLE);

    USART_ITConfig(USART5, USART_IT_RXNE, ENABLE);

    NVIC_InitTypeDef NVIC_InitStructure;

	NVIC_InitStructure.NVIC_IRQChannel = USART3_8_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);
 }
