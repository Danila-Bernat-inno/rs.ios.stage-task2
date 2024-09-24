#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    const int maxIPv4AllowedParts = 4;
    const int maxAllowedIPv4PartValue = 255;
    const int minAllowedIPv4PartValue = 0;

    if ([numbersArray count] == 0 || numbersArray == nil) { return @""; }
    
    NSMutableArray *ipPartsArray = [NSMutableArray arrayWithCapacity:4];

    for (int i = 0; i < [numbersArray count] && i < maxIPv4AllowedParts; i++) {
        if ([numbersArray[i] intValue] < minAllowedIPv4PartValue) { return @"Negative numbers are not valid for input."; }
        if ([numbersArray[i] intValue] > maxAllowedIPv4PartValue) { return @"The numbers in the input array can be in the range from 0 to 255."; }
        ipPartsArray[i] = numbersArray[i];
    }

    while ([ipPartsArray count] < 4) {
        [ipPartsArray addObject:@0];
    }

    return [ipPartsArray componentsJoinedByString:@"."];
}

@end
