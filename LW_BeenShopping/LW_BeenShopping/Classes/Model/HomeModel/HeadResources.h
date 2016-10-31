//
//  HeadResources.h
//  BeenShopping
//
//  Created by ___wei___ on ___2016/06/06___.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeadData.h"

@interface HeadResources : NSObject

/**  属性:  */
@property (nonatomic,copy) NSString *msg;

/**  属性:  */
@property (nonatomic,copy) NSString *reqid;

/**  属性:  */
@property (nonatomic,strong) HeadData *data;

@end
