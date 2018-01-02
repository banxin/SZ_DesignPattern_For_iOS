//
//  SZBakeMuttonCommand.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZBakeMuttonCommand.h"

@implementation SZBakeMuttonCommand

@synthesize barbecuer = _barbecuer;

- (NSString *)excuteCommand
{
    if (_barbecuer) {
        
        return [_barbecuer bakeMutton];
        
    } else {
        
        return @"该羊肉串订单已取消！！！";
    }
}

@end
