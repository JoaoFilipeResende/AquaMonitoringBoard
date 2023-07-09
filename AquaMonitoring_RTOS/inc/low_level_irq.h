#ifndef LOW_LEVEL_IRQ_H
#define LOW_LEVEL_IRQ_H

extern QueueHandle_t xQueueUSART1_TX;
extern QueueHandle_t xQueueUSART1_RX;

extern QueueHandle_t xQueueUSART2_TX;
extern QueueHandle_t xQueueUSART2_RX;

extern QueueHandle_t xQueueUSART3_TX;
extern QueueHandle_t xQueueUSART3_RX;

extern QueueHandle_t xQueueUSART4_TX;
extern QueueHandle_t xQueueUSART4_RX;

extern QueueHandle_t xQueueUSART5_TX;
extern QueueHandle_t xQueueUSART5_RX;

void USART1_RX (void);
void USART1_TX (void);

void USART2_RX (void);
void USART2_TX (void);

void USART3_RX (void);
void USART3_TX (void);

void USART4_RX (void);
void USART4_TX (void);

void USART5_RX (void);
void USART5_TX (void);

#endif


