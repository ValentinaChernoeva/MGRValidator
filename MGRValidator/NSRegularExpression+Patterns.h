//
//  NSRegularExpression+Patterns.h
//  LunchDelivery-Client
//
//  Created by Apple on 07.09.15.
//  Copyright (c) 2015 Magora Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSRegularExpression (Patterns)

+ (instancetype)emailRegex;
+ (instancetype)passwordRegex;

@end
