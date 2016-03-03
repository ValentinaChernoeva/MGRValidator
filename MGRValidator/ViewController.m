//
//  ViewController.m
//  MGRValidator
//
//  Created by Valentina Chernoeva on 03.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UITextField+Validation.h"
#import "MGRStringValidator.h"

@interface ViewController () <MGRValidationObjectDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *fieldCollection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.emailField.validator = [MGRStringValidator emailValidator];
    self.passwordField.validator = [MGRStringValidator passwordValidator];
    self.confirmPasswordField.validator = [MGRStringValidator passwordValidator];
    for (UITextField  *textField in self.fieldCollection) {
        textField.validationDelegate = self;
    }
    
    [[RACSignal combineLatest:@[self.passwordField.rac_textSignal, self.confirmPasswordField.rac_textSignal]
                       reduce:^id(NSString *currentPassword, NSString *currentConfirmPassword){
                           return [NSNumber numberWithBool:[currentPassword isEqualToString:currentConfirmPassword]
                                   && [self.confirmPasswordField.validator isValidValue:currentConfirmPassword]];
                       }] subscribeNext:^(NSNumber *passwordsMatch) {
                           [self validationObject:self.confirmPasswordField didChangeStringWithValidationResault:passwordsMatch.boolValue];
                       }];
}

#pragma mark - MGRValidationDelegate

- (void)validationObject:(UITextField *)object didChangeStringWithValidationResault:(BOOL)validationResault {
    if (validationResault) {
        object.backgroundColor = [UIColor clearColor];
    } else {
        object.backgroundColor = [UIColor redColor];
    }
}

@end
