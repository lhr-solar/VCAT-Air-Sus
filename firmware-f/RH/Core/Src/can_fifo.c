#include "can_fifo.h"
uint8_t fifo_init(CircularFIFO *f, PackedCANMSG *user_buffer, int size) {
    f->buffer = user_buffer;
    f->max_len = size;
    f->tail = 0;
    f->head = 0;
    f->count = 0;
    return 1;
}

uint8_t fifo_is_empty(CircularFIFO *f) {
    return (f->count == 0);
}

uint8_t fifo_is_full(CircularFIFO *f) {
    if(f->count >= f->max_len){
        return 1;
    }else{
        return 0;
    }
}

uint8_t fifo_enqueue(CircularFIFO *f, PackedCANMSG message) {
  
    if(fifo_is_full(f)){
        return 0;
    }
    f->buffer[f->tail] = message;
    f->tail++;
    f->count++;
    if(f->tail >=  f->max_len){
        f->tail = 0;
    }
    return 1; 
}

uint8_t fifo_dequeue(CircularFIFO *f, PackedCANMSG *message) {
    if(fifo_is_empty(f)){
        return 0;
    }
    *message = f->buffer[f->head];
    f->head++;
    if(f->head >= f->max_len){
        f->head = 0;
    }
    f->count--;
    return 1;
}
void fifo_reset(CircularFIFO *f) {
    f->tail = 0;
    f->head = 0;
    f->count = 0;
    return;
}

uint8_t calculateTimings(uint32_t sysClockSpeed, uint32_t targetSpeed, uint16_t* psc, uint16_t* arr){
  
  uint32_t div = sysClockSpeed / targetSpeed; 
  
  if (div == 0 || (sysClockSpeed % targetSpeed != 0)) {
      return 0; // Cannot hit this exact frequency cleanly
  }
  for(uint32_t psc1 = 1; psc1 <= 65536; psc1++){
    if(div % psc1 == 0){
      uint32_t arr1 = div / psc1;
        // does it fit?? 
        if (arr1 <= 65536) {
            *psc = (uint16_t)(psc1 - 1);
            *arr = (uint16_t)(arr1 - 1);
            return 1; 
        }
    }
  }
  return 0;
}


