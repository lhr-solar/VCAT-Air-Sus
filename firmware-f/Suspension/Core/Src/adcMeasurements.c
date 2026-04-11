#include "adcMeasurements.h"

int16_t readADC(ADC_HandleTypeDef *hadc1) {
    HAL_ADC_Start(hadc1);
    if (HAL_ADC_PollForConversion(hadc1, 1000) == HAL_OK) {
        uint16_t adcValue = HAL_ADC_GetValue(hadc1);
        HAL_ADC_Stop(hadc1);
        return adcValue;
    }
    HAL_ADC_Stop(hadc1);
    return -1;
}