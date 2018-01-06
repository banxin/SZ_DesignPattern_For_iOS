//
//  SZAbstractFactoryViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZAbstractFactoryViewController.h"
#import "SZUser.h"
#import "SZSqlserveUser.h"
#import "SZUserProtocol.h"
#import "SZFactoryProtocol.h"
#import "SZSqlserveFactory.h"
#import "SZAccessFactory.h"
#import "SZDepartment.h"
#import "SZDataAccess.h"

/*
 从公司有两种数据库而使用方法有所不同来引入话题。
 需求，创建一个数据访问的类，有新增用户、获取用户两个方法，用户类有ID和NAME两个字段。
 版本1
 用户对象，有id和name两个字段及对应的Get/Set方法。数据库对象，有存用户和获取用户的方法。
 问题：数据库与user对象耦合度过高，需要抽离。
 版本2
 使用了工厂方法模式，数据库父类包含SQL和Access两个子类，实现父类的虚方法。增加User父类，子类SQLUser/AccessUser分别对应两个数据库，实现父类中增加、获取用户的虚方法。
 问题：虽然这样降低了耦合度，但是当需要操作的类不止user一种的时候需要增加的部分就会非常多。
 版本3
 添加Department类，包含SQLDepartment和AccessDepartment两个子类，有对需要存储、获取的对象进行操作的方法。而且数据库子类有实现创建对应数据库类型的数据类型的虚方法。
 问题：当要继续增加存储的数据类型的时候，需要改动数据库所有相关的类添加对应的创建方法。
 版本4
 静态变量存储目前选择的数据库，使用简单工厂来通过存储的静态变量选择对应的数据库实体来创建对象。这样就避免了在客户端选择具体的数据库子类实现了一部分的解耦目的（对工厂方法进行配置）。
 问题：如果需要增加数据库就需要修改简单工厂方法中的switch。
 版本5
 通过反射来实例化具体的数据库子类，避免修改switch的问题。
 
 抽象工厂模式
 • 抽象工厂模式提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。
 • 抽象工厂类中包含所有产品创建的抽象方法，而其子类则是具体的工厂了。通常是在运行时刻再创建一个具体的工厂类实例，然后由具体的工厂再创建具有特定实现的产品对象，也就是说为创建不同的产品对象，客户端应使用不同的具体工厂。
 • 这样的最大好处在于易于交换产品系列，由于具体工厂类在整个应用中只需要在初始化的时候出现一次，这就使得改变一个应用的具体工厂变得非常容易，只需要改变具体工厂即可使用不同的产品配置。
 • 但是也是有相应的缺点的，如果要增加一个产品的话，就需要改动大量相关的类。
 使用反射可以避免在工厂模式中的if/switch判断，解除分支判断带来的耦合。
 */

@interface SZAbstractFactoryViewController ()

@end

@implementation SZAbstractFactoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"抽象工厂模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！\nVC中基本代码和利用反射的代码，自行切换测试！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 测试基本抽象工厂代码
//    [self testBasicAbstract:[self getRandomNumber:0 to:1]];
    
    // 测试使用反射的代码
    [self testReflex:[self getRandomNumber:0 to:1]];
}

- (void)testBasicAbstract:(NSInteger)type
{
    SZUser *user = [SZUser new];
    
    user.userId = @(22);
    user.name = @"User A";
    
    SZDepartment *department = [SZDepartment new];
    
    department.departmentId = @(28);
    department.departmentName = @"Department A";
    
    id<SZFactoryProtocol> factory;
    
    if (type == 0) {
        
        factory = [SZSqlserveFactory new];
        
    } else {
        
        factory = [SZAccessFactory new];
    }
    
    id<SZUserProtocol> up = [factory createUser];
    
    id<SZDepartmentProtocol> dp = [factory createDepartment];

    self.lblResult.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@", [up insertUser:user], [up getUser:user], [dp insertDepartment:department], [dp getDepartment:department]];
}

- (void)testReflex:(NSInteger)dbType
{
    SZUser *user = [SZUser new];
    
    user.userId = @(22);
    user.name = @"User A";
    
    SZDepartment *department = [SZDepartment new];
    
    department.departmentId = @(28);
    department.departmentName = @"Department A";
    
    NSString *dbName = @"Sqlserve";
    
    if (dbType == 1) {
        
        dbName = @"Access";
    }
    
    id<SZUserProtocol> up = [SZDataAccess createUser:dbName];
    
    id<SZDepartmentProtocol> dp = [SZDataAccess createDepartment:dbName];
    
    self.lblResult.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@", [up insertUser:user], [up getUser:user], [dp insertDepartment:department], [dp getDepartment:department]];
}

@end
