//
//  NSString+UIViewController.h
//  LW_Shopping
//
//  Created by wei on 16/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (UIViewController)

+ (UIViewController *)viewControllerWithString:(NSString *)string;

- (UIViewController *)getViewController;

@end
