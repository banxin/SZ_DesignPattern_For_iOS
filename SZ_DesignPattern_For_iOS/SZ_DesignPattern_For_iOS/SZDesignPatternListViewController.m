//
//  SZDesignPatternListViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZDesignPatternListViewController.h"

/*
 编程是一门技术，更是一门艺术！
 */

/*
 面向对象的编程，并不是类越多越好，类的划分是为了封装，但分类的基础是抽象，具有相同属性和功能的对象的抽象集合才是类！
 */

/*
 设计模式基本原则:↓↓↓↓↓↓↓↓↓↓↓↓↓--如下--↓↓↓↓↓↓↓↓↓↓↓↓↓
 */

/*
 • 开放-封闭原则（OCP），是说软件实体（类、模块、函数等等）应该可以拓展，但是不可修改。
 对于扩展是开放的，对于更改是封闭的。
 • 开放-封闭原则是说软件实体（类、模块、函数等）应该是可扩展但不可修改，或者说对于扩展是开放的，对于修改是封闭的。这样可以使得设计在面对需求的改变保持相对稳定，不断迭代。
 • 无论模块多么封闭，都会存在一些无法对之封闭的变化。既然不可能完全封闭，设计人员必须对于他设计的模块应该对那种变化进行封闭做出选择。他必须先猜测出最有可能发生的变化的种类，然后构造抽象来隔离这些变化。
 • 在最初写代码时，假设变化不会发生。当变化发生时，我们就创建抽象来隔离以后发生的同类变化。
 • 面对需求，对程序的改动是通过增加新代码进行的，而不是更改现有的代码。
 • 我们希望的是在开发工作展开不久就知道可能发生的变化，查明可能发生的变化等待的时间越长，要创建正确的抽象就越困难。
 • 开放-封闭原则是面向对象设计的核心所在，遵循这个原则可以带来面向对象技术所声称的巨大好处，就是可维护、可扩展、可复用、灵活性好。开发人员应该仅对程序中呈现出频繁变化的部分进行抽象，然而，对于应用程序中的每个部分都刻意地进行抽象同样不是一个好主意。拒绝不成熟的抽象和抽象本身一样重要。
 */

/*
 • 单一职责原则（SRP）就是一个类而言，应该仅有一个引起它变化的原因。
 • 一个类承担的职责过多，就等于把这些职责耦合在一起。一个职责的变化可能会削弱或者抑制这个类完成其他职责的能力，这种耦合会导致脆弱的设计，当变化发生时，设计会遭受到意想不到的破坏（个人理解，不管是类、还是方法，都需要做到单一职责原则）。
 软件设计真正要做的许多内容，就是发现职责并把那些职责相互分离。如果你能够想到多于一个的动机去改变一个类，那么这个类就具有多于一个的职责，就应该考虑职责的分离。
 */

/*
 • 依赖倒转原则（DIP），A. 高层模块不应该依赖低层模块，两个都应该依赖抽象。B. 抽象不应该依赖细节，细节应该依赖抽象。针对接口编程，而不是针对实现编程。
 • 依赖倒转可以说是面向对象的标志，用哪种语言来编写程序不重要，如果编写时考虑的都是如何针对抽象编程而不是针对细节编程，即程序中所有的依赖关系都是终止于抽象类或接口，那就是面向对象的设计，反之那就是过程化的设计了。
 */

/*
 • 里氏代换原则就是一个软件实体如果使用一个父类的话。那么一定适用其子类，而且它察觉不出父类对象和子类对象的区别。也就是说，在软件中把父类替换成它的子类，程序的行为没有变化。简单地说，子类型必须能够替换到他们的父类型（继承）。
 • 只有当子类可以替换掉父类，软件单位的功能不受到影响时，父类才能真正被复用，而子类也能在父类的基础上增加新的功能。——例如：在“面向对象”设计时，企鹅类是不能继承自鸟类的，子类拥有父类非private的行为和属性，鸟会飞，而企鹅不会，所以在编程世界，企鹅不能继承鸟类。正是因为子类型的可替换性才使得使用父类类型的模块在无需修改的情况下就可以扩展。
 */

/*
 • 迪米特法则（LoD），又称最少知识原则，如果两个类不必彼此直接通信，那么这两个类就不应当发生直接的相互作用。如果其中一个类需要调用另一个类的某一个方法的话，可以通过第三方转发这个调用。
 首先是在类的结构设计上，每一个类都应当尽量降低成员的访问权限，也就是不需要让别人知道的就不要公开。
 迪米特法则的根本思想是强调了类之间的松耦合，类之间的耦合越弱，越有利于复用，一个处在松耦合的类被修改不会对有关系的类造成波及。
 */

/*
 • 合成/聚合复用原则（CARP），尽量使用合成/聚合，尽量不要使用类继承。（聚合（Aggregation）表示一种‘弱’的拥有关系，体现的是A对象可以包含B对象，但B对象不是A对象的一部分。——例如：每只大雁都属于一个雁群，但一个雁群可以包含多只大雁。合成（Composition，也有叫组合的）是一种强的‘拥有’关系，体现了严格的部分和整体关系，部分和整体的声明周期一样。——例如：鸟和翅膀。）
 */

@interface SZDesignPatternListViewController ()

@property (nonatomic, strong) NSArray *titleAry;

@end

@implementation SZDesignPatternListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"设计模式列表";
}

#pragma - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = self.titleAry[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self push:[self getVCName:indexPath.row]];
}

- (NSString *)getVCName:(NSInteger)rowNum
{
    switch (rowNum) {
            
        case 0:
            
            return @"SZSimpleFactoryViewController";
            
            break;
            
        case 1:
            
            return @"SZStrategyViewController";
            
            break;
            
        case 2:
            
            return @"SZDecoratorViewController";
            
            break;
            
        case 3:
            
            return @"SZProxyViewController";
            
            break;
            
        case 4:
            
            return @"SZFactoryMethodViewController";
            
            break;
            
        case 5:
            
            return @"SZPrototypeViewController";
            
            break;
            
        case 6:
            
            return @"SZTemplateMethodViewController";
            
            break;
            
        case 7:
            
            return @"SZFacadeViewController";
            
            break;
            
        case 8:
            
            return @"SZBuilderViewController";
            
            break;
            
        case 9:
            
            return @"SZObserveViewController";
            
            break;
            
        case 10:
            
            return @"SZAbstractFactoryViewController";
            
            break;
            
        case 11:
            
            return @"SZStateViewController";
            
            break;
            
        case 12:
            
            return @"SZAdapterViewController";
            
            break;
            
        case 13:
            
            return @"SZMementoViewController";
            
            break;
            
        case 14:
            
            return @"SZCompositeViewController";
            
            break;
            
        case 15:
            
            return @"SZIteratorViewController";
            
            break;
            
        case 16:
            
            return @"SZSingletonViewController";
            
            break;
            
        case 17:
            
            return @"SZViewBridgeController";
            
            break;
            
        case 18:
            
            return @"SZCommandViewController";
            
            break;
            
        case 19:
            
            return @"SZChainOfResponsibilityViewController";
            
            break;
            
        case 20:
            
            return @"SZMediatorViewController";
            
            break;
            
        case 21:
            
            return @"SZFlyweightViewController";
            
            break;
            
        case 22:
            
            return @"SZInterpreterViewController";
            
            break;
            
        case 23:
            
            return @"SZVisitorViewController";
            
            break;
            
        default:
            
            return nil;
            
            break;
    }
}

- (void)push:(NSString *)className
{    
    [self.navigationController pushViewController:[NSClassFromString(className) new] animated:YES];
}

#pragma mark - getter / setter

- (NSArray *)titleAry
{
    if (!_titleAry) {
        
        _titleAry = @[@"1.简单工厂模式", @"2.策略模式", @"3.装饰模式", @"4.代理模式", @"5.工厂方法模式", @"6.原型模式", @"7.模板模式", @"8.外观模式", @"9.建造者模式", @"10.观察者模式", @"11.抽象工厂模式", @"12.状态模式", @"13.适配器模式", @"14.备忘录模式", @"15.组合模式", @"16.迭代器模式", @"17.单例模式", @"18.桥接模式", @"19.命令模式", @"20.职责链模式", @"21.中介者模式", @"22.享元模式", @"23.解释器模式", @"24.访问者模式"];
    }
    
    return _titleAry;
}

@end
