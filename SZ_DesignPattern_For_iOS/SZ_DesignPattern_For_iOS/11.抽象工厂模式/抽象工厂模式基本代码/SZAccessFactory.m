//
//  SZAccessFactory.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZAccessFactory.h"
#import "SZAccessUser.h"
#import "SZAccessDepartment.h"

@implementation SZAccessFactory

- (id)createUser
{
    return [SZAccessUser new];
}

- (id<SZDepartmentProtocol>)createDepartment
{
    return [SZAccessDepartment new];
}

@end
