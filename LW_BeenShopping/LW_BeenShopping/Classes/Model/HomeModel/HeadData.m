//
//  HeadData.m
//  BeenShopping
//
//  Created by ___wei___ on ___2016/06/06___.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "HeadData.h"

@implementation HeadData

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

+ (NSDictionary *)getFullDictionaryInClass {
    
    NSString *modelClass = NSStringFromClass([Activities class]);
    
    return @{@"focus" : modelClass, @"icons" : modelClass, @"activities" : modelClass};
}

@end
