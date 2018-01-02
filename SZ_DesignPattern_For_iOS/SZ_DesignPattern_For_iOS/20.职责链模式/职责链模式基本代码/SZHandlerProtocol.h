//
//  SZHandlerProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZHandlerProtocol <NSObject>

@property (nonatomic, strong) id<SZHandlerProtocol> handler;

- (NSString *)handlerRequest:(NSInteger)request;

@end
