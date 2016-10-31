//
//  UITabBarController+ChildController.m
//  LW_Shopping
//
//  Created by wei on 16/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "UITabBarController+ChildController.h"
#import "NSString+UIViewController.h"

@implementation UITabBarController (ChildController)


- (void)addChildViewController:(NSString *)vCtrClassName navigationController:(UINavigationController *)navCtr title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName {
    //根据类名创建类对象
    UIViewController *vCtr = [vCtrClassName getViewController];
    vCtr.title = title;
    
    vCtr.tabBarItem.image = [UIImage imageNamed:normalImageName];
    
    //渲染
    vCtr.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //作为导航控制器的根控制器
    //    [navCtr addChildViewController:vCtr];
    
    navCtr = [navCtr initWithRootViewController:vCtr];
    
    //添加
    [self addChildViewController:navCtr];
    
}


- (void)addChildViewController:(UIViewController *)viewController navigationController:(UINavigationController *)navCtr title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    if ([viewController isKindOfClass:[UITableViewController class]]) {
        
        viewController = (UITableViewController *)viewController;
        
    }
    
    
    if ([viewController isKindOfClass:[UICollectionViewController class]]) {
        
        viewController = (UICollectionViewController *)viewController;
        
    }
    
//    NSLog(@"===== %@",[viewController class]);
    
    viewController.title = title;
    
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //渲染
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    navCtr = [navCtr initWithRootViewController:viewController];
    
    //添加
    [self addChildViewController:navCtr];
    
}



- (void)addChildViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    if ([viewController isKindOfClass:[UITableViewController class]]) {
        
        viewController = (UITableViewController *)viewController;
        
    }
    
    
    if ([viewController isKindOfClass:[UICollectionViewController class]]) {
        
        viewController = (UICollectionViewController *)viewController;
        
    }
    
    //    NSLog(@"===== %@",[viewController class]);
    
    viewController.title = title;
    
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //渲染
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *navCtr = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    //添加
    [self addChildViewController:navCtr];
    
}


@end
