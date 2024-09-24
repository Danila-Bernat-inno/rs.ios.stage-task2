#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    unsigned char reversed = 0;

    for (int i = 0; i < 8; i++) {
        UInt8 lastBit = n & 1;
        reversed <<= 1;
        reversed |= lastBit;
        n >>= 1;
    }

    return reversed;
}
