//
//  SZOperationMultiply.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZOperationMultiply.h"

@implementation SZOperationMultiply

@synthesize numberA = _numberA;
@synthesize numberB = _numberB;

- (CGFloat)getResult
{
    return self.numberA * self.numberB;
}

- (NSString *)description
{
    return @"乘法运算";
}

@end
