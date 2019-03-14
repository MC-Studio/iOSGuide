//
//  NSNumber+JSConvert.m
//  FoundationDemo
//
//  Created by joengzi on 2019/2/1.
//  Copyright © 2019 joenggaa. All rights reserved.
//

#import "NSNumber+JSConvert.h"

@implementation NSNumber (JSConvert)

- (NSString *)decimalStringValue {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    return [formatter stringFromNumber:self];
}

@end