//
//  SZAccessDepartment.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZAccessDepartment.h"
#import "SZDepartment.h"

@implementation SZAccessDepartment

- (NSString *)insertDepartment:(SZDepartment *)department
{
    return [NSString stringWithFormat:@"在 Access 中插入一条部门数据：departmentId: %@, userName: %@", department.departmentId, department.departmentName];
}

- (NSString *)getDepartment:(SZDepartment *)department
{
    return [NSString stringWithFormat:@"在 Access 中获得一条部门数据：userId: %@, userName: %@", department.departmentId, department.departmentName];
}

@end
