//
//  DefineHeader.h
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//单例工具类的宏

#ifndef DefineHeader_h
#define DefineHeader_h


/* ————————————————————— 工具&单例 ——————————————————————— */

#pragma mark - 工具&单例
//主窗口
#define KEYWindow [UIApplication sharedApplication].keyWindow

//字典转模型的业务类
#define DictionaryToModelManager [DictionaryToModelManager manager]


/* ————————————————————  RGB（颜色） ——————————————————————— */

#pragma mark - RGB（颜色）
/*
 a:透明度
 */
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

/*
 随机色
 
 */
#define RGBNumber arc4random_uniform(256) //随机色的随机值
#define RandomColor() RGBA(RGBNumber,RGBNumber,RGBNumber,1)

//设置透明色
#define ClearColor [UIColor clearColor]



/* ————————————————————— 设备的系统 ————————————————————— */

#pragma mark - 设备的系统
//iOS7.0以上操作系统
#define iOS7 [[UIDevice currentDevice].systemVersion doubleValue] >= 7.0
//iOS8.0以上操作系统
#define iOS8 [[UIDevice currentDevice].systemVersion doubleValue] >= 8.0
//iOS8.0以上操作系统
#define iOS9 [[UIDevice currentDevice].systemVersion doubleValue] >= 9.0


#endif /* DefineHeader_h */
