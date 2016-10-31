//
//  GlobalCGFloatHeader.m
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "GlobalCGFloatHeader.h"

/**
 const 修饰全局的变量是只读变量  可用来代替宏  项目中宏用多了，会使程序预编译时间变得很长，苹果官方文档也不建议我们使用宏
 
如果一个全局的变量想在其他文件中使用 那么就要在其他文件中去声明这个全局变量
 extern 就是用来声明一个变量的 只能声明 不能定义变量
 static 修饰全局变量 那么这个全局变量只能在当前文件中使用 其他文件使用不了  如果修饰局部变量 那么这个局部变量的生命周期将延长 一般局部变量只有出了大括号就释放了  而被static修饰之后 就不会被释放 值得一提的是:static修饰的变量 在程序一运行时就被分配好了空间，之后不会再去自定义了。
 
 */


/** UITabBar的高度 */
CGFloat const LWTabBarH = 49;

/** 导航栏的最大Y值 */
CGFloat const LWNavMaxY = 64;

/** 标题栏的高度 */
CGFloat const LWTitlesViewH = 35;

/** 全局统一的间距 */
CGFloat const LWMarin = 10;

/** 统一的一个请求路径 */
NSString  * const LWCommonURL = @"http://api.budejie.com/api/api_open.php";

/** TabBarButton被重复点击的通知 */
NSString  * const LWTabBarButtonDidRepeatClickNotification = @"XMGTabBarButtonDidRepeatClickNotification";

/** TitleButton被重复点击的通知 */
NSString  * const LWTitleButtonDidRepeatClickNotification = @"XMGTitleButtonDidRepeatClickNotification";


@interface  GlobalCGFloatHeader ()

@end

@implementation GlobalCGFloatHeader


+ (void)test {
    
    
    
    
}

@end
