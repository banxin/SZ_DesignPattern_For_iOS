//
//  SZConcreteColleague2.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/3.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteColleague2.h"

@implementation SZConcreteColleague2

@synthesize mediator = _mediator;

- (NSString *)send:(NSString *)message
{
    if (_mediator) {
        
        return [_mediator send:message colleague:self];
        
    } else {
        
        return @"无法处理！！！";
    }
}

- (NSString *)notify:(NSString *)message
{
    return [NSString stringWithFormat:@"同事2收到信息：%@", message];
}

@end
