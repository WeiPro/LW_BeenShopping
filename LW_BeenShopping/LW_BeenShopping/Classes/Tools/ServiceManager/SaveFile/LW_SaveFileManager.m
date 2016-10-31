//
//  LW_SaveFileManager.m
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "LW_SaveFileManager.h"

@implementation LW_SaveFileManager

+ (id)objectForKey:(NSString *)defaultName {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
    
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    
}


@end
