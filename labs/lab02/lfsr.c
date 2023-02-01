#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg) {
    /* YOUR CODE HERE */
    uint16_t zero_bit = 1 & *reg;
    uint16_t second_bit = 1 & (*reg>>2);
    uint16_t third_bit = 1 & (*reg>>3);
    uint16_t fifth_bit = 1 & (*reg>>5);
    (*reg) >>= 1;
    *reg |= ((zero_bit ^ second_bit ^ third_bit ^ fifth_bit) << 15);
}

