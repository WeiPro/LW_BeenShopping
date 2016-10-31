//
//  NSString+PhoneNumber.h
//  LW_Shopping
//
//  Created by wei on 16/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PhoneNumber)

- (BOOL)isMobilePhoneNumber;

+ (BOOL)isMobilePhoneNumber:(NSString *)mobileNumber;

//判断手机号是否正确 (有问题 用上面的)
+ (BOOL)isMobileNumber:(NSString *)mobileNumber;

@end
