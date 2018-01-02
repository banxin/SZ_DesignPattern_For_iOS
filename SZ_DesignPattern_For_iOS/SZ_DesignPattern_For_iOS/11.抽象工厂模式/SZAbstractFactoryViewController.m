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























