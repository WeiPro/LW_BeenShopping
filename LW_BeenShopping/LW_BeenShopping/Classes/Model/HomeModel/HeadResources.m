//
//  HeadResources.m
//  BeenShopping
//
//  Created by ___wei___ on ___2016/06/06___.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "HeadResources.h"

@implementation HeadResources

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

+ (NSDictionary *)getFullDictionaryInClass {
    
    return @{@"data" : NSStringFromClass([HeadData class])};
}


@end
