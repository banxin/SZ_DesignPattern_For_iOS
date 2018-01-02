//
//  SZSubject.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZSubject <NSObject>

@property (nonatomic, strong) void(^SZSubjectCallBack)(void);

- (NSString *)stateStr;

- (void)notify;

@end
