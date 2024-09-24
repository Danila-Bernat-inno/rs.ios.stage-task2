#import "TwoDimensionalArraySorter.h"
#import "NSMutableArray+Extension/NSObject+NSMutableArray_SortedInsert.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *resultStrings = [NSMutableArray new];
    NSMutableArray *resultNumbers = [NSMutableArray new];

    if ([array count] > 0 && ![array[0] isKindOfClass:[NSArray class]]) { return @[]; }

    Class currentSubarrayType;

    for (NSArray *subArray in array) {
        if ([subArray count] > 0) {
            currentSubarrayType = [subArray[0] class];
        }
        for (id element in subArray) {
            if ([element class] != currentSubarrayType) { return @[]; }

            if ([element isKindOfClass:[NSString class]]) {
                [resultStrings insertObjectInSortedOrder:element];
            } else if ([element isKindOfClass:[NSNumber class]]) {
                [resultNumbers insertObjectInSortedOrder:element];
            }
        }
    }

    if ([resultStrings count] > 0) { return resultStrings; } else {
        return resultNumbers;
    }
}

@end
