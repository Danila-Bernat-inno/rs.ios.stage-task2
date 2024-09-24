//
//  NSObject+NSMutableArray_SortedInsert.m
//  ios.stage-task
//
//  Created by Danila Bernat on 24/09/2024.
//

#import "NSObject+NSMutableArray_SortedInsert.h"

@implementation NSMutableArray (SortedInsert)

- (void)insertObjectInSortedOrder:(id)object {
    NSUInteger index = [self indexOfObject:object
                             inSortedRange:NSMakeRange(0, self.count)
                                   options:NSBinarySearchingInsertionIndex
                           usingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];

    [self insertObject:object atIndex:index];
}

@end
