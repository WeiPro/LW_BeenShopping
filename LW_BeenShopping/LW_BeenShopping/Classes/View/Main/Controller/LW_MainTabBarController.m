//
//  LW_MainTabBarController.m
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "LW_MainTabBarController.h"
#import "UITabBarController+ChildController.h"
#import "MainHeader.h"

@interface LW_MainTabBarController ()

@end

@implementation LW_MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:[LW_HomeTableViewController new] title:@"首页" imageName:@"v2_home" selectedImageName:@"v2_home_r"];
    
    [self addChildViewController:[LW_SuperMarketViewController new] title:@"闪电超市" imageName:@"v2_order" selectedImageName:@"v2_order_r"];
    
    [self addChildViewController:[LW_ShopCarTableViewController new] title:@"购物车" imageName:@"shopCart" selectedImageName:@"shopCart"];
    
    [self addChildViewController:[LW_MineTableViewController new] title:@"我的" imageName:@"v2_my" selectedImageName:@"v2_my_r"];
    
    
}





@end
