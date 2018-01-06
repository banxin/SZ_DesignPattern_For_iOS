//
//  SZVisitorViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZVisitorViewController.h"

// 基本代码
#import "SZConcreteVistor1.h"
#import "SZConcreteVistor2.h"
#import "SZObjectStructure.h"
#import "SZConcreteElementA.h"
#import "SZConcreteElementB.h"

// 事例代码
#import "SZSuccess.h"
#import "SZFailed.h"
#import "SZAmativeness.h"
#import "SZMan.h"
#import "SZWoman.h"
#import "SZPersonObjectStructure.h"

/*
 • 访问者模式表示一个作用于某对象结构中的各元素的操作，它使你可以在不改变各元素的类的前提下定义作用于这些元素的新操作。
 • 访问者模式适用于数据结构相对稳定的系统，它把数据结构和作用于结构上的操作之间的耦合解脱，使得操作集合可以相对自由地演化。
 • 访问者模式的目的是要把处理从数据结构分离出来，如果系统有比较稳定的数据结构又有易于变化的算法的话，使用访问者模式就是比较合适的。
 访问者模式的优点就是增加新的操作很容易，因为增加新的操作就意味着增加一个新的访问者，访问者模式将有关的行为集中到一个访问者对象中。
 */

@interface SZVisitorViewController ()

@end

@implementation SZVisitorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"访问者模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getRandomNumber:0 to:1] == 0 ? [self testBasic] : [self testReflex];
}

- (void)testBasic
{
    SZObjectStructure *objectStructure = [SZObjectStructure new];
    
    [objectStructure attach:[SZConcreteElementA new]];
    [objectStructure attach:[SZConcreteElementB new]];
    
    SZConcreteVistor1 *vistor1 = [SZConcreteVistor1 new];
    SZConcreteVistor2 *vistor2 = [SZConcreteVistor2 new];
    
    self.lblResult.text = [NSString stringWithFormat:@"基本代码测试：\n\nVistor1：\n%@\nVistor2：\n%@", [objectStructure accept:vistor1], [objectStructure accept:vistor2]];
}

- (void)testReflex
{
    SZPersonObjectStructure *personObjectStructure = [SZPersonObjectStructure new];
    
    [personObjectStructure attach:[SZMan new]];
    [personObjectStructure attach:[SZWoman new]];
    
    SZSuccess *success = [SZSuccess new];
    SZFailed *failed = [SZFailed new];
    SZAmativeness *amativeness = [SZAmativeness new];
    
    self.lblResult.text = [NSString stringWithFormat:@"事例代码测试：\n\nSuccess：\n%@\nFailed：\n%@\nAmativeness：\n%@", [personObjectStructure accept:success], [personObjectStructure accept:failed], [personObjectStructure accept:amativeness]];
}

@end
