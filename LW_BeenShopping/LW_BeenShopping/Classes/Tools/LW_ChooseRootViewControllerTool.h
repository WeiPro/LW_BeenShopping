//
//  LW_ChooseRootViewControllerTool.h
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LW_ChooseRootViewControllerTool : NSObject

+ (void)chooseWindowRootViewController:(UIWindow *)keyWindow;

+ (void)chooseWindowRootViewController:(UIWindow *)keyWindow guideViewController:(UIViewController *)guideViewController mainViewController:(UIViewController *)mainViewController;

@end
