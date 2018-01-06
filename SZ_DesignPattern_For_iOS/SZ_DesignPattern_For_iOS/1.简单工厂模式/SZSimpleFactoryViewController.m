//
//  SZSimpleFactoryViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSimpleFactoryViewController.h"
#import "SZOperationFactory.h"

/*
 通过一个计算器小程序引入话题。
 需求，用户输入运算符及两个参数，得出运算结果。
 版本1
 输入a,b,符号，然后通过swith判断运算方式。
 问题：耦合，扩展性较差，每次添加新运算方式都需要改动源代码。
 版本2
 界面部分与逻辑部分分离耦合度下降，使得逻辑部分可以复用，更加容易维护和扩展。
 问题：当需要添加运算方式的时候，需要频繁改动逻辑部分，现在需要将逻辑部分再次进行拆分，运用面向对象的继承。
 版本3
 逻辑部分，利用了继承，抽象父类Operation类实现getResult方法，子类加减乘除等实际的运算重写getResult，实现修改其中一个不影响另一个。
 版本4
 简单工厂模式，用一个单独的类来进行这个创造实例的过程，这就是工厂。将运算符号输入工厂，得到对应的运算子类，通过多态，直接使用父类的getResult方法实际上是子类的getResult方法。
 
 • 封装、继承、多态可以降低程序耦合度。
 • 用设计模式使得程序更加简单灵活，容易修改复用。
 • 业务逻辑与界面逻辑分离，降低耦合度增强程序维护扩展性。
 • 多态的使用可以通过父类（实际上是子类）实现计算器的结果。
 */

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
