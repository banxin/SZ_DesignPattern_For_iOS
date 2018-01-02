//
//  SZDataAccess.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZUserProtocol.h"
#import "SZDepartmentProtocol.h"

@interface SZDataAccess : NSObject

// 以下两方法 使用 常量或配置文件定义数据库名称
+ (id<SZUserProtocol>)createUser;

+ (id<SZDepartmentProtocol>)createDepartment;

// 以下两方法 直接传入 数据库名称
+ (id<SZUserProtocol>)createUser:(NSString *)dbName;

+ (id<SZDepartmentProtocol>)createDepartment:(NSString *)dbName;

@end
