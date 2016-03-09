//
//  MGRValidationCell.h
//  MGRValidator
//
//  Created by Valentina Chernoeva on 04.03.16.
//  Copyright © 2016 MagoraSystems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGRValidationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UILabel *errorTextLabel;

@end
