################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/vl53LOx/core/src/vl53l0x_api.c \
../Core/vl53LOx/core/src/vl53l0x_api_calibration.c \
../Core/vl53LOx/core/src/vl53l0x_api_core.c \
../Core/vl53LOx/core/src/vl53l0x_api_ranging.c \
../Core/vl53LOx/core/src/vl53l0x_api_strings.c 

OBJS += \
./Core/vl53LOx/core/src/vl53l0x_api.o \
./Core/vl53LOx/core/src/vl53l0x_api_calibration.o \
./Core/vl53LOx/core/src/vl53l0x_api_core.o \
./Core/vl53LOx/core/src/vl53l0x_api_ranging.o \
./Core/vl53LOx/core/src/vl53l0x_api_strings.o 

C_DEPS += \
./Core/vl53LOx/core/src/vl53l0x_api.d \
./Core/vl53LOx/core/src/vl53l0x_api_calibration.d \
./Core/vl53LOx/core/src/vl53l0x_api_core.d \
./Core/vl53LOx/core/src/vl53l0x_api_ranging.d \
./Core/vl53LOx/core/src/vl53l0x_api_strings.d 


# Each subdirectory must supply rules for building sources it contributes
Core/vl53LOx/core/src/%.o Core/vl53LOx/core/src/%.su Core/vl53LOx/core/src/%.cyclo: ../Core/vl53LOx/core/src/%.c Core/vl53LOx/core/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L431xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Core/vl53LOx/core/inc -I../Core/vl53LOx/platform/inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-vl53LOx-2f-core-2f-src

clean-Core-2f-vl53LOx-2f-core-2f-src:
	-$(RM) ./Core/vl53LOx/core/src/vl53l0x_api.cyclo ./Core/vl53LOx/core/src/vl53l0x_api.d ./Core/vl53LOx/core/src/vl53l0x_api.o ./Core/vl53LOx/core/src/vl53l0x_api.su ./Core/vl53LOx/core/src/vl53l0x_api_calibration.cyclo ./Core/vl53LOx/core/src/vl53l0x_api_calibration.d ./Core/vl53LOx/core/src/vl53l0x_api_calibration.o ./Core/vl53LOx/core/src/vl53l0x_api_calibration.su ./Core/vl53LOx/core/src/vl53l0x_api_core.cyclo ./Core/vl53LOx/core/src/vl53l0x_api_core.d ./Core/vl53LOx/core/src/vl53l0x_api_core.o ./Core/vl53LOx/core/src/vl53l0x_api_core.su ./Core/vl53LOx/core/src/vl53l0x_api_ranging.cyclo ./Core/vl53LOx/core/src/vl53l0x_api_ranging.d ./Core/vl53LOx/core/src/vl53l0x_api_ranging.o ./Core/vl53LOx/core/src/vl53l0x_api_ranging.su ./Core/vl53LOx/core/src/vl53l0x_api_strings.cyclo ./Core/vl53LOx/core/src/vl53l0x_api_strings.d ./Core/vl53LOx/core/src/vl53l0x_api_strings.o ./Core/vl53LOx/core/src/vl53l0x_api_strings.su

.PHONY: clean-Core-2f-vl53LOx-2f-core-2f-src

