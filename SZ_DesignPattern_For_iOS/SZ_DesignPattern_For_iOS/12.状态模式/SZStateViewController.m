//
//  SZStateViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZStateViewController.h"
#import "SZWork.h"

/*
 根据一天工作精神状态的变化引入问题。
 需求，输入时间、任务是否完成输出状态。
 版本1
 简单的使用if-else过程式函数实现。
 版本2
 将过程式函数抽成对象，工作对象有时间、任务完成标记属性，返回状态的函数。
 问题：过多的判断导致LongMethod，拥有很多的判断分支代表它的责任过大无论是什么状态都是它负责改变。这个类违背了单一职责原则。
 版本3
 将各种时间段的工作拆分成子类，状态的判断在第一个子类开始，当不满足条件时将其转移到下一个子类，直到有子类符合对应的状态。比如，子类分为中午、下午、晚上，将时间交给中午类，中午类通过判断方法判断是否符合条件，不符合则调用下午类的判断方法...
 
 状态模式
 • 面向对象设计其实就是希望做到代码责任分解。
 • 状态模式是当一个对象的内在状态改变时允许改变其行为，这个对象看起来就像改变了其类。
 • 状态模式主要解决的是当控制一个对象状态转换条件表达式过于复杂时的情况，把状态的判断逻辑转移到表示不同状态的一系列类当中，可以把复杂的状态逻辑简化。
 • 状态模式的好处是将与特定状态相关的行为局部化，并且将不同状态的行为分割开来。就是将特定的状态相关的行为都放入一个对象中，由于所有与状态相关的代码都存在于某个子类中，所以通过定义新的子类可以很容易的增加新的状态和转换。这样做的目的就是为了消除庞大的条件分支语句，状态模式通过把各种状态转移逻辑分布到子类之间，减少互相之间的依赖（个人理解，就相当于将if-else或者switch语句通过面向对象的思想拆分开形成对应的子类，采用类似链表的方式进行判断的传递，从代码上看是避免了长方法的问题，但是从性能上来讲不推荐而且子类写起来真心麻烦）。
 • 当一个对象的行为取决于它的状态，并且它必须运行时刻根据状态改变它的行为时，就可以考虑使用状态模式了。
 */

@interface SZStateViewController ()

@end

@implementation SZStateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"状态模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testState:[self getRandomNumber:0 to:1]];
}

- (void)testState:(NSInteger)finishType
{
    NSMutableString *workStateStr = [NSMutableString stringWithString:@""];
    
    // 紧急项目
    SZWork *emergencyProjects = [SZWork new];
    
    emergencyProjects.hour = 9;
    
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 10;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 12;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 13;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 14;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 17;
    
    if (finishType == 0) {
        
        emergencyProjects.isTaskFinish = NO;
        
    } else {
        
        emergencyProjects.isTaskFinish = YES;
    }
    
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 19;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 22;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    self.lblResult.text = workStateStr;
}

@end












