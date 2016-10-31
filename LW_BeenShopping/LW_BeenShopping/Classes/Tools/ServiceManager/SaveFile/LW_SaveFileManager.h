//
//  LW_SaveFileManager.h
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//存储类的业务逻辑

#import <Foundation/Foundation.h>

@interface LW_SaveFileManager : NSObject

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
