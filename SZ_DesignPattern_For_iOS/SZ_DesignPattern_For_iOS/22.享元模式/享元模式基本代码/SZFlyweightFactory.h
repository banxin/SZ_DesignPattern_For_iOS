//
//  SZFlyweightFactory.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZFlyweightProtocol;

@interface SZFlyweightFactory : NSObject

- (id<SZFlyweightProtocol>)fetchFlyweight:(NSString *)key;

@end
