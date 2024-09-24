#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    const int maxIPv4AllowedParts = 4;
    const int maxAllowedIPv4PartValue = 255;
    const int minAllowedIPv4PartValue = 0;

    if ([numbersArray count] == 0 || numbersArray == nil) { return @""; }

    NSMutableArray *resultIPv4NumbersArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [numbersArray count] || i < maxIPv4AllowedParts; i++) {
        if (i < [numbersArray count] && [numbersArray[i] intValue] < minAllowedIPv4PartValue) { return @"Negative numbers are not valid for input."; }
        if (i < [numbersArray count] && [numbersArray[i] intValue] > maxAllowedIPv4PartValue) { return @"The numbers in the input array can be in the range from 0 to 255."; }

        if (i + 1 > maxIPv4AllowedParts) { break; }
        if (i + 1 > [numbersArray count]) { [resultIPv4NumbersArray addObject:@0]; continue; }
        [resultIPv4NumbersArray addObject:numbersArray[i]];
    }

    return [resultIPv4NumbersArray componentsJoinedByString:@"."];
}

@end
