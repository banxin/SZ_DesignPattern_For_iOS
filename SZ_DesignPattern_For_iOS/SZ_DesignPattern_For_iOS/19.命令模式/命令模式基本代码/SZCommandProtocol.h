//
//  SZCommandProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZReceiver.h"

@protocol SZCommandProtocol <NSObject>

@property (nonatomic, strong) SZReceiver *receiver;

- (NSString *)execute;

@end
