//
//  SZCashReturn.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZCashReturn.h"

@interface SZCashReturn ()

@property (nonatomic, assign) CGFloat moneyReturn;

@property (nonatomic, assign) CGFloat moneyCondition;

@end

@implementation SZCashReturn

- (instancetype)initWithMoneyReturn:(CGFloat)moneyReturn andCondition:(CGFloat)condition
{
    self = [super init];
    
    if (self) {
        
        self.moneyReturn = moneyReturn;
        self.moneyCondition = condition;
    }
    
    return self;
}

- (CGFloat)acceptCash:(CGFloat)money
{
    CGFloat result = money;
    
    if (money >= self.moneyCondition) {
        
        result = money - (money / self.moneyCondition * self.moneyReturn);
    }
    
    return result;
}

- (NSString *)description
{
    return @"满100减20";
}

@end
