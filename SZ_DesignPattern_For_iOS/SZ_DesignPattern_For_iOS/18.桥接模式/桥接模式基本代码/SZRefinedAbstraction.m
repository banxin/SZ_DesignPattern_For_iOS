//
//  SZRefinedAbstraction.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/28.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZRefinedAbstraction.h"

@implementation SZRefinedAbstraction

@synthesize implementor = _implementor;

- (NSString *)operation
{
    return _implementor ? [_implementor operation] : @"不存在的实现！！！";
}

@end
