//
//  SZWork.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZStateProtocol.h"

@interface SZWork : NSObject

@property (nonatomic, assign) NSInteger hour;

@property (nonatomic, assign) BOOL isTaskFinish;

@property (nonatomic, strong) id<SZStateProtocol> currentState;

- (NSString *)writeProgram;

@end
