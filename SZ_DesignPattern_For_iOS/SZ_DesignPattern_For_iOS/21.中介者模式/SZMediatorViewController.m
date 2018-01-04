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
