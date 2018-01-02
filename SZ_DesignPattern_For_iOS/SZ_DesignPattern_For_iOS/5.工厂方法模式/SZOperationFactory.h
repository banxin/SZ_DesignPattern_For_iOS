//
//  SZOperationFactory.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZOperation.h"

@protocol SZOperationFactory <NSObject>

- (id<SZOperation>)createOperation;

@end
