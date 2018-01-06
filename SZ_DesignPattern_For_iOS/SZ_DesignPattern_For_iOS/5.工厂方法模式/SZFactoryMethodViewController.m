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

/*
 简单工厂模式与工厂方法模式对比。
 简单工厂模式通过运算符号switch判断需要创建的运算子类，工厂方法模式是一个运算方法对应一个工厂子类，工厂子类只能创建对应的运算子类（一一对应）。
 简单工厂模式的最大优点在于工厂类中包含了必要的逻辑判断，根据客户的选择条件动态实例化相关的类，对于客户端来说去除了与具体产品的依赖。但是这样就会对扩展开放的同时对修改开放（添加新运算子类需要修改工厂类中的switch）。
 为了解决这个问题，通过依赖倒置原则，将工厂类抽象出一个接口，接口只有一个创建抽象产品的工厂方法，然后所有的要生产具体类的工厂，就去实现这个接口，这样一个简单工厂模式的工厂类就变成了一个工厂抽象接口和多个具体生成对象的工厂。于是我们要增加新的功能时就不需要更改原有的工厂类了，只需要增加此功能的运算类和工厂子类就可以了。
 
 工厂方法模式
 • 工厂方法模式定义一个用于创建对象的接口，让子类决定实例化哪一个类，工厂方法使一个类的实例化延迟到其子类。
 • 工厂方法模式在实现时，客户端还是需要决定实例化哪一个工厂来实现运算类，选择判断的问题还是存在的，也就是说工厂方法把简单工厂的内部逻辑判断转移到了客户端代码来进行。
 • 工厂方法模式克服了简单共唱违背开放-封闭设计原则的缺点，又保持了封装对象创建过程的有点。
 */

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
