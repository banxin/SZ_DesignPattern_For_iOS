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

/*
 Compent 是定义一个对象接口，可以给这些对象动态地添加职责。ConcreteComponent是定义了一个具体的对象，也可以给这个对象添加一些职责。Decorator，装饰抽象类，继承了Component，从外类扩展Component类的功能，但对于Component来说，是无需知道Decorator的存在的。至于ConcreteDecorator就是具体的装饰对象，起到给Component添加职责的功能。
 
 • 装饰模式是动态的给一个对象添加一些额外的职责，就增加功能来说，装饰模式比生成子类更加灵活。
 • 可以把所需要的功能按照正确的顺序串联起来进行控制。
 • 每个装饰对象的实现就和如何使用这个对象分离开了，每个装饰对象只关心自己的功能，不需要关心如何被添加到对象链当中（将原对象像礼物一样包裹了一层又一层，调用原对象的方法时同时执行自身装饰的方法）。
 • 装饰模式是为已有功能动态地添加更多功能的一种方式。当系统需要新功能的时候，是向旧的类中添加新的代码。这些新添加的代码通常装饰了原有类的核心职责或主要行为，但是这些新添加的代码在主类中加入了新的字段、新的方法和新的逻辑，从而增加了主类的复杂度，而这些新加入的东西仅仅是为了满足一些只在某种特定情况下才会去执行的特殊行为的需要，而装饰模式就是一种非常好的解决方案。它把每个要装饰的功能放在单独的类中，并让这个类包装它所需要装饰的对象，因此，当需要执行特殊行为时，客户代码就可以在运行时根据需要有选择地、按顺序的使用装饰功能包装对象了。
 优点总结下来就是把类中的装饰功能从类中搬移去除，这样可以简化原有的类。有效的把类的核心职责和装饰功能分开了，而且可以去除相关类中重复的装饰逻辑
 
 */

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
