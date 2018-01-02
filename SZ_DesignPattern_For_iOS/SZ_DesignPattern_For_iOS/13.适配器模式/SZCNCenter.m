//
//  SZCNCenter.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZCNCenter.h"

@implementation SZCNCenter

- (NSString *)jingong
{
    return [NSString stringWithFormat:@"CN 中锋，%@, 进攻！！！", self.name];
}

- (NSString *)fangshou
{
    return [NSString stringWithFormat:@"CN 中锋，%@, 防守！！！", self.name];
}

@end
