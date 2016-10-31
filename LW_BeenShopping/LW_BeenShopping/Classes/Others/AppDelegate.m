//
//  AppDelegate.m
//  LW_Shopping
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "AppDelegate.h"
#import "LW_GuideViewController.h"
#import "LW_MainTabBarController.h"
#import "LW_ChooseRootViewControllerTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建主窗口
    self.window = [[UIWindow alloc]
                           initWithFrame:[UIScreen mainScreen].bounds];
    
    //创建主窗口并显示
    [LW_ChooseRootViewControllerTool chooseWindowRootViewController:self.window];
    
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
    
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
