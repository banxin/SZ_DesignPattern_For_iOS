//
//  SZCommandViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZCommandViewController.h"

// 基本代码
#import "SZCommandProtocol.h"
#import "SZReceiver.h"
#import "SZConcreteCommand.h"
#import "SZInvoker.h"

// 事例代码
#import "SZBakeCommandProtocol.h"
#import "SZBarbecuer.h"
#import "SZBakeMuttonCommand.h"
#import "SZBakeChickenWingCommand.h"
#import "SZWaiter.h"

/*
 从路边烧烤摊混乱无序和烧烤店井然有序引入问题。
 需求，模仿路边烧烤摊和烧烤店的模式写出对应的代码。
 版本1
 路边烧烤摊的紧耦合
 阿里巴巴有烤羊肉和烤鸡翅两个方法，客户端相当于顾客，此时顾客与阿里巴巴紧耦合，这样虽然简单，但是极为僵化，有很多隐患比如任务的调度混乱无序、难以修改等。
 版本2
 烧烤店的松耦合
 客户端相当于顾客，向服务员类发出命令，服务员有设置命令和通知执行两个方法，命令抽象类包含烤肉和烤鸡翅两个具体子类，烤肉者接到命令执行相关操作。
 
 命令模式
 • 命令模式是将一个请求封装为一个对象，从而使你可用不同的请求对客户进行参数化；对请求排队或者记录日志，以及支持可撤销的操作；将请求操作的对象和执行操作的对象分开。
 • 优点是可以比较容易地设计一个命令队列；在需要的情况下，可以较容易地将命令计入日志；在允许接受请求的一方可以决定是否否决请求；可以比较容易地实现对请求的撤销和重做；由于加入新的具体命令类不影响其他的类，因此增加新的具体命令类很容易。
 */

@interface SZCommandViewController ()

@end

@implementation SZCommandViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"命令模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getRandomNumber:0 to:1] == 0 ? [self testBasic] : [self testReflex];
}

- (void)testBasic
{
    id<SZCommandProtocol> command = [SZConcreteCommand new];
    
    command.receiver = [SZReceiver new];
    
    SZInvoker *invoker = [SZInvoker new];
    
    invoker.command = command;
    
    self.lblResult.text = [NSString stringWithFormat:@"基本代码测试： %@", [invoker executeCommand]];
}

- (void)testReflex
{
    // 开店前准备，找好烤肉师傅、服务员，准备烤肉菜单
    SZBarbecuer *barbecuer = [SZBarbecuer new];
    
    id<SZBakeCommandProtocol> command1 = [SZBakeMuttonCommand new];
    id<SZBakeCommandProtocol> command2 = [SZBakeMuttonCommand new];
    id<SZBakeCommandProtocol> command3 = [SZBakeChickenWingCommand new];
    id<SZBakeCommandProtocol> command4 = [SZBakeMuttonCommand new];
    
    command1.barbecuer = barbecuer;
    command2.barbecuer = barbecuer;
    command3.barbecuer = barbecuer;
    
    SZWaiter *waiter = [SZWaiter new];
    
    NSMutableString *showStr = [NSMutableString stringWithString:@"事例代码测试：\n\n"];
    
    // 开门营业
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [waiter setOrder:command1]]];
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [waiter setOrder:command2]]];
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [waiter setOrder:command3]]];
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [waiter setOrder:command4]]];
    
    // 点菜完毕，通知厨房
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [waiter notify]]];
    
    self.lblResult.text = showStr;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 取消一份羊肉串
        [waiter cancelOrder:command4];
    });
}

@end
