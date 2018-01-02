//
//  SZDataAccess.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZDataAccess.h"

static NSString * const DBName = @"Sqlserve";
//static NSString * const DBName = @"Access";

@implementation SZDataAccess

+ (id<SZUserProtocol>)createUser
{
    return (id<SZUserProtocol>)[NSClassFromString([NSString stringWithFormat:@"SZ%@User", DBName]) new];
}

+ (id<SZDepartmentProtocol>)createDepartment
{
    return (id<SZDepartmentProtocol>)[NSClassFromString([NSString stringWithFormat:@"SZ%@Department", DBName]) new];
}

+ (id<SZUserProtocol>)createUser:(NSString *)dbName
{
    return (id<SZUserProtocol>)[NSClassFromString([NSString stringWithFormat:@"SZ%@User", dbName]) new];
}

+ (id<SZDepartmentProtocol>)createDepartment:(NSString *)dbName
{
    return (id<SZDepartmentProtocol>)[NSClassFromString([NSString stringWithFormat:@"SZ%@Department", dbName]) new];
}

@end
