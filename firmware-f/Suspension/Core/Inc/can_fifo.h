#include <stdint.h>
typedef struct {
    uint8_t bytes[8];
} PackedCANMSG;

typedef struct{
  PackedCANMSG *buffer;
  volatile int head;
  volatile int tail;
  int max_len;
  volatile int count;
} CircularFIFO;
uint8_t fifo_init(CircularFIFO *f, PackedCANMSG *user_buffer, int size);
uint8_t fifo_is_empty(CircularFIFO *f);
uint8_t fifo_is_full(CircularFIFO *f);
uint8_t fifo_enqueue(CircularFIFO *f, PackedCANMSG message);
uint8_t fifo_dequeue(CircularFIFO *f, PackedCANMSG *message);
uint8_t calculateTimings(uint32_t sysClockSpeed, uint32_t targetSpeed, uint16_t* psc,uint16_t* arr);
void fifo_reset(CircularFIFO *f);
uint8_t calculateTimings(uint32_t sysClockSpeed, uint32_t targetSpeed, uint16_t* psc, uint16_t* arr);
