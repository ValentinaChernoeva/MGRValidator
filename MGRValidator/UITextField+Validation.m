//
//  UITextField+Validation.m
//  VCValidation
//
//  Created by Valentina Chernoeva on 03.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "UITextField+Validation.h"
#import <objc/runtime.h>
#import <ReactiveCocoa/ReactiveCocoa.h>


@implementation UITextField (Validation)

@dynamic validator;
@dynamic validationDelegate;

- (void)setValidator:(id<MGRValidationProtocol>)aValidator {
    objc_setAssociatedObject(self, @selector(validator), aValidator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<MGRValidationProtocol>)validator {
    return objc_getAssociatedObject(self, @selector(validator));
}

- (void)setValidationDelegate:(id<MGRValidationObjectDelegate>)delegate {
    objc_setAssociatedObject(self, @selector(validationDelegate), delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self rac_liftSelector:@selector(validationValue:) withSignals:self.rac_textSignal, nil];
}

- (id<MGRValidationObjectDelegate>)validationDelegate {
    return objc_getAssociatedObject(self, @selector(validationDelegate));
}

#pragma mark - RAC

- (void)validationValue:(NSString *)value {
    if (self.validationDelegate != nil && [self.validationDelegate respondsToSelector:@selector(validationObject:didChangeValueWithValidationResault:)]) {
        BOOL validationResault = [self.validator isValidValue:value];
        [self.validationDelegate validationObject:self didChangeValueWithValidationResault:validationResault];
    }
}
@end
