//
//  SZBakeCommandProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZBarbecuer.h"

@protocol SZBakeCommandProtocol <NSObject>

@property (nonatomic, strong) SZBarbecuer *barbecuer;

- (NSString *)excuteCommand;

@end
