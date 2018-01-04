//
//  SZIraq.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZIraq.h"
#import "SZUniteNationsProtocol.h"

@implementation SZIraq

@synthesize uinityNations = _uinityNations;

- (NSString *)declare:(NSString *)msg
{
    if (_uinityNations) {
        
       return [_uinityNations declare:msg country:self];
    }
    
    return @"不知道向谁声明！！！";
}

- (NSString *)getMessage:(NSString *)msg
{
    return [NSString stringWithFormat:@"伊拉克获得信息：%@", msg];
}

@end
