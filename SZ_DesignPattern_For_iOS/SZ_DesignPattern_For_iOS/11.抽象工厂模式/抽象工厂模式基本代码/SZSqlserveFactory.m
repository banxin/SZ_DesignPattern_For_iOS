//
//  SZSqlserveFactory.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSqlserveFactory.h"
#import "SZSqlserveUser.h"
#import "SZSqlserveDepartment.h"

@implementation SZSqlserveFactory

- (id)createUser
{
    return [SZSqlserveUser new];
}

- (id<SZDepartmentProtocol>)createDepartment
{
    return [SZSqlserveDepartment new];
}

@end
