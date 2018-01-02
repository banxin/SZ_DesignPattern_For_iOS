//
//  SZStockObserver.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZStockObserver.h"

@implementation SZStockObserver

- (NSString *)closeStock
{
    return [self update];
}

- (NSString *)update
{
    return [NSString stringWithFormat:@"%@, 看股票的，赶紧好好干活！！！", self.name];
}

@end
