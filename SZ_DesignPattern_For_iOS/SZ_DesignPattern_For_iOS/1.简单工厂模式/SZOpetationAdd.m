//
//  SZOpetationAdd.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZOpetationAdd.h"

@implementation SZOpetationAdd

/**
 *  下面这两句话会自动生成实现的协议的属性对应的成员变量。如果没有这两句话，则系统会奔溃
 */
@synthesize numberA = _numberA;
@synthesize numberB = _numberB;

- (CGFloat)getResult
{
    return self.numberA + self.numberB;
}

- (NSString *)description
{
    return @"加法运算";
}

@end
