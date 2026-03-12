################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/vl53LOx/platform/src/vl53l0x_platform.c 

OBJS += \
./Core/vl53LOx/platform/src/vl53l0x_platform.o 

C_DEPS += \
./Core/vl53LOx/platform/src/vl53l0x_platform.d 


# Each subdirectory must supply rules for building sources it contributes
Core/vl53LOx/platform/src/%.o Core/vl53LOx/platform/src/%.su Core/vl53LOx/platform/src/%.cyclo: ../Core/vl53LOx/platform/src/%.c Core/vl53LOx/platform/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L431xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Core/vl53LOx/core/inc -I../Core/vl53LOx/platform/inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-vl53LOx-2f-platform-2f-src

clean-Core-2f-vl53LOx-2f-platform-2f-src:
	-$(RM) ./Core/vl53LOx/platform/src/vl53l0x_platform.cyclo ./Core/vl53LOx/platform/src/vl53l0x_platform.d ./Core/vl53LOx/platform/src/vl53l0x_platform.o ./Core/vl53LOx/platform/src/vl53l0x_platform.su

.PHONY: clean-Core-2f-vl53LOx-2f-platform-2f-src

