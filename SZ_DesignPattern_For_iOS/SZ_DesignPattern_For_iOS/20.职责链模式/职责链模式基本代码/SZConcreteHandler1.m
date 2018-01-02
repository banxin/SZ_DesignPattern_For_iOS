//
//  SZConcreteHandler1.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteHandler1.h"

@implementation SZConcreteHandler1

@synthesize handler = _handler;

// 当请求数 在 0 ~ 10之间 有权处理
- (NSString *)handlerRequest:(NSInteger)request
{
    if (request >= 0 && request <= 10) {
        
        return @"该请求已受理，受理者：--> SZConcreteHandler1";
        
    } else {
        
        return [_handler handlerRequest:request];
    }
}

@end
