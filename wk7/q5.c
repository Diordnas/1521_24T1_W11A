
#include <stdint.h>

const SIX_MASK 0x3F; // 0b0011 1111

uint32_t six_middle_bits(uint32_t u) {
    // Extract and return six middle bits

    // Shift right 13 bits
    u = u >> 13;

    // Mask using & so we have the last 6 bits
    u = u & SIX_MASK;

    return u;
}