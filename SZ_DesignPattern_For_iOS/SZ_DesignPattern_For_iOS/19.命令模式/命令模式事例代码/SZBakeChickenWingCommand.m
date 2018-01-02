//
//  SZBakeChickenWingCommand.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZBakeChickenWingCommand.h"

@implementation SZBakeChickenWingCommand

@synthesize barbecuer = _barbecuer;

- (NSString *)excuteCommand
{
    if (_barbecuer) {
        
        return [_barbecuer bakeMutton];
        
    } else {
        
        return @"该鸡翅订单已取消！！！";
    }
}

@end
