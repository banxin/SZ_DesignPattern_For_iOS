//
//  SZDecoratorViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/18.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZDecoratorViewController.h"

// 基本代码
#import "SZConcreteComponent.h"
#import "SZConcreteDecoratorA.h"
#import "SZConcreteDecoratorB.h"

// 事例代码
#import "SZMakeCoffee.h"
#import "SZCoffeeBeanA.h"
#import "SZCoffeeBeanB.h"
#import "SZMakeCoffeeWithMilk.h"
#import "SZMakeCoffeeWithSugar.h"
#import "SZMakeCoffeeWithMocha.h"

@interface SZDecoratorViewController ()

@end

@implementation SZDecoratorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"装饰模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！点击后注意观察控制台输出";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testDecorator:[self getRandomNumber:0 to:1]];
}

- (void)testDecorator:(NSInteger)type
{
    // 测试装饰模式基本代码
    if (type == 0) {
        
        self.lblResult.text = @"装饰模式基本代码测试！！！注意观察控制台输出！！！";
        
        SZConcreteComponent *component = [SZConcreteComponent new];
        
        SZConcreteDecoratorA *decoratorA = [SZConcreteDecoratorA new];
        SZConcreteDecoratorB *decoratorB = [SZConcreteDecoratorB new];
        
        /*
         装饰方法为：
         
         首先实例化 component ，然后使用 decoratorA 来包装 component，再使用 decoratorB 来包装 decoratorA，最后 执行 decoratorB 的operation方法。
         */
        decoratorA.component = component;
        decoratorB.component = decoratorA;
        [decoratorB operation];
        
        // 改变装饰顺序，可打开测试一波
//        decoratorB.component = component;
//        decoratorA.component = decoratorB;
//
//        [decoratorA operation];

        // 测试装饰模式事例代码
    } else {
        
        self.lblResult.text = @"装饰模式事例代码测试！！！注意观察控制台输出！！！";
        
        [self testMakeCoffee:[self getRandomNumber:0 to:1]];
    }
}

- (void)testMakeCoffee:(NSInteger)coffeeBeanType
{
    id<SZCoffee> makeCoffe;
    
    if (coffeeBeanType == 0) {
        
        makeCoffe = [SZCoffeeBeanA new];
        
    } else {
        
        makeCoffe = [SZCoffeeBeanB new];
    }
    
    SZMakeCoffeeWithMilk  *milk  = [SZMakeCoffeeWithMilk  new];
    SZMakeCoffeeWithSugar *sugar = [SZMakeCoffeeWithSugar new];
    SZMakeCoffeeWithMocha *macha = [SZMakeCoffeeWithMocha new];
    
    NSInteger processType = [self getRandomNumber:0 to:3];
    
    switch (processType) {
            
        case 1:
            
            milk.process  = makeCoffe;
            
            [milk getCoffeeDescription];
            
            break;
            
        case 2:
            
            milk.process  = makeCoffe;
            sugar.process = milk;
            
            [sugar getCoffeeDescription];
            
            break;
            
        case 3:
            
            milk.process  = makeCoffe;
            sugar.process = milk;
            macha.process = sugar;
            
            [macha getCoffeeDescription];
            
            break;
            
        default:
            
            [makeCoffe getCoffeeDescription];
            
            break;
    }
}

@end
