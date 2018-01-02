//
//  SZGiveGift.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/19.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZGiveGift <NSObject>

// 送娃娃
- (void)giveDoll;

// 送花
- (void)giveFlowers;

// 送巧克力
- (void)giveChocolate;

@end
