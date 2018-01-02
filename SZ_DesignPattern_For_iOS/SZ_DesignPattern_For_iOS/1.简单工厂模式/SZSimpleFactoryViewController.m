//
//  SZSimpleFactoryViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSimpleFactoryViewController.h"
#import "SZOperationFactory.h"

@interface SZSimpleFactoryViewController ()

@end

@implementation SZSimpleFactoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"简单工厂模式";
    
    self.lblTips.text = @"轻触屏幕测试哦!!!";
}

#pragma mark - private method

- (void)operation:(CGFloat)numberA numberB:(CGFloat)numberB operationType:(NSString *)operationType
{
    id<SZOperation> ope = [SZOperationFactory createOperation:operationType];
    
    if (ope == nil) {
        
        NSLog(@"目前只支持('+', '-', '*', '/'), 您的计算要求暂时不支持哦, 如有需要，请联系PD");
        
        self.lblResult.text = @"目前只支持('+', '-', '*', '/'), 您的计算要求暂时不支持哦, 如有需要，请联系PD";
        
        return;
    }
    
    ope.numberA = numberA;
    ope.numberB = numberB;
    
    CGFloat result = [ope getResult];

    if (result == INFINITY) {
        
        self.lblResult.text = @"计算出错，除数不能为0";
        
        return;
    }
    
    NSLog(@"%@", [NSString stringWithFormat:@"numberA：%.2f, numberB：%.2f, 计算方式为：%@, 计算结果为：%.2f", numberA, numberB, [ope description], result]);
    
    self.lblResult.text = [NSString stringWithFormat:@"numberA：%.2f, numberB：%.2f, 计算方式为：%@, 计算结果为：%.2f", numberA, numberB, [ope description], result];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray *opeTypeAry = @[@"+", @"-", @"*", @"/", @">"];
    
    NSInteger typeRandom = [self getRandomNumber:0 to:4];
    
    NSString *typeStr = opeTypeAry[typeRandom];
    
     // 此段为测试除数为0的代码，需要测试，请自行取消注释测试
        if ([typeStr isEqualToString:@"/"]) {
    
            NSInteger divideRandom = [self getRandomNumber:0 to:1];
    
            if (divideRandom == 0) {
    
                [self operation:32 numberB:8 operationType:typeStr];
    
                return;
    
            } else {
    
                // 测试除数为 0 时 断言是否生效
                [self operation:32 numberB:0 operationType:typeStr];
    
                return;
            }
        }
    
    [self operation:32 numberB:8 operationType:typeStr];
}

@end
