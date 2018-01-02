//
//  SZGuards.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZGuards.h"

@implementation SZGuards

@synthesize name = _name;

- (NSString *)attack
{
    return [NSString stringWithFormat:@"Guards，%@, attack！！！", self.name];
}

- (NSString *)defence
{
    return [NSString stringWithFormat:@"Guards，%@, defence！！！", self.name];
}

@end
