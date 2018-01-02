//
//  SZWaiter.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZWaiter.h"
//#import "SZBakeMuttonCommand.h"
#import "SZBakeChickenWingCommand.h"

@interface SZWaiter ()

@property (nonatomic, strong) NSMutableArray *orders;

@end

@implementation SZWaiter

- (NSString *)setOrder:(id<SZBakeCommandProtocol>)command
{
    if ([command isKindOfClass:[SZBakeChickenWingCommand class]]) {
        
        return @"服务员：鸡翅没有了，麻烦点些其他的可好？";
        
    } else {
        
        [self.orders addObject:command];
        
        return @"增加点单，羊肉串！！！";
    }
}

- (NSString *)cancelOrder:(id<SZBakeCommandProtocol>)command
{
    if ([command isKindOfClass:[SZBakeChickenWingCommand class]]) {
        
        return @"服务员：取消一份鸡翅！！！";
        
    } else {
        
        return @"服务员：取消一份羊肉串！！！";
    }
}

- (NSString *)notify
{
    if (self.orders && self.orders.count > 0) {
        
        NSMutableString *str = [NSMutableString stringWithString:@""];
        
        for (id<SZBakeCommandProtocol> command in self.orders) {
            
            [str appendString:[NSString stringWithFormat:@"%@\n", [command excuteCommand]]];
        }
        
        return str;
        
    } else {
        
        return @"您还没有下单哦！！！";
    }
}

#pragma mark - laze load

- (NSMutableArray *)orders
{
    if (!_orders) {
        
        _orders = [NSMutableArray arrayWithCapacity:1];
    }
    
    return _orders;
}

@end
