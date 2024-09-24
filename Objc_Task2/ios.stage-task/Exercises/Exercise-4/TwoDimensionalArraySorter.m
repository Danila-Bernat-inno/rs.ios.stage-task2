#import "TwoDimensionalArraySorter.h"
#import "NSMutableArray+Extension/NSObject+NSMutableArray_SortedInsert.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *resultStrings = [NSMutableArray new];
    NSMutableArray *resultNumbers = [NSMutableArray new];

    if ([array count] > 0 && ![array[0] isKindOfClass:[NSArray class]]) { return @[]; }


    for (NSArray *subArray in array) {
        for (id element in subArray) {
            if ([element isKindOfClass:[NSString class]]) {
                [resultStrings insertObjectInSortedOrder:element];
            } else if ([element isKindOfClass:[NSNumber class]]) {
                [resultNumbers insertObjectInSortedOrder:element];
            }
        }
    }

    if ([resultNumbers count] > 0 && [resultStrings count] > 0) {
        return @[resultNumbers, resultStrings];
    } else {
        if ([resultNumbers count] > 0) {
            return resultNumbers;
        } else {
            return resultStrings;
        }
    }
}

@end
