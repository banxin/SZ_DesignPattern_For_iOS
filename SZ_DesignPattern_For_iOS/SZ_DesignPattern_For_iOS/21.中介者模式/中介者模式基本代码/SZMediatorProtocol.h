//
//  SZMediatorProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/3.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

// 协议之间相互引用，需要使用 @protocol XXX；否则会出现编译错误
@protocol SZColleagueProtocol;

@protocol SZMediatorProtocol <NSObject>

- (NSString *)send:(NSString *)message colleague:(id<SZColleagueProtocol>)colleague;

@end
