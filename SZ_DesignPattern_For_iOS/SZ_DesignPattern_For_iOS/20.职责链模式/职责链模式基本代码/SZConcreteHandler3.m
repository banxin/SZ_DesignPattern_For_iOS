//
//  SZConcreteHandler3.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteHandler3.h"

@implementation SZConcreteHandler3

@synthesize handler = _handler;

// 请求数 在 11 ~ 20 间有权处理
- (NSString *)handlerRequest:(NSInteger)request
{
    if (request > 21 && request <= 30) {
        
        return @"该请求已受理，受理者：--> SZConcreteHandler3";
        
    } else {
        
        return @"无效的请求！！！";
    }
}

@end
