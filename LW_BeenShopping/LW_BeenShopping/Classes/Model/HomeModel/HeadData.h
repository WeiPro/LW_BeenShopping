//
//  HeadData.h
//  BeenShopping
//
//  Created by ___wei___ on ___2016/06/06___.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Activities.h"

@interface HeadData : NSObject

/**  属性:  */
@property (nonatomic,strong) NSArray<Activities *> *focus;

/**  属性:  */
@property (nonatomic,strong) NSArray<Activities *> *icons;

/**  属性:  */
@property (nonatomic,strong) NSArray<Activities *> *activities;

@end
