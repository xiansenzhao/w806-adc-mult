#ifndef __WM_RCC_H__
#define __WM_RCC_H__

#define RCC	((RCC_TypeDef *)RCC_BASE)

#define __HAL_RCC_ALL_CLK_DISABLE()		CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_ALL)

#define __HAL_RCC_SPI_CLK_ENABLE()		SET_BIT(RCC->CLK_EN, RCC_CLK_EN_LSPI)

#define __HAL_RCC_SPI_CLK_DISABLE()		CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_LSPI)

#define __HAL_RCC_PWM_CLK_ENABLE()		SET_BIT(RCC->CLK_EN, RCC_CLK_EN_PWM)

#define __HAL_RCC_PWM_CLK_DISABLE()		CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_PWM)

#define __HAL_RCC_ADC_CLK_ENABLE()		SET_BIT(RCC->CLK_EN, RCC_CLK_EN_ADC)

#define __HAL_RCC_ADC_CLK_DISABLE()		CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_ADC)

#define __HAL_RCC_GPIO_CLK_ENABLE()		SET_BIT(RCC->CLK_EN, RCC_CLK_EN_GPIO)

#define __HAL_RCC_GPIO_CLK_DISABLE()	CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_GPIO)

#define __HAL_RCC_UART0_CLK_ENABLE()	SET_BIT(RCC->CLK_EN, RCC_CLK_EN_UART0)

#define __HAL_RCC_UART0_CLK_DISABLE()	CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_UART0)

#define __HAL_RCC_UART1_CLK_ENABLE()	SET_BIT(RCC->CLK_EN, RCC_CLK_EN_UART1)

#define __HAL_RCC_UART1_CLK_DISABLE()	CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_UART1)

#define __HAL_RCC_UART2_CLK_ENABLE()	SET_BIT(RCC->CLK_EN, RCC_CLK_EN_UART2)

#define __HAL_RCC_UART2_CLK_DISABLE()	CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_UART2)

#define __HAL_RCC_UART3_CLK_ENABLE()	SET_BIT(RCC->CLK_EN, RCC_CLK_EN_UART3)

#define __HAL_RCC_UART3_CLK_DISABLE()	CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_UART3)

#define __HAL_RCC_UART4_CLK_ENABLE()	SET_BIT(RCC->CLK_EN, RCC_CLK_EN_UART4)

#define __HAL_RCC_UART4_CLK_DISABLE()	CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_UART4)

#define __HAL_RCC_UART5_CLK_ENABLE()	SET_BIT(RCC->CLK_EN, RCC_CLK_EN_UART5)

#define __HAL_RCC_UART5_CLK_DISABLE()	CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_UART5)

#define __HAL_RCC_TIM_CLK_ENABLE()		SET_BIT(RCC->CLK_EN, RCC_CLK_EN_TIMER)

#define __HAL_RCC_TIM_CLK_DISABLE()		CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_TIMER)

#define __HAL_RCC_I2C_CLK_ENABLE()		SET_BIT(RCC->CLK_EN, RCC_CLK_EN_I2C)

#define __HAL_RCC_I2C_CLK_DISABLE()		CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_I2C)

#define __HAL_RCC_TOUCH_CLK_ENABLE()	SET_BIT(RCC->CLK_EN, RCC_CLK_EN_TOUCH)

#define __HAL_RCC_TOUCH_CLK_DISABLE()	CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_TOUCH)

#define __HAL_RCC_DMA_CLK_ENABLE()		SET_BIT(RCC->CLK_EN, RCC_CLK_EN_DMA)

#define __HAL_RCC_DMA_CLK_DISABLE()		CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_DMA)

#define __HAL_RCC_I2S_CLK_ENABLE()		SET_BIT(RCC->CLK_EN, RCC_CLK_EN_I2S)

#define __HAL_RCC_I2S_CLK_DISABLE()		CLEAR_BIT(RCC->CLK_EN, RCC_CLK_EN_I2S)



#endif