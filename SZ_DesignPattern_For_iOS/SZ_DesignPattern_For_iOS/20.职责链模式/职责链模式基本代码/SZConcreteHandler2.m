//
//  SZConcreteHandler2.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteHandler2.h"

@implementation SZConcreteHandler2

@synthesize handler = _handler;

// 请求数 在 11 ~ 20 间有权处理
- (NSString *)handlerRequest:(NSInteger)request
{
    if (request > 10 && request <= 20) {
        
        return @"该请求已受理，受理者：--> SZConcreteHandler2";
        
    } else {
        
        return [_handler handlerRequest:request];
    }
}

@end
