//
//  SZConcreteHandler1.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZHandlerProtocol.h"

// 当请求数 在 0 ~ 10之间 有权处理
@interface SZConcreteHandler1 : NSObject<SZHandlerProtocol>

@end
