//
//  GlobalCGFloatHeader.h
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GlobalCGFloatHeader : NSObject

@end

/** 屏幕尺寸及宽高 宏定义 */
#define UIScreenSize [UIScreen mainScreen].bounds.size
#define UIScreenWidth [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight  [UIScreen mainScreen].bounds.size.height

/** UITabBar的高度 */
UIKIT_EXTERN CGFloat const LWTabBarH;

/** 导航栏的最大Y值 */
UIKIT_EXTERN CGFloat const LWNavMaxY;

/** 标题栏的高度 */
UIKIT_EXTERN CGFloat const LWTitlesViewH;

/** 全局统一的间距 */
UIKIT_EXTERN CGFloat const LWMarin;

/** 统一的一个请求路径 */
UIKIT_EXTERN NSString  * const LWCommonURL;

/** TabBarButton被重复点击的通知 */
UIKIT_EXTERN NSString  * const LWTabBarButtonDidRepeatClickNotification;

/** TitleButton被重复点击的通知 */
UIKIT_EXTERN NSString  * const LWTitleButtonDidRepeatClickNotification;
