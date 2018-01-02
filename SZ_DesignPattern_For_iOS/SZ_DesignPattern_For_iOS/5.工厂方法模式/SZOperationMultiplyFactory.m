//
//  SZOperationMultiplyFactory.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZOperationMultiplyFactory.h"
#import "SZOperationMultiply.h"

@implementation SZOperationMultiplyFactory

- (id<SZOperation>)createOperation
{
    return [[SZOperationMultiply alloc] init];
}

@end
