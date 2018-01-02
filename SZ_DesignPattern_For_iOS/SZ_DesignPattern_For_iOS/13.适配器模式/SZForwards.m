//
//  SZForwards.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZForwards.h"

@implementation SZForwards

@synthesize name = _name;

- (NSString *)attack
{
    return [NSString stringWithFormat:@"Forwards，%@, attack！！！", self.name];
}

- (NSString *)defence
{
    return [NSString stringWithFormat:@"Forwards，%@, defence！！！", self.name];
}

@end
