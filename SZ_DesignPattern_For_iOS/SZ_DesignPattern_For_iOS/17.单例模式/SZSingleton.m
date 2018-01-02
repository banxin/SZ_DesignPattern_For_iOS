//
//  SZSingleton.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/27.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSingleton.h"

@implementation SZSingleton

+ (instancetype)shareInstance
{
    static SZSingleton *singleton = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        singleton = [[SZSingleton alloc] init];
    });
    
    return singleton;
}

@end
