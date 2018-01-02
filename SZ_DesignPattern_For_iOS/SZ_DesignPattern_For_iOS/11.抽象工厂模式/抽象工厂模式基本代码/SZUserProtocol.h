//
//  SZUserProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SZUser;

@protocol SZUserProtocol <NSObject>

- (NSString *)insertUser:(SZUser *)user;

- (NSString *)getUser:(SZUser *)user;

@end
