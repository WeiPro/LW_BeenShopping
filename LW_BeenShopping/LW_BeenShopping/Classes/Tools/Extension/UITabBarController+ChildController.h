//
//  UITabBarController+ChildController.h
//  LW_Shopping
//
//  Created by wei on 16/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (ChildController)

//根据类名来确认子控制器
- (void)addChildViewController:(NSString *)vCtrClassName navigationController:(UINavigationController *)navCtr title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName;


//可以自定义导航控制器
- (void)addChildViewController:(UIViewController *)viewController navigationController:(UINavigationController *)navCtr title:(NSString *)title imageName:(NSString *)ImageName selectedImageName:(NSString *)selectedImageName;


//系统导航控制器
- (void)addChildViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;


@end
