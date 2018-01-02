//
//  SZFactoryMethodViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZFactoryMethodViewController.h"

// 算法工厂
#import "SZOperationFactory.h"
#import "SZOperationAddFactory.h"
#import "SZOperationMinusFactory.h"
#import "SZOperationMultiplyFactory.h"
#import "SZOperationDivideFactory.h"

@interface SZFactoryMethodViewController ()

@end

@implementation SZFactoryMethodViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"工厂方法模式";
    
    self.lblTips.text = @"点击屏幕测试！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSInteger typeRandom = [self getRandomNumber:0 to:4];
    
    if (typeRandom == 3) {
        
        NSInteger divideRandom = [self getRandomNumber:0 to:1];
        
        if (divideRandom == 0) {
            
            [self operation:32 numberB:8 operationType:typeRandom];
            
            return;
            
        } else {
            
            // 测试除数为 0 时 断言是否生效
            [self operation:32 numberB:0 operationType:typeRandom];
            
            return;
        }
    }
    
    [self operation:32 numberB:8 operationType:typeRandom];
}

- (void)operation:(CGFloat)numberA numberB:(CGFloat)numberB operationType:(NSInteger)operationType
{
    id<SZOperationFactory> operationFactory;
    
    switch (operationType) {
            
        case 0:
            
            operationFactory = [[SZOperationAddFactory alloc] init];
            
            break;
            
        case 1:
            
            operationFactory = [[SZOperationMinusFactory alloc] init];
            
            break;
            
        case 2:
            
            operationFactory = [[SZOperationMultiplyFactory alloc] init];
            
            break;
            
        case 3:
            
            operationFactory = [[SZOperationDivideFactory alloc] init];
            
            break;
            
        default:
            
            self.lblResult.text = @"目前只支持('+', '-', '*', '/'), 您的计算要求暂时不支持哦, 如有需要，请联系PD";
            
            return;
            
            break;
    }
    
    id<SZOperation> operation = [operationFactory createOperation];
    
    operation.numberA = numberA;
    operation.numberB = numberB;
    
    CGFloat result = [operation getResult];
    
    if (result == INFINITY) {
        
        self.lblResult.text = @"计算出错，除数不能为0";
        
        return;
    }
    
    self.lblResult.text = [NSString stringWithFormat:@"numberA：%.2f, numberB：%.2f, 计算方式为：%@, 计算结果为：%.2f", numberA, numberB, [operation description], result];
}

@end
