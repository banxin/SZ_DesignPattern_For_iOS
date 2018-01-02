//
//  SZCashContext.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZCashContext.h"
#import "SZCashNormal.h"
#import "SZCashRebate.h"
#import "SZCashReturn.h"

@interface SZCashContext ()

@property (nonatomic, strong) id<SZCashOperation> cashOperation;

@end

@implementation SZCashContext

- (instancetype)initWithCashOperation:(id<SZCashOperation>)cashOperation
{
    self = [super init];
    
    if (self) {
        
        self.cashOperation = cashOperation;
    }
    
    return self;
}

- (instancetype)initWithCashType:(SZCashType)type
{
    self = [super init];
    
    if (self) {
        
        switch (type) {
                
            case SZCashTypeNormal:
                
                self.cashOperation = [[SZCashNormal alloc] init];
                
                break;
                
            case SZCashTypeRobate:
                
                self.cashOperation = [[SZCashRebate alloc] initWithMoneyRebate:0.7f];
                
                break;
                
            case SZCashTypeReturn:
                
                self.cashOperation = [[SZCashReturn alloc] initWithMoneyReturn:20 andCondition:100];
                
                break;
                
            default:
                
                self.cashOperation = nil;
                
                break;
        }
    }
    
    return self;
}

- (CGFloat)getResult:(CGFloat)money
{
    // 如果结算方式存在
    if (self.cashOperation) {
        
        return [self.cashOperation acceptCash:money];
        
    } else {
        
        return -1;
    }
}

- (NSString *)description
{
    return [self.cashOperation description];
}

@end
