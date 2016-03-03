//
//  MGRFieldValidationProtocol.h
//  MGRTextField
//
//  Created by Valentina Chernoeva on 20.10.15.
//  Copyright © 2015 Valentina Chernoeva. All rights reserved.
//

@protocol MGRValidationProtocol <NSObject>

- (BOOL)isValidValue:(id)value;

@end
