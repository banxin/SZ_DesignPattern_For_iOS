//
//  SZAccessUser.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZAccessUser.h"
#import "SZUser.h"

@implementation SZAccessUser

- (NSString *)insertUser:(SZUser *)user
{
    return [NSString stringWithFormat:@"在 Access 中插入一条用户数据：userId: %@, userName: %@", user.userId, user.name];
}

- (NSString *)getUser:(SZUser *)user
{
    return [NSString stringWithFormat:@"在 Access 中获得一条用户数据：userId: %@, userName: %@", user.userId, user.name];
}

@end
