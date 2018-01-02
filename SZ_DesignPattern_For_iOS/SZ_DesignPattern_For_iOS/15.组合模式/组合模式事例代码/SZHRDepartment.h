//
//  SZHRDepartment.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/26.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZCompanyProtocol.h"

@interface SZHRDepartment : NSObject<SZCompanyProtocol>

- (instancetype)initWithName:(NSString *)name;

@end
