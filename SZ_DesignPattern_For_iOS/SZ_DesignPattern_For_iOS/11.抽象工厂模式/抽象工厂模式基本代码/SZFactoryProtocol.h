//
//  SZFactoryProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZUserProtocol.h"
#import "SZDepartmentProtocol.h"

@protocol SZFactoryProtocol <NSObject>

- (id<SZUserProtocol>)createUser;

- (id<SZDepartmentProtocol>)createDepartment;

@end
