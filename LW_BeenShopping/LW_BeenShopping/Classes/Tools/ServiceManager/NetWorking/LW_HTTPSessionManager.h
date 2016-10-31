//
//  LW_HTTPSessionManager.h
//  BeenShopping
//
//  Created by ___wei___ on ___2016/06/06___.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface LW_HTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedSession;

@end
