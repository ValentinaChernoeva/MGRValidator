//
//  MGRValidator.h
//  VCValidation
//
//  Created by Valentina Chernoeva on 02.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGRValidationProtocol.h"

@interface MGRStringValidator : NSObject <MGRValidationProtocol>

@property (strong, nonatomic) NSRegularExpression *regularExpression;
@property (assign, nonatomic) NSInteger minLength;
@property (assign, nonatomic) NSInteger maxLength;

- (instancetype)initWithregularExpression:(NSRegularExpression *)regularExpression
                                minLength:(NSInteger)minLength
                                maxLength:(NSInteger)maxLength;

- (instancetype)initWithregularExpression:(NSRegularExpression *)regularExpression;

+ (instancetype)emailValidator;
+ (instancetype)passwordValidator;

@end
