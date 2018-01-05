//
//  SZVistorProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SZConcreteElementA, SZConcreteElementB;

@protocol SZVistorProtocol <NSObject>

- (NSString *)vistorConcreteElementA:(SZConcreteElementA *)concreteElementA;

- (NSString *)vistorConcreteElementB:(SZConcreteElementB *)concreteElementB;


@end
