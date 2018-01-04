//
//  SZColleagueProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/3.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZMediatorProtocol.h"

@protocol SZColleagueProtocol <NSObject>

@property (nonatomic, strong) id<SZMediatorProtocol> mediator;

- (NSString *)notify:(NSString *)message;

@end
