//
//  MGRValidator.m
//  VCValidation
//
//  Created by Valentina Chernoeva on 02.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "MGRStringValidator.h"
#import "NSRegularExpression+Patterns.h"

@implementation MGRStringValidator

- (instancetype)initWithRegularExpression:(NSRegularExpression *)regularExpression
                                minLength:(NSInteger)minLength
                                maxLength:(NSInteger)maxLength {
    self = [super init];
    if (self) {
        self.regularExpression = regularExpression;
        self.minLength = minLength;
        self.maxLength = maxLength;
    }
    return self;
}

- (instancetype)initWithRegularExpression:(NSRegularExpression *)regularExpression {
    return [self initWithRegularExpression:regularExpression minLength:0 maxLength:0];
}

+ (instancetype)emailValidator {
    return [[self alloc] initWithRegularExpression:[NSRegularExpression emailRegex] minLength:3 maxLength:256];
}

+ (instancetype)passwordValidator {
    return [[self alloc] initWithRegularExpression:[NSRegularExpression passwordRegex] minLength:5 maxLength:20];
}

#pragma mark - MGRValidationProtocol

- (BOOL)isValidValue:(NSString *)value {
    BOOL lengthIsValid = YES;
    
    if (self.minLength > 0) {
        lengthIsValid = value.length >= self.minLength;
    }
    
    if (self.maxLength != 0) {
        lengthIsValid = lengthIsValid && (value.length <= self.maxLength);
    }
    if (self.regularExpression != nil) {
        NSUInteger numberOfMatches = [self.regularExpression
                                      numberOfMatchesInString:value
                                      options:NSMatchingAnchored
                                      range:NSMakeRange(0, value.length)];
        if (numberOfMatches == 0 && value.length != 0) {
            return NO;
        }
    }
    return lengthIsValid;
}

@end
