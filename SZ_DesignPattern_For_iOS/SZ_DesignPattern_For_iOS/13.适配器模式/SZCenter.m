//
//  SZCenter.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZCenter.h"

@implementation SZCenter

@synthesize name = _name;

- (NSString *)attack
{
    return [NSString stringWithFormat:@"Center，%@, attack！！！", self.name];
}

- (NSString *)defence
{
    return [NSString stringWithFormat:@"Center，%@, defence！！！", self.name];
}

@end
