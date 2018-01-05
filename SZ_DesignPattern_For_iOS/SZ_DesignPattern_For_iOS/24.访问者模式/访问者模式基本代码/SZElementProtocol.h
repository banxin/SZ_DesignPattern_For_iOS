//
//  SZElementProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZVistorProtocol.h"

@protocol SZElementProtocol <NSObject>

/*
 定义 一个 accept 操作，以 SZVistorProtocol（访问者） 为参数
 */
- (NSString *)accept:(id<SZVistorProtocol>)vistor;

@end
