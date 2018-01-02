//
//  SZPursuit.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/19.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZGiveGift.h"

@class SZGirl;

// 实际送礼物类
@interface SZPursuit : NSObject<SZGiveGift>

- (instancetype)initWithGirl:(SZGirl *)girl;

- (void)setupDelegate:(id<SZGiveGift>) delegate;

- (void)doGiveDoll;

- (void)doGiveFlowers;

- (void)doGiveChocolate;

@end
