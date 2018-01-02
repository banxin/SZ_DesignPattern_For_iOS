//
//  SZOperationAddFactory.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZOperationAddFactory.h"
#import "SZOpetationAdd.h"

@implementation SZOperationAddFactory

- (id)createOperation
{
    return [[SZOpetationAdd alloc] init];
}

@end
