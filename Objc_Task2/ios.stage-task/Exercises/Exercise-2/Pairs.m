#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSMutableDictionary *countDict = [NSMutableDictionary dictionary];

    // Create dictionary where:
    /// key – unique number
    /// value – repeating count
    for (NSNumber *number in array) {
        if (countDict[number]) {
            countDict[number] = @([countDict[number] integerValue] + 1);
        } else {
            countDict[number] = @1;
        }
    }

    int result = 0;

    for (NSNumber *uniqueNumber in countDict) {
        NSNumber *pair = @(uniqueNumber.intValue + number.intValue);
        if (countDict[pair]) {
            result += [countDict[uniqueNumber] intValue] * [countDict[pair] intValue];
        }
    }
    return result;
}

@end
