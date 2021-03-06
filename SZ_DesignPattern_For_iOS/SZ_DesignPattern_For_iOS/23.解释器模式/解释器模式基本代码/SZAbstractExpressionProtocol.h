//
//  SZAbstractExpressionProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SZContext;

@protocol SZAbstractExpressionProtocol <NSObject>

- (NSString *)interpret:(SZContext *)context;

@end
