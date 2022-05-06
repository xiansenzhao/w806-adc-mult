
#include <stdio.h>
#include "wm_hal.h"


//ADC
/* 
 * ADC_CHANNEL_0 	: channel 0
 * ADC_CHANNEL_1 	: channel 1
 * ADC_CHANNEL_2 	: channel 2
 * ADC_CHANNEL_3 	: channel 3
 * ADC_CHANNEL_0_1 	: channel 0 and channel 1 differential input
 * ADC_CHANNEL_2_3 	: channel 2 and channel 3 differential input */
					 
 /* 307hz ~ 2khz */
 
//ADC编号
#define ADC_1		0 	//PA1
#define ADC_2		1	//PA4
#define ADC_3		2	//PA3
#define ADC_4		3	//PA2
#define ADC_TEMP	4
#define ADC_VOL		5


void Error_Handler(void);
static void ADC_Init(uint32_t adc_num, uint32_t freq);
ADC_HandleTypeDef hadc[6];





int main(void)
{
	int value[6] = {0};
	
	SystemClock_Config(CPU_CLK_160M);
	printf("enter main\r\n");

	ADC_Init(ADC_1,1000);
	ADC_Init(ADC_2,1000);
	ADC_Init(ADC_3,1000);
	ADC_Init(ADC_4,1000);
	ADC_Init(ADC_TEMP,1000);
	ADC_Init(ADC_VOL,1000);
	

	while (1)
	{
		value[0] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_1]);
		value[1] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_2]);
		value[2] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_3]);
		value[3] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_4]);
		value[4] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_TEMP]);
		value[5] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_VOL]);
		for(int i=0;i<6;i++)
			printf("value%d: = %d ",i,value[i]);
		printf("\n");
		HAL_Delay(1000);
	}
}

static void ADC_Init(uint32_t adc_num, uint32_t freq)
{
	/* 
		//ADC_CHANNEL_0 : PA1
		//ADC_CHANNEL_1 : PA4
		//ADC_CHANNEL_2 : PA3
		//ADC_CHANNEL_3 : PA2
		//ADC_CHANNEL_0_1 : PA1 and PA4
		//ADC_CHANNEL_2_3 : PA3 and PA2
						 
	#define ADC_CHANNEL_0		ADC_ANA_CR_CH_0
	#define ADC_CHANNEL_1		ADC_ANA_CR_CH_1
	#define ADC_CHANNEL_2		ADC_ANA_CR_CH_2
	#define ADC_CHANNEL_3		ADC_ANA_CR_CH_3
	#define ADC_CHANNEL_0_1		ADC_ANA_CR_CH_8
	#define ADC_CHANNEL_2_3		ADC_ANA_CR_CH_9
	#define ADC_CHANNEL_VOL		ADC_ANA_CR_CH_VOL
	#define ADC_CHANNEL_TEMP	ADC_ANA_CR_CH_TEMP
	#define ADC_CHANNEL_OFFSET	ADC_ANA_CR_CH_OFFSET
*/

	uint32_t ADC_CHANNEL;
	 /* 307hz ~ 2khz */
	switch(adc_num)
	{
		case 0: ADC_CHANNEL = ADC_CHANNEL_0; break; 	//PA1
		case 1: ADC_CHANNEL = ADC_CHANNEL_1; break;		//PA4
		case 2: ADC_CHANNEL = ADC_CHANNEL_2; break;		//PA3
		case 3: ADC_CHANNEL = ADC_CHANNEL_3; break;		//PA2
		case 4: ADC_CHANNEL = ADC_CHANNEL_TEMP; break;
		case 5: ADC_CHANNEL = ADC_CHANNEL_VOL; break;
		default : printf("adc init ADC_CHANNEL err, The number of channels is not between 0 and 3 \r\n");return; break;
	}
	
	if(freq > 2000 || freq < 304)
		printf("adc freq too larger than 2khz or too lower than 307hz...please check...\n");
	
	hadc[adc_num].Instance = ADC;
	hadc[adc_num].Init.channel = ADC_CHANNEL;
	hadc[adc_num].Init.freq = freq;
	
	if (HAL_ADC_Init(&hadc[adc_num]) != HAL_OK)
	{
		Error_Handler();
	}
}


void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	
}

void Error_Handler(void)
{
	while (1)
	{
	}
}

void assert_failed(uint8_t *file, uint32_t line)
{
	printf("Wrong parameters value: file %s on line %d\r\n", file, line);
}