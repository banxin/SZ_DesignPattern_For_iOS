//
//  SZStockObserver.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SZSecretary.h"
#import "SZObserve.h"
#import "SZSubject.h"

@class SZSecretary;

@interface SZStockObserver : NSObject<SZObserve>

@property (nonatomic, strong) NSString *name;

//@property (nonatomic, strong) id<SZSubject> subject;

- (NSString *)closeStock;

@end
