//
//  NSString+UIViewController.m
//  LW_Shopping
//
//  Created by wei on 16/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "NSString+UIViewController.h"

@implementation NSString (UIViewController)

- (UIViewController *)getViewController {
    
    Class className = NSClassFromString(self);
    
    UIViewController *vCtr = [[className alloc] init];
    
    if ([vCtr isKindOfClass:[UITableViewController class]]) {
        
        //强转
        UITableViewController *tabVCtr = (UITableViewController *)vCtr;
        
        return tabVCtr;
        
    }
    
    
    if ([vCtr isKindOfClass:[UINavigationController class]]) {
        
        //强转
        UINavigationController *naVCtr = (UINavigationController *)vCtr;
        
        return naVCtr;
        
    }
    
    
    if ([vCtr isKindOfClass:[UICollectionViewController class]]) {
        
        UICollectionViewController *collectionCtr = (UICollectionViewController *)vCtr;
        
        return collectionCtr;
        
    }
    
        return vCtr;
  
    
    
}


+ (UIViewController *)viewControllerWithString:(NSString *)string {
    
    Class className = NSClassFromString(string);
    
    UIViewController *vCtr = [[className alloc] init];
    
    if ([vCtr isKindOfClass:[UITableViewController class]]) {
        
        //强转
        vCtr = (UITableViewController *)vCtr;
        
        
    }else if ([vCtr isKindOfClass:[UINavigationController class]]) {
        
        //强转
        vCtr = (UINavigationController *)vCtr;
        
        
    }else if ([vCtr isKindOfClass:[UICollectionViewController class]]) {
        
        vCtr = (UICollectionViewController *)vCtr;
        
    }
        
        return vCtr;
   
}

@end
