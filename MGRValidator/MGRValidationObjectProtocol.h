//
//  MGRValidationObjectProtocol.h
//  VCValidation
//
//  Created by Valentina Chernoeva on 03.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "MGRValidationProtocol.h"

@protocol MGRValidationObjectDelegate;

@protocol MGRValidationObjectProtocol <NSObject>

@property (strong, nonatomic) id<MGRValidationProtocol> validator;
@property (weak, nonatomic) id<MGRValidationObjectDelegate> validationDelegate;

@end

@protocol MGRValidationObjectDelegate <NSObject>

@optional
- (void)validationObject:(id)object didChangeValueWithValidationResault:(BOOL)validationResault;

@end