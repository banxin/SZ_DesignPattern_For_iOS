//
//  SZMediatorViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/3.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZMediatorViewController.h"

// 基本代码
#import "SZConcreteMediator.h"
#import "SZConcreteColleague1.h"
#import "SZConcreteColleague2.h"

// 事例代码
#import "SZUniteNationsSecurityCouncil.h"
#import "SZUSA.h"
#import "SZIraq.h"

/*
 其实就是迪米特法则的体现。
 
 中介者模式
 • 中介者模式是用一个中介对象来封装一系列的对象交互，中介者使各对象不需要显式地相互引用，从而使耦合松散，并且可以独立地改变它们之间的交互。
 • 中介者模式很容易在系统中应用，但也很容易在系统中误用。当系统中出现了多对多交互复杂的对象群时，先不要急于使用中介者模式，而要先反思你的系统在设计上是不是合理。
 • 中介者的出现减少了各个对象之间的耦合，由于把对象如何协作进行了抽象，将中介者作为一个独立的概念并将其封装在一个对象中，这样关注点就从对象各自本身的行为转移到它们之间的交互上来，也就是站在更宏观的角度去看待系统（个人理解，中介者的集中化既是将对象之间交互的复杂性转移到中介者上）。
 • 中介者模式一般应用于一组对象以定义良好但是复杂的方式进行通信的场合（比如计算器控件中的button和label的关系），以及想要制定一个分布在多个类中的行为，而又不想生成太多子类的场合。
 */

@interface SZMediatorViewController ()

@end

@implementation SZMediatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"中介者模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getRandomNumber:0 to:1] == 0 ? [self testBasic] : [self testReflex];
}

- (void)testBasic
{
    // 中介者
    SZConcreteMediator *mediator = [SZConcreteMediator new];
    
    // 具体事例对象
    SZConcreteColleague1 *colleague1 = [SZConcreteColleague1 new];
    SZConcreteColleague2 *colleague2 = [SZConcreteColleague2 new];
    
    // 让具体事例认识中介者
    colleague1.mediator = mediator;
    colleague2.mediator = mediator;
    
    // 让中介者认识具体事例
    mediator.colleague1 = colleague1;
    mediator.colleague2 = colleague2;
    
    // 具体同事类发送信息，都是通过中介者转发
//    [colleague1 sendMsg:@"吃过饭了吗？"];
//    [colleague2 sendMsg:@"没呢，你打算请客吗？"];
    
    self.lblResult.text = [NSString stringWithFormat:@"基本代码测试：\n\n%@\n%@", [colleague1 sendMsg:@"吃过饭了吗？"], [colleague2 send:@"没呢，你打算请客吗？"]];
}

- (void)testReflex
{
    SZUniteNationsSecurityCouncil *uniteNationsSecurityCouncil = [SZUniteNationsSecurityCouncil new];
    
    SZUSA *usa = [SZUSA new];
    SZIraq *iraq = [SZIraq new];
    
    usa.uinityNations = uniteNationsSecurityCouncil;
    iraq.uinityNations = uniteNationsSecurityCouncil;
    
    uniteNationsSecurityCouncil.usa = usa;
    uniteNationsSecurityCouncil.iraq = iraq;
    
//    [usa waring:@"不准研发核武器，不然拆了你们！"];
//    [iraq declare:@"我们没有核武器，不过，也不惧侵略！"];
    
    self.lblResult.text = [NSString stringWithFormat:@"事例代码测试：\n\n%@\n%@", [usa waring:@"不准研发核武器，不然拆了你们！"], [iraq declare:@"我们没有核武器，不过，也不惧侵略！"]];;
}

@end
