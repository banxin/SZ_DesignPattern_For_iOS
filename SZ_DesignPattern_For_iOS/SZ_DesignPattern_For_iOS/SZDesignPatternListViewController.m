//
//  SZDesignPatternListViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZDesignPatternListViewController.h"

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
            
            return @"";
            
            break;
            
        case 21:
            
            return @"";
            
            break;
            
        case 22:
            
            return @"";
            
            break;
            
        case 23:
            
            return @"";
            
            break;
            
        case 24:
            
            return @"";
            
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
        
        _titleAry = @[@"1.简单工厂模式", @"2.策略模式", @"3.装饰模式", @"4.代理模式", @"5.工厂方法模式", @"6.原型模式", @"7.模板模式", @"8.外观模式", @"9.建造者模式", @"10.观察者模式", @"11.抽象工厂模式", @"12.状态模式", @"13.适配器模式", @"14.备忘录模式", @"15.组合模式", @"16.迭代器模式", @"17.单例模式", @"18.桥接模式", @"19.命令模式", @"20.职责链模式"];
    }
    
    return _titleAry;
}

@end
