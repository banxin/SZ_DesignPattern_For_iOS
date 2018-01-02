//
//  SZOperationDivide.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZOperationDivide.h"

@implementation SZOperationDivide

@synthesize numberA = _numberA;
@synthesize numberB = _numberB;

- (CGFloat)getResult
{
    if (self.numberB == 0) {
        
//        NSAssert(self.numberB, @"除数不能为0");
        // 第一个参数为NO时，打印自定义日志，如果为YES时，程序不崩，不打印日志
        NSAssert(YES, @"除数不能为0");
    }
    
    return self.numberA / self.numberB;
}

- (NSString *)description
{
    return @"除法运算";
}

@end
