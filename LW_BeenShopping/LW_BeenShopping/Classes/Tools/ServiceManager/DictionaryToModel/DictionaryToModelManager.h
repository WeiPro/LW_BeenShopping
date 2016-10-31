//
//  DictionaryToModelManager.h
//  BeenShopping
//
//  Created by ___wei___ on ___2016/06/06___.
//  Copyright © 2016年 LWSpro. All rights reserved.
//处理字典转模型的业务  适合层层嵌套的那种字典转模型

#import <Foundation/Foundation.h>


@interface DictionaryToModelManager : NSObject

+ (instancetype)manager;

- (id)objectWithDictionary:(NSDictionary *)dict  class:(_Nonnull Class)modelClass;

- (NSArray *)objectsWithArray:(NSArray *)dicArray class:(_Nonnull Class)modelClass;

- (NSArray *)objectArray:(NSArray *)modelArray;

- (NSDictionary *)objectDictionary:(id)objc;

@end




