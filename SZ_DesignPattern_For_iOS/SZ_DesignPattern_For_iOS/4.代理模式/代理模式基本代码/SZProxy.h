//
//  SZProxy.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/19.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZGiveGift.h"

@class SZGirl;

// 送礼物代理类
@interface SZProxy : NSObject<SZGiveGift>

- (instancetype)initWithGirl:(SZGirl *)girl;

@end
