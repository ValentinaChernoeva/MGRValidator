//
//  NSRegularExpression+Patterns.m
//  LunchDelivery-Client
//
//  Created by Apple on 07.09.15.
//  Copyright (c) 2015 Magora Systems. All rights reserved.
//

#import "NSRegularExpression+Patterns.h"

@implementation NSRegularExpression (Patterns)

+ (instancetype)emailRegex {
    return [NSRegularExpression regularExpressionWithPattern:@"[a-z0-9!#$%&'*+=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" options:NSRegularExpressionCaseInsensitive error:nil];
}

+ (instancetype)passwordRegex {
    return [NSRegularExpression regularExpressionWithPattern:@"^([a-zA-Z0-9@*#]{4,255})$" options:NSRegularExpressionCaseInsensitive error:nil];
}

@end
