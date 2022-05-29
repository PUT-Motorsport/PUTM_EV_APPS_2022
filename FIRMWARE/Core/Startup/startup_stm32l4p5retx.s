# 0 "../Core/Startup/startup_stm32l4p5retx.S"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "../Core/Startup/startup_stm32l4p5retx.S"
# 28 "../Core/Startup/startup_stm32l4p5retx.S"
  .syntax unified
 .cpu cortex-m4
 .fpu softvfp
 .thumb

.global g_pfnVectors
.global Default_Handler



.word _sidata

.word _sdata

.word _edata

.word _sbss

.word _ebss

.equ BootRAM, 0xF1E0F85F
# 58 "../Core/Startup/startup_stm32l4p5retx.S"
    .section .text.Reset_Handler
 .weak Reset_Handler
 .type Reset_Handler, %function
Reset_Handler:
  ldr sp, =_estack


    bl SystemInit


  ldr r0, =_sdata
  ldr r1, =_edata
  ldr r2, =_sidata
  movs r3, #0
  b LoopCopyDataInit

CopyDataInit:
  ldr r4, [r2, r3]
  str r4, [r0, r3]
  adds r3, r3, #4

LoopCopyDataInit:
  adds r4, r0, r3
  cmp r4, r1
  bcc CopyDataInit


  ldr r2, =_sbss
  ldr r4, =_ebss
  movs r3, #0
  b LoopFillZerobss

FillZerobss:
  str r3, [r2]
  adds r2, r2, #4

LoopFillZerobss:
  cmp r2, r4
  bcc FillZerobss


    bl __libc_init_array

 bl main

LoopForever:
    b LoopForever

.size Reset_Handler, .-Reset_Handler
# 116 "../Core/Startup/startup_stm32l4p5retx.S"
    .section .text.Default_Handler,"ax",%progbits
Default_Handler:
Infinite_Loop:
 b Infinite_Loop
 .size Default_Handler, .-Default_Handler







  .section .isr_vector,"a",%progbits
 .type g_pfnVectors, %object
 .size g_pfnVectors, .-g_pfnVectors


g_pfnVectors:
 .word _estack
 .word Reset_Handler
 .word NMI_Handler
 .word HardFault_Handler
 .word MemManage_Handler
 .word BusFault_Handler
 .word UsageFault_Handler
 .word 0
 .word 0
 .word 0
 .word 0
 .word SVC_Handler
 .word DebugMon_Handler
 .word 0
 .word PendSV_Handler
 .word SysTick_Handler
 .word WWDG_IRQHandler
 .word PVD_PVM_IRQHandler
 .word TAMP_STAMP_IRQHandler
 .word RTC_WKUP_IRQHandler
 .word FLASH_IRQHandler
 .word RCC_IRQHandler
 .word EXTI0_IRQHandler
 .word EXTI1_IRQHandler
 .word EXTI2_IRQHandler
 .word EXTI3_IRQHandler
 .word EXTI4_IRQHandler
 .word DMA1_Channel1_IRQHandler
 .word DMA1_Channel2_IRQHandler
 .word DMA1_Channel3_IRQHandler
 .word DMA1_Channel4_IRQHandler
 .word DMA1_Channel5_IRQHandler
 .word DMA1_Channel6_IRQHandler
 .word DMA1_Channel7_IRQHandler
 .word ADC1_2_IRQHandler
 .word CAN1_TX_IRQHandler
 .word CAN1_RX0_IRQHandler
 .word CAN1_RX1_IRQHandler
 .word CAN1_SCE_IRQHandler
 .word EXTI9_5_IRQHandler
 .word TIM1_BRK_TIM15_IRQHandler
 .word TIM1_UP_TIM16_IRQHandler
 .word TIM1_TRG_COM_TIM17_IRQHandler
 .word TIM1_CC_IRQHandler
 .word TIM2_IRQHandler
 .word TIM3_IRQHandler
 .word TIM4_IRQHandler
 .word I2C1_EV_IRQHandler
 .word I2C1_ER_IRQHandler
 .word I2C2_EV_IRQHandler
 .word I2C2_ER_IRQHandler
 .word SPI1_IRQHandler
 .word SPI2_IRQHandler
 .word USART1_IRQHandler
 .word USART2_IRQHandler
 .word USART3_IRQHandler
 .word EXTI15_10_IRQHandler
 .word RTC_Alarm_IRQHandler
 .word 0
 .word TIM8_BRK_IRQHandler
 .word TIM8_UP_IRQHandler
 .word TIM8_TRG_COM_IRQHandler
 .word TIM8_CC_IRQHandler
 .word SDMMC2_IRQHandler
 .word FMC_IRQHandler
 .word SDMMC1_IRQHandler
 .word TIM5_IRQHandler
 .word SPI3_IRQHandler
 .word UART4_IRQHandler
 .word UART5_IRQHandler
 .word TIM6_DAC_IRQHandler
 .word TIM7_IRQHandler
 .word DMA2_Channel1_IRQHandler
 .word DMA2_Channel2_IRQHandler
 .word DMA2_Channel3_IRQHandler
 .word DMA2_Channel4_IRQHandler
 .word DMA2_Channel5_IRQHandler
 .word DFSDM1_FLT0_IRQHandler
 .word DFSDM1_FLT1_IRQHandler
 .word 0
 .word COMP_IRQHandler
 .word LPTIM1_IRQHandler
 .word LPTIM2_IRQHandler
 .word OTG_FS_IRQHandler
 .word DMA2_Channel6_IRQHandler
 .word DMA2_Channel7_IRQHandler
 .word LPUART1_IRQHandler
 .word OCTOSPI1_IRQHandler
 .word I2C3_EV_IRQHandler
 .word I2C3_ER_IRQHandler
 .word SAI1_IRQHandler
 .word SAI2_IRQHandler
 .word OCTOSPI2_IRQHandler
 .word TSC_IRQHandler
 .word 0
 .word 0
 .word RNG_IRQHandler
 .word FPU_IRQHandler
 .word HASH_CRS_IRQHandler
 .word I2C4_ER_IRQHandler
 .word I2C4_EV_IRQHandler
 .word DCMI_PSSI_IRQHandler
 .word 0
 .word 0
 .word 0
 .word 0
 .word DMA2D_IRQHandler
 .word LTDC_IRQHandler
 .word LTDC_ER_IRQHandler
 .word 0
 .word DMAMUX1_OVR_IRQHandler
# 255 "../Core/Startup/startup_stm32l4p5retx.S"
  .weak NMI_Handler
 .thumb_set NMI_Handler,Default_Handler

  .weak HardFault_Handler
 .thumb_set HardFault_Handler,Default_Handler

  .weak MemManage_Handler
 .thumb_set MemManage_Handler,Default_Handler

  .weak BusFault_Handler
 .thumb_set BusFault_Handler,Default_Handler

 .weak UsageFault_Handler
 .thumb_set UsageFault_Handler,Default_Handler

 .weak SVC_Handler
 .thumb_set SVC_Handler,Default_Handler

 .weak DebugMon_Handler
 .thumb_set DebugMon_Handler,Default_Handler

 .weak PendSV_Handler
 .thumb_set PendSV_Handler,Default_Handler

 .weak SysTick_Handler
 .thumb_set SysTick_Handler,Default_Handler

 .weak WWDG_IRQHandler
 .thumb_set WWDG_IRQHandler,Default_Handler

 .weak PVD_PVM_IRQHandler
 .thumb_set PVD_PVM_IRQHandler,Default_Handler

 .weak TAMP_STAMP_IRQHandler
 .thumb_set TAMP_STAMP_IRQHandler,Default_Handler

 .weak RTC_WKUP_IRQHandler
 .thumb_set RTC_WKUP_IRQHandler,Default_Handler

 .weak FLASH_IRQHandler
 .thumb_set FLASH_IRQHandler,Default_Handler

 .weak RCC_IRQHandler
 .thumb_set RCC_IRQHandler,Default_Handler

 .weak EXTI0_IRQHandler
 .thumb_set EXTI0_IRQHandler,Default_Handler

 .weak EXTI1_IRQHandler
 .thumb_set EXTI1_IRQHandler,Default_Handler

 .weak EXTI2_IRQHandler
 .thumb_set EXTI2_IRQHandler,Default_Handler

 .weak EXTI3_IRQHandler
 .thumb_set EXTI3_IRQHandler,Default_Handler

 .weak EXTI4_IRQHandler
 .thumb_set EXTI4_IRQHandler,Default_Handler

 .weak DMA1_Channel1_IRQHandler
 .thumb_set DMA1_Channel1_IRQHandler,Default_Handler

 .weak DMA1_Channel2_IRQHandler
 .thumb_set DMA1_Channel2_IRQHandler,Default_Handler

 .weak DMA1_Channel3_IRQHandler
 .thumb_set DMA1_Channel3_IRQHandler,Default_Handler

 .weak DMA1_Channel4_IRQHandler
 .thumb_set DMA1_Channel4_IRQHandler,Default_Handler

 .weak DMA1_Channel5_IRQHandler
 .thumb_set DMA1_Channel5_IRQHandler,Default_Handler

 .weak DMA1_Channel6_IRQHandler
 .thumb_set DMA1_Channel6_IRQHandler,Default_Handler

 .weak DMA1_Channel7_IRQHandler
 .thumb_set DMA1_Channel7_IRQHandler,Default_Handler

 .weak ADC1_2_IRQHandler
 .thumb_set ADC1_2_IRQHandler,Default_Handler

 .weak CAN1_TX_IRQHandler
 .thumb_set CAN1_TX_IRQHandler,Default_Handler

 .weak CAN1_RX0_IRQHandler
 .thumb_set CAN1_RX0_IRQHandler,Default_Handler

 .weak CAN1_RX1_IRQHandler
 .thumb_set CAN1_RX1_IRQHandler,Default_Handler

 .weak CAN1_SCE_IRQHandler
 .thumb_set CAN1_SCE_IRQHandler,Default_Handler

 .weak EXTI9_5_IRQHandler
 .thumb_set EXTI9_5_IRQHandler,Default_Handler

 .weak TIM1_BRK_TIM15_IRQHandler
 .thumb_set TIM1_BRK_TIM15_IRQHandler,Default_Handler

 .weak TIM1_UP_TIM16_IRQHandler
 .thumb_set TIM1_UP_TIM16_IRQHandler,Default_Handler

 .weak TIM1_TRG_COM_TIM17_IRQHandler
 .thumb_set TIM1_TRG_COM_TIM17_IRQHandler,Default_Handler

 .weak TIM1_CC_IRQHandler
 .thumb_set TIM1_CC_IRQHandler,Default_Handler

 .weak TIM2_IRQHandler
 .thumb_set TIM2_IRQHandler,Default_Handler

 .weak TIM3_IRQHandler
 .thumb_set TIM3_IRQHandler,Default_Handler

 .weak TIM4_IRQHandler
 .thumb_set TIM4_IRQHandler,Default_Handler

 .weak I2C1_EV_IRQHandler
 .thumb_set I2C1_EV_IRQHandler,Default_Handler

 .weak I2C1_ER_IRQHandler
 .thumb_set I2C1_ER_IRQHandler,Default_Handler

 .weak I2C2_EV_IRQHandler
 .thumb_set I2C2_EV_IRQHandler,Default_Handler

 .weak I2C2_ER_IRQHandler
 .thumb_set I2C2_ER_IRQHandler,Default_Handler

 .weak SPI1_IRQHandler
 .thumb_set SPI1_IRQHandler,Default_Handler

 .weak SPI2_IRQHandler
 .thumb_set SPI2_IRQHandler,Default_Handler

 .weak USART1_IRQHandler
 .thumb_set USART1_IRQHandler,Default_Handler

 .weak USART2_IRQHandler
 .thumb_set USART2_IRQHandler,Default_Handler

 .weak USART3_IRQHandler
 .thumb_set USART3_IRQHandler,Default_Handler

 .weak EXTI15_10_IRQHandler
 .thumb_set EXTI15_10_IRQHandler,Default_Handler

 .weak RTC_Alarm_IRQHandler
 .thumb_set RTC_Alarm_IRQHandler,Default_Handler

 .weak TIM8_BRK_IRQHandler
 .thumb_set TIM8_BRK_IRQHandler,Default_Handler

 .weak TIM8_UP_IRQHandler
 .thumb_set TIM8_UP_IRQHandler,Default_Handler

 .weak TIM8_TRG_COM_IRQHandler
 .thumb_set TIM8_TRG_COM_IRQHandler,Default_Handler

 .weak TIM8_CC_IRQHandler
 .thumb_set TIM8_CC_IRQHandler,Default_Handler

 .weak SDMMC2_IRQHandler
 .thumb_set SDMMC2_IRQHandler,Default_Handler

 .weak FMC_IRQHandler
 .thumb_set FMC_IRQHandler,Default_Handler

 .weak SDMMC1_IRQHandler
 .thumb_set SDMMC1_IRQHandler,Default_Handler

 .weak TIM5_IRQHandler
 .thumb_set TIM5_IRQHandler,Default_Handler

 .weak SPI3_IRQHandler
 .thumb_set SPI3_IRQHandler,Default_Handler

 .weak UART4_IRQHandler
 .thumb_set UART4_IRQHandler,Default_Handler

 .weak UART5_IRQHandler
 .thumb_set UART5_IRQHandler,Default_Handler

 .weak TIM6_DAC_IRQHandler
 .thumb_set TIM6_DAC_IRQHandler,Default_Handler

 .weak TIM7_IRQHandler
 .thumb_set TIM7_IRQHandler,Default_Handler

 .weak DMA2_Channel1_IRQHandler
 .thumb_set DMA2_Channel1_IRQHandler,Default_Handler

 .weak DMA2_Channel2_IRQHandler
 .thumb_set DMA2_Channel2_IRQHandler,Default_Handler

 .weak DMA2_Channel3_IRQHandler
 .thumb_set DMA2_Channel3_IRQHandler,Default_Handler

 .weak DMA2_Channel4_IRQHandler
 .thumb_set DMA2_Channel4_IRQHandler,Default_Handler

 .weak DMA2_Channel5_IRQHandler
 .thumb_set DMA2_Channel5_IRQHandler,Default_Handler

 .weak DFSDM1_FLT0_IRQHandler
 .thumb_set DFSDM1_FLT0_IRQHandler,Default_Handler

 .weak DFSDM1_FLT1_IRQHandler
 .thumb_set DFSDM1_FLT1_IRQHandler,Default_Handler

 .weak COMP_IRQHandler
 .thumb_set COMP_IRQHandler,Default_Handler

 .weak LPTIM1_IRQHandler
 .thumb_set LPTIM1_IRQHandler,Default_Handler

 .weak LPTIM2_IRQHandler
 .thumb_set LPTIM2_IRQHandler,Default_Handler

 .weak OTG_FS_IRQHandler
 .thumb_set OTG_FS_IRQHandler,Default_Handler

 .weak DMA2_Channel6_IRQHandler
 .thumb_set DMA2_Channel6_IRQHandler,Default_Handler

 .weak DMA2_Channel7_IRQHandler
 .thumb_set DMA2_Channel7_IRQHandler,Default_Handler

 .weak LPUART1_IRQHandler
 .thumb_set LPUART1_IRQHandler,Default_Handler

 .weak OCTOSPI1_IRQHandler
 .thumb_set OCTOSPI1_IRQHandler,Default_Handler

 .weak I2C3_EV_IRQHandler
 .thumb_set I2C3_EV_IRQHandler,Default_Handler

 .weak I2C3_ER_IRQHandler
 .thumb_set I2C3_ER_IRQHandler,Default_Handler

 .weak SAI1_IRQHandler
 .thumb_set SAI1_IRQHandler,Default_Handler

 .weak SAI2_IRQHandler
 .thumb_set SAI2_IRQHandler,Default_Handler

 .weak OCTOSPI2_IRQHandler
 .thumb_set OCTOSPI2_IRQHandler,Default_Handler

 .weak TSC_IRQHandler
 .thumb_set TSC_IRQHandler,Default_Handler

 .weak RNG_IRQHandler
 .thumb_set RNG_IRQHandler,Default_Handler

 .weak FPU_IRQHandler
 .thumb_set FPU_IRQHandler,Default_Handler

 .weak HASH_CRS_IRQHandler
 .thumb_set HASH_CRS_IRQHandler,Default_Handler

 .weak I2C4_ER_IRQHandler
 .thumb_set I2C4_ER_IRQHandler,Default_Handler

 .weak I2C4_EV_IRQHandler
 .thumb_set I2C4_EV_IRQHandler,Default_Handler

 .weak DCMI_PSSI_IRQHandler
 .thumb_set DCMI_PSSI_IRQHandler,Default_Handler

 .weak DMA2D_IRQHandler
 .thumb_set DMA2D_IRQHandler,Default_Handler

 .weak LTDC_IRQHandler
 .thumb_set LTDC_IRQHandler,Default_Handler

 .weak LTDC_ER_IRQHandler
 .thumb_set LTDC_ER_IRQHandler,Default_Handler

 .weak DMAMUX1_OVR_IRQHandler
 .thumb_set DMAMUX1_OVR_IRQHandler,Default_Handler
