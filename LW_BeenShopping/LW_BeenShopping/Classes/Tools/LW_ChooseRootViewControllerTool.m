//
//  LW_ChooseRootViewControllerTool.m
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "LW_ChooseRootViewControllerTool.h"
#import "LW_SaveFileManager.h"
#import "LW_GuideViewController.h"
#import "LW_MainTabBarController.h"

@implementation LW_ChooseRootViewControllerTool

+ (void)chooseWindowRootViewController:(UIWindow *)keyWindow  {
    
    
    [self chooseWindowRootViewController:keyWindow guideViewController:[LW_GuideViewController new] mainViewController:[LW_MainTabBarController new]];
    

    
    
}


//选择控制器
+ (void)chooseWindowRootViewController:(UIWindow *)keyWindow guideViewController:(UIViewController *)guideViewController mainViewController:(UIViewController *)mainViewController {
    
    //获取系统的当前版本号(最新的版本号)
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    //偏好设置 中读取 存储的版本号 和当前版本号对比 不同就将当前版本号存储起来
    NSString *lastVersion = [LW_SaveFileManager objectForKey:@"version"];
    
    //判断版本号    不同的时候
    if (![lastVersion isEqualToString:currentVersion]) {
        
        //存储当前版本号
        [LW_SaveFileManager setObject:currentVersion forKey:@"version"];
        
        //引导页是根控制器
        keyWindow.rootViewController = guideViewController;
        
        [keyWindow makeKeyAndVisible];
        
        return;
        
    }
    
    
    if ([lastVersion isEqualToString:currentVersion]){
        
        //主控制器是根控制器
        keyWindow.rootViewController = mainViewController;
        
        [keyWindow makeKeyAndVisible];
     
        
    }

}


@end
