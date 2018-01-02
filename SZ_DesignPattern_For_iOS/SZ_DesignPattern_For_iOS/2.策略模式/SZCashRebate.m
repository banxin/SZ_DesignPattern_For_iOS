//
//  SZCashRebate.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZCashRebate.h"

@interface SZCashRebate ()

@property (nonatomic, assign) CGFloat moneyRebate;

@end

@implementation SZCashRebate

- (instancetype)initWithMoneyRebate:(CGFloat)moneyRebate
{
    self = [super init];
    
    if (self) {
        
        self.moneyRebate = moneyRebate;
    }
    
    return self;
}

- (CGFloat)acceptCash:(CGFloat)money
{
    return money * self.moneyRebate;
}

- (NSString *)description
{
    return @"七折优惠";
}

@end
