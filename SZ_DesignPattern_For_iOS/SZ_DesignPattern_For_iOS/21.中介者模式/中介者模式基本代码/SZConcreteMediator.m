//
//  SZConcreteMediator.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/3.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteMediator.h"

@implementation SZConcreteMediator

- (NSString *)send:(NSString *)message colleague:(id<SZColleagueProtocol>)colleague
{
    if ([colleague isKindOfClass:[SZConcreteColleague1 class]]) {
        
        return [self.colleague2 notify:message];
        
    } else if ([colleague isKindOfClass:[SZConcreteColleague2 class]]) {
        
        return [self.colleague1 notify:message];
    }
    
    return @"无法处理的信息！";
}

@end
