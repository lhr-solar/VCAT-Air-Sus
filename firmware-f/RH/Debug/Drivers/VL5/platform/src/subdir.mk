################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL5/platform/src/vl53l0x_platform.c 

OBJS += \
./Drivers/VL5/platform/src/vl53l0x_platform.o 

C_DEPS += \
./Drivers/VL5/platform/src/vl53l0x_platform.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL5/platform/src/%.o Drivers/VL5/platform/src/%.su Drivers/VL5/platform/src/%.cyclo: ../Drivers/VL5/platform/src/%.c Drivers/VL5/platform/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L431xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Drivers/VL5/platform/inc -I../Drivers/VL5/core/inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-VL5-2f-platform-2f-src

clean-Drivers-2f-VL5-2f-platform-2f-src:
	-$(RM) ./Drivers/VL5/platform/src/vl53l0x_platform.cyclo ./Drivers/VL5/platform/src/vl53l0x_platform.d ./Drivers/VL5/platform/src/vl53l0x_platform.o ./Drivers/VL5/platform/src/vl53l0x_platform.su

.PHONY: clean-Drivers-2f-VL5-2f-platform-2f-src

