//
//  DictionaryToModelManager.m
//  BeenShopping
//
//  Created by ___wei___ on ___2016/06/06___.
//  Copyright © 2016年 LWSpro. All rights reserved.
//处理字典转模型的工具类  模仿MJExtension

#import "DictionaryToModelManager.h"
#import <objc/message.h>
#import "GlobalCGFloatHeader.h"

/**  合并字典的分类 (声明) */
@interface NSDictionary (Merge)

- (void)merge:(NSDictionary *)dict;

@end



/**  合并字典的分类  (实现) */
@implementation NSDictionary (Merge)


- (void)merge:(NSDictionary *)dict {
    
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString  * _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        //赋值
        [self setValue:value forKey:key];
        
    }];
    
    
}

@end



/**   当前类   */
@interface DictionaryToModelManager ()


/**  属性: 缓存模型的缓存池 */
@property (nonatomic,strong) NSMutableDictionary *modelCache;

@end


@implementation DictionaryToModelManager

+ (instancetype)manager {
    
    static DictionaryToModelManager *_manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [[self alloc] init];

        
    });
    
    return _manager;
    
}


/**
     dict:解析网络数据转换成的字典
     class:模型类
 
 */
- (id)objectWithDictionary:(NSDictionary *)dict  class:(_Nonnull Class)modelClass {
    // 动态获取命名空间
    NSString *ns = (NSString *)[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"];
    
    //模型信息 拿到模型转换成的字典
    NSDictionary *infoDic = [self fullModelInfo:modelClass];
    
    
    //实例化模型
    id obj = [[modelClass alloc] init];
    
    [infoDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull modelValue, BOOL * _Nonnull stop) {
        
       //最外层
        if ([key isEqualToString:@"desc"]) {
            //从网络数据中拿到键对应的值
            id newValue = dict[@"description"];
            
            //给模型赋值
            [obj setValue:newValue forKey:key];
            
        }
        
        id value = dict[key];
        
        if (value) {
            
            //如果modelValue为空
            if (!modelValue) {
                
                //如果value不是NSNull类型
                if (![value isKindOfClass:[NSNull class]]) {
                    
                    if ([key isEqualToString:@"number"] && UIScreenWidth < 375) {
                       
                        if ([value isKindOfClass:[NSString class]]) {
                            
                            //把数字型的字符串转换成NSNumber对象
                            NSNumber *numberValue = [NSNumber numberWithInteger:[value integerValue]];
                            //存储起来
                            [obj setValue:numberValue forKey:key];
                            
                        }
                        
                    }else {
                        
                        [obj setValue:value forKey:key];
                        
                    }
                    
                }
                
                ////如果modelValue不为空
            }else {
                
                id subObj;
                
                //内存的值如果是字典类型  就再转
                if ([value isKindOfClass:[NSDictionary class]]) {
                    
                    subObj = [self objectWithDictionary:value class:NSClassFromString([NSString stringWithFormat:@"%@.%@",ns,modelValue])];
                    
                    if (subObj) {//存在就赋值
                        
                        
                        [obj setValue:subObj forKey:key];
                        
                    }
                    
                    
                }else if ([value isKindOfClass:[NSArray class]]) {
                    
//                    subObj = [self ]
                    
                    
                    
                }
                
            }
            
        }
        
        
    }];
    
    
    
    return obj;
}

/** 作用:处理字典数组转换成模型数组
 *
 *  参数1:字典数组
 *
 *  参数2:模型类
 *
 *   返回值:模型数组
 *
 */
- (NSArray *)objectsWithArray:(NSArray *)dicArray class:(_Nonnull Class)modelClass {
    
    NSMutableArray *muList = [NSMutableArray array];
    
    for (id value in dicArray) {
        
        id subObj;
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            subObj = [self objectWithDictionary:value class:modelClass];
            
            if (subObj) {
                
                [muList addObject:subObj];
                
            }
            
        }else if ([value isKindOfClass:[NSArray class]]) {
            
            subObj = [self objectsWithArray:(NSArray *)value class:modelClass];
            
            if (subObj) {
                
                [muList addObject:subObj];
                
            }
            
        }
            
    }
    
    if (muList.count > 0) {
        
        return muList;
        
    }
    
    return nil;
    
}



/** 模型转字典  这个方法会将模型内部的模型也转换成字典
 *
 *  参数1:模型对象
 *
 *  返回值:模型转换成的字典  这个字典是将内部的模型也转换成字典
 *
 */
- (NSDictionary *)objectDictionary:(id)objc {
    // 1. 取出对象模型转换成的字典  这个转换可能不彻底  有可能字典里面还有模型  所以我们需要将内层的模型也转换成字典
    NSDictionary *infoDic = [self fullModelInfo:[objc class]];
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    [infoDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        //从模型中取值
        id modelValue = [objc valueForKey:key];
        
        if (!modelValue) {//如果没有值
            
            modelValue = [NSNull new];
    
        }
        
        if (!value || [value isKindOfClass:[NSNull class]]) {
            
            result[key] = value;
            
        }else {
            
            id subObj;
            
            if ([value isKindOfClass:[NSArray class]]) {
                
                subObj = [self objectArray:(NSArray *)value];
                
                //如果不是数组的话  是其他模型
            }else {
                
                subObj = [self objectDictionary:value];
                
            }
            
            
            if (!subObj) {
                
                subObj = [NSNull new];
                
            }
            
            result[key] = subObj;
            
        }
        
    }];
    
    if (result.count > 0) {
        
        return result;
        
    }
    
    return nil;
}



/** 模型数组转换成字典数组
 *
 *  参数1:模型数组
 *  返回值:将内部的模型数组也转换成字典数组  或者将内部的模型也转换成了字典  的数组
 *
 */
- (NSArray *)objectArray:(NSArray *)modelArray {
    
    NSMutableArray *result = [NSMutableArray array];
    
    for (id value in modelArray) {
        
        id subObjc;
        
        if ([value isKindOfClass:[NSArray class]]) {
            
            subObjc = [self objectArray:(NSArray *)value];
            
        } else {
            
            subObjc = [self objectDictionary:value];
            
        }
        
        if (subObjc) {
            
            [result addObject:subObjc];
            
        }
        
    }
    
    if (result.count > 0) {
        
        return result;
        
    }
    
    return nil;
    
}


- (NSDictionary *)fullModelInfo:(_Nonnull Class)modelClass {
    
    //把类转换成字符串
    NSString *key =  NSStringFromClass(modelClass);
    
    //首先检查模型缓存池中有没有模型
    if (self.modelCache[key]) {
        
        return self.modelCache[key];
        
    }

    Class currentClass = modelClass;
    
    NSMutableDictionary *mappingDic = [NSMutableDictionary dictionary];
    
//     Class parentClass;
    //循环遍历cls的父类 直到遍历到基类为止
    while ([[currentClass superclass] isSubclassOfClass:[NSObject class]]) {
        //给父类赋值
//        parentClass = [currentClass superclass];
        
        [mappingDic merge:[self modelInfo:currentClass]];
        
        currentClass = [currentClass superclass];
        
    }
    
    //写入缓存池中
    self.modelCache[key] = mappingDic;
    
    return mappingDic;
    
}







- (NSDictionary *)modelInfo:(_Nonnull Class)modelClass {
    
    //把类转换成字符串
    NSString *key =  NSStringFromClass(modelClass);
    
    //首先检查模型缓存池中有没有模型
    if (self.modelCache[key]) {
        
        return self.modelCache[key];
        
    }
    
    NSMutableDictionary *mappingDic = [NSMutableDictionary dictionary];
   
    NSDictionary *fullDic;
    
    if ([modelClass respondsToSelector:@selector(getFullDictionaryInClass)]) {
        
        fullDic = [modelClass performSelector:@selector(getFullDictionaryInClass) withObject:nil];
        
        
    }
    
    //否则就把模型存储到缓存池中
    unsigned int count;
    //获取模型属性列表
    objc_property_t *propertyList = class_copyPropertyList(modelClass, &count);
    
    for (int i = 0; i < count; i++) {
        //获取属性
        objc_property_t property = propertyList[i];
        
        //获取属性 这是一个C语言的字符串
        const char *c_propertyName = property_getName(property);
        //将 C 语言的字符串转换成 OC字符串
        NSString *oc_propertyName = [NSString stringWithUTF8String:c_propertyName];
        //从最全的字典中拿到模型对应的字典
        id value = fullDic[oc_propertyName];
        //模型转字典 mappingDic就成了模型对应的字典了
        mappingDic[oc_propertyName] = value;

    }
    
    free(propertyList);
    
    //添加
    self.modelCache[key] = mappingDic;
    
    return nil;
    
}


@end


