//
//  MGRTableViewController.m
//  MGRValidator
//
//  Created by Valentina Chernoeva on 09.03.16.
//  Copyright © 2016 MagoraSystems. All rights reserved.
//

#import "MGRTableViewController.h"
#import "MGRValidationCell+Validation.h"
#import "MGRStringValidator.h"

@interface MGRTableViewController () <MGRValidationObjectDelegate>

@end

@implementation MGRTableViewController

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = nil;
    MGRStringValidator *validator = nil;
    switch (indexPath.row) {
        case 0:
            cellIdentifier = @"CellEmail";
            validator = [MGRStringValidator emailValidator];
            break;
        case 1:
            cellIdentifier = @"CellPassword";
            validator = [MGRStringValidator passwordValidator];
            break;
        default:
            break;
    }
    
    MGRValidationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.validator = validator;
    cell.validationDelegate = self;
    return cell;
}

#pragma mark - MGRValidationDelegate

- (void)validationObject:(MGRValidationCell *)object didChangeValueWithValidationResault:(BOOL)validationResault {

   
    object.errorTextLabel.hidden = validationResault;
    if (!validationResault) {
         object.errorTextLabel.text = [self errorMessageInCell:object];
    }
    
    CATransition *animation = [CATransition animation];
    animation.duration = 0.3f;
    [object.errorTextLabel.layer addAnimation:animation forKey:@"kCATransitionFade"];
}


- (NSString *)errorMessageInCell:(MGRValidationCell *)cell {
     NSString *errorMessage = nil;
    if (cell.valueTextField.text.length == 0) {
        if ([cell.reuseIdentifier isEqualToString:@"CellEmail"]) {
            errorMessage = @"Email can't be empty!";
        } else {
            errorMessage = @"Password can't be empty!";
        }
    } else {
        if ([cell.reuseIdentifier isEqualToString:@"CellEmail"]) {
            errorMessage = @"No valid email address!";
        } else {
            errorMessage = @"No valid password!";
        }
    }
    return errorMessage;
}
@end
