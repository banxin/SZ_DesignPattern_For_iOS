//
//  SZObserveViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZObserveViewController.h"
#import "SZStockObserver.h"
#import "SZSecretary.h"
#import "SZNBAObserve.h"
#import "SZBoss.h"

/*
 由上班同事因未及时得到前台通知被老板发现看股票被批评引出话题。
 需求，编写一个程序反映上班的事情。
 版本1
 前台的类有添加通知对象的方法、通知已添加对象的方法，同事是通知的接收者在得到通知后调用对应方法。
 问题：前台类与同事类之间相互耦合，需要解耦，都去依赖抽象。
 版本2
 增加了抽象的观察者，具体观察者子类重写抽象方法，前台类中直使用抽象观察者父类，减少耦合。
 问题：前台也是一个具体的类。
 版本3
 前台类现在作为通知者抽象类的子类，重写对应抽象方法，添加了删除观察者的方法。
 
 观察者模式
 • 观察者模式定义了一种一对多的依赖关系，让多个观察者对象同时去监听某一个主题对象。这个主题对象在状态发生改变时会通知所有观察者对象，使他们可以自动更新自己。
 • 观察者模式的动机是将一个系统分割成一系列相互协作的类有一个很不好的副作用，那就是需要维护相关对象间的一致性，我们不希望为了维持一致性而使各类紧密的耦合，这样会给维护、扩展和重用都带来不便。
 • 观察者模式在一个对象的改变需要同时改变其他对象的时候使用，而且当不知道具体有多少对象有待改变时，应该考虑观察者模式。
 • 总的来说，观察者模式的作用就是解除通知者与观察者之间的耦合，让耦合的双方都依赖于抽象而不是依赖于具体，从而使得各自的变化都不会影响另一边的变化。
 • 委托就是一种引用方法的类型，一旦为委托分配了方法，委托将与该方法具有相同的行为，委托方法的使用可以向其他任何方法一样，具有参数和返回值，委托可以看做是对函数的抽象，是函数的“类”，委托的实例将代表一个具体的函数（其实就是OC的Block）。
 • 一个委托可以搭载多个方法，所有方法被依次唤起，它可以使得委托对象所搭载的方法并不需要属于同一个类。
 • 委托对象所搭载的所有方法必须有相同的原型和形式，也就是拥有相同的参数列表和返回值类型。
 */

@interface SZObserveViewController ()

@end

@implementation SZObserveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"观察者模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testObserve:[self getRandomNumber:0 to:1]];
}

/*
 实现如书中说的事件委托，一个特殊的类，能搭载多个不同的类的不同个方法执行，使用了block回调来实现
 */
- (void)testObserve:(NSInteger)type
{
    SZStockObserver *observeA = [SZStockObserver new];
    
    observeA.name = @"observeA";

    SZNBAObserve *observeB = [SZNBAObserve new];
    
    observeB.name = @"observeB";
    
    // 由于使用block，无论多少个都可以通知到位，也避免了传统方法中的添加和删除
    
    id<SZSubject> subject;
    
    if (type == 0) {

        // 前台
        subject = [SZSecretary new];
        
    } else {
        
        // 老板
        subject = [SZBoss new];
    }
    
    __weak typeof(self)    weakSelf    = self;
    __weak typeof(subject) weakSubject = subject;
    
    subject.SZSubjectCallBack = ^{
        
        __strong typeof(weakSelf)    strongSelf    = weakSelf;
        __strong typeof(weakSubject) strongSubject = weakSubject;
        
        strongSelf.lblResult.text = [NSString stringWithFormat:@"%@\n%@\n%@\n", [strongSubject stateStr], [observeA closeStock], [observeB closeNBA]];
    };
    
    // 通知两个员工
    [subject notify];
}

@end
