//
//  SZOperationFactory.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZOperationFactory.h"

typedef NS_ENUM(NSInteger, SZOperationType) {
    
    SZOperationTypeAdd = 0,
    SZOperationTypeMinus,
    SZOperationTypdeMultipy,
    SZOperationTypeDivide
};

@implementation SZOperationFactory

+ (id<SZOperation>)createOperation:(NSString *)operationType
{
    NSArray *operationTyeAry = @[@"+", @"-", @"*", @"/"];
    
    // 获取下标
    SZOperationType opeType = [operationTyeAry indexOfObject:operationType];
    
    switch (opeType) {
            
        case SZOperationTypeAdd:
            
            return [NSClassFromString(@"SZOpetationAdd") new];
            
            break;
            
        case SZOperationTypeMinus:
            
            return [NSClassFromString(@"SZOperationMinus") new];
            
            break;
            
        case SZOperationTypdeMultipy:
            
            return [NSClassFromString(@"SZOperationMultiply") new];
            
            break;
            
        case SZOperationTypeDivide:
            
            return [NSClassFromString(@"SZOperationDivide") new];
            
            break;
            
        default:
            
            return nil;
            
            break;
    }
}

@end
