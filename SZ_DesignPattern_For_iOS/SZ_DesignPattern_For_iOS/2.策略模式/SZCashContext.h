//
//  SZCashContext.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SZCashOperation.h"

typedef NS_ENUM(NSInteger, SZCashType){
    SZCashTypeNormal = 0,
    SZCashTypeRobate,
    SZCashTypeReturn
};

@interface SZCashContext : NSObject

- (instancetype)initWithCashOperation:(id<SZCashOperation>)cashOperation;

- (instancetype)initWithCashType:(SZCashType)type;

- (CGFloat)getResult:(CGFloat)money;

@end
