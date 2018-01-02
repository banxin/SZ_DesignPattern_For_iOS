//
//  SZManagerProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZRequest.h"

@protocol SZManagerProtocol <NSObject>

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) id<SZManagerProtocol> manager;

- (NSString *)requestApplications:(SZRequest *)request;

@end
