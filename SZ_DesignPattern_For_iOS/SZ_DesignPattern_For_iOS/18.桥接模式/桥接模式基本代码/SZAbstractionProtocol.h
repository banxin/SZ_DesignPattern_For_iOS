//
//  SZAbstractionProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/28.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZImplementorProtocol.h"

@protocol SZAbstractionProtocol <NSObject>

@property (nonatomic, strong) id<SZImplementorProtocol> implementor;

- (NSString *)operation;

@end
