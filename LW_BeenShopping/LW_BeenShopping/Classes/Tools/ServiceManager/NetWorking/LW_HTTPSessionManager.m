//
//  LW_HTTPSessionManager.m
//  BeenShopping
//
//  Created by ___wei___ on ___2016/06/06___.
//  Copyright © 2016年 LWSpro. All rights reserved.
//处理网络请求的业务

#import "LW_HTTPSessionManager.h"

@implementation LW_HTTPSessionManager

+ (instancetype)sharedSession {
    
    static LW_HTTPSessionManager *_manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [self manager];
        
    });
    
    return _manager;
    
}





@end
