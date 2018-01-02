//
//  SZOperationMinusFactory.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZOperationMinusFactory.h"
#import "SZOperationMinus.h"

@implementation SZOperationMinusFactory

- (id<SZOperation>)createOperation
{
    return [[SZOperationMinus alloc] init];
}

@end
