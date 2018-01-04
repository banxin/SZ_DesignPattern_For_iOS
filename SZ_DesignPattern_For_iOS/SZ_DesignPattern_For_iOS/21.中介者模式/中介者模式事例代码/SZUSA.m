//
//  SZUSA.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZUSA.h"
#import "SZUniteNationsProtocol.h"

@implementation SZUSA

@synthesize uinityNations = _uinityNations;

- (NSString *)waring:(NSString *)msg
{
    if (_uinityNations) {
        
        return [_uinityNations declare:msg country:self];
    }
    
    return @"不知道警告谁？";
}

- (NSString *)getMessage:(NSString *)msg
{
    return [NSString stringWithFormat:@"美国获得信息：%@", msg];
}

@end
