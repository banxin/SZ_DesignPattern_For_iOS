//
//  SZCashRebate.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZCashOperation.h"

// 打折收费
@interface SZCashRebate : NSObject<SZCashOperation>

- (instancetype)initWithMoneyRebate:(CGFloat)moneyRebate;

@end
