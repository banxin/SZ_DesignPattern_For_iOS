//
//  SZWaiter.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZBakeCommandProtocol.h"

@interface SZWaiter : NSObject

//@property (nonatomic, weak) id<SZBakeCommandProtocol> command;

- (NSString *)setOrder:(id<SZBakeCommandProtocol>)command;

- (NSString *)cancelOrder:(id<SZBakeCommandProtocol>)command;

- (NSString *)notify;

@end
