#include "vl53l0x_platform.h"
#include "vl53l0x_api.h"
#include "stm32l4xx_hal.h"

// Reference the I2C handle from your main.c
extern I2C_HandleTypeDef hi2c1; 

// A standard timeout for I2C operations
#define I2C_TIME_OUT_BASE   100 

VL53L0X_Error VL53L0X_WriteMulti(VL53L0X_DEV Dev, uint8_t index, uint8_t *pdata, uint32_t count) {
    HAL_StatusTypeDef status = HAL_I2C_Mem_Write(&hi2c1, Dev->I2cDevAddr, index, I2C_MEMADD_SIZE_8BIT, pdata, (uint16_t)count, I2C_TIME_OUT_BASE);
    return (status == HAL_OK) ? VL53L0X_ERROR_NONE : VL53L0X_ERROR_CONTROL_INTERFACE;
}

VL53L0X_Error VL53L0X_ReadMulti(VL53L0X_DEV Dev, uint8_t index, uint8_t *pdata, uint32_t count) {
    HAL_StatusTypeDef status = HAL_I2C_Mem_Read(&hi2c1, Dev->I2cDevAddr, index, I2C_MEMADD_SIZE_8BIT, pdata, (uint16_t)count, I2C_TIME_OUT_BASE);
    return (status == HAL_OK) ? VL53L0X_ERROR_NONE : VL53L0X_ERROR_CONTROL_INTERFACE;
}

VL53L0X_Error VL53L0X_WrByte(VL53L0X_DEV Dev, uint8_t index, uint8_t data) {
    return VL53L0X_WriteMulti(Dev, index, &data, 1);
}

VL53L0X_Error VL53L0X_WrWord(VL53L0X_DEV Dev, uint8_t index, uint16_t data) {
    uint8_t buf[2];
    buf[0] = data >> 8;
    buf[1] = data & 0x00FF;
    return VL53L0X_WriteMulti(Dev, index, buf, 2);
}

VL53L0X_Error VL53L0X_WrDWord(VL53L0X_DEV Dev, uint8_t index, uint32_t data) {
    uint8_t buf[4];
    buf[0] = (data >> 24) & 0xFF;
    buf[1] = (data >> 16) & 0xFF;
    buf[2] = (data >> 8)  & 0xFF;
    buf[3] = (data >> 0)  & 0xFF;
    return VL53L0X_WriteMulti(Dev, index, buf, 4);
}

VL53L0X_Error VL53L0X_RdByte(VL53L0X_DEV Dev, uint8_t index, uint8_t *data) {
    return VL53L0X_ReadMulti(Dev, index, data, 1);
}

VL53L0X_Error VL53L0X_RdWord(VL53L0X_DEV Dev, uint8_t index, uint16_t *data) {
    uint8_t buf[2];
    VL53L0X_Error status = VL53L0X_ReadMulti(Dev, index, buf, 2);
    *data = ((uint16_t)buf[0] << 8) | buf[1];
    return status;
}

VL53L0X_Error VL53L0X_RdDWord(VL53L0X_DEV Dev, uint8_t index, uint32_t *data) {
    uint8_t buf[4];
    VL53L0X_Error status = VL53L0X_ReadMulti(Dev, index, buf, 4);
    *data = ((uint32_t)buf[0] << 24) | ((uint32_t)buf[1] << 16) | ((uint32_t)buf[2] << 8) | buf[3];
    return status;
}

VL53L0X_Error VL53L0X_UpdateByte(VL53L0X_DEV Dev, uint8_t index, uint8_t AndData, uint8_t OrData) {
    uint8_t data;
    VL53L0X_Error status = VL53L0X_RdByte(Dev, index, &data);
    if (status == VL53L0X_ERROR_NONE) {
        data = (data & AndData) | OrData;
        status = VL53L0X_WrByte(Dev, index, data);
    }
    return status;
}

VL53L0X_Error VL53L0X_Delay(uint32_t msec) {
    HAL_Delay(msec);
    return VL53L0X_ERROR_NONE;
}

VL53L0X_Error VL53L0X_PollingDelay(VL53L0X_DEV Dev) {
    // Delay for 1 millisecond during polling loops to prevent CPU hogging
    HAL_Delay(1);
    return VL53L0X_ERROR_NONE;
}