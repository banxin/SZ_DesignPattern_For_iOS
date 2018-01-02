//
//  SZFund.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZFund.h"
#import "SZStock.h"
#import "SZGovernmentBond.h"
#import "SZRealEstate.h"

@interface SZFund ()

@property (nonatomic, strong) SZStock *stock;

@property (nonatomic, strong) SZGovernmentBond *governmentBond;

@property (nonatomic, strong) SZRealEstate *realEstate;

@end

@implementation SZFund

- (instancetype)init
{
    if (self = [super init]) {
        
        _stock = [SZStock new];
        _governmentBond = [SZGovernmentBond new];
        _realEstate = [SZRealEstate new];
    }
    
    return self;
}

- (NSString *)buyFund
{
    return [NSString stringWithFormat:@"%@\n%@\n%@", [_stock buy], [_governmentBond buy], [_realEstate buy]];
}

- (NSString *)sellFund
{
    return [NSString stringWithFormat:@"%@\n%@\n%@", [_stock sell], [_governmentBond sell], [_realEstate sell]];
}

@end
