//
//  SZSqlserveUser.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSqlserveUser.h"
#import "SZUser.h"

@implementation SZSqlserveUser

- (NSString *)insertUser:(SZUser *)user
{
    return [NSString stringWithFormat:@"在 SQL Serve 中插入一条用户数据：userId: %@, userName: %@", user.userId, user.name];
}

- (NSString *)getUser:(SZUser *)user
{
    return [NSString stringWithFormat:@"在 SQL Serve 中获得一条用户数据：userId: %@, userName: %@", user.userId, user.name];
}

@end
