//
//  SZOperationDivideFactory.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZOperationDivideFactory.h"
#import "SZOperationDivide.h"

@implementation SZOperationDivideFactory

- (id<SZOperation>)createOperation
{
    return [SZOperationDivide new];
}

@end
