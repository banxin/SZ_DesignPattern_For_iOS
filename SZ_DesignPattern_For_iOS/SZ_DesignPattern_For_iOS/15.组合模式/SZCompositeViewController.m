//
//  SZCompositeViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/26.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZCompositeViewController.h"
#import "SZComponentProtocol.h"
#import "SZLeaf.h"
#import "SZComposite.h"
#import "SZCompanyProtocol.h"
#import "SZConcreteCompany.h"
#import "SZHRDepartment.h"
#import "SZFinanceDepartment.h"

@interface SZCompositeViewController ()

@end

@implementation SZCompositeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"组合模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！基本代码和事例代码随机测试！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getRandomNumber:0 to:1] == 0 ? [self testCompositeBasic] : [self testReflex];
}

- (void)testCompositeBasic
{
    // 树根
    SZComposite *root = [[SZComposite alloc] initWithName:@"Root"];
    
    // 顶部树叶A
    [root add:[[SZLeaf alloc] initWithName:@"Leaf A"]];
    // 顶部树叶B
    [root add:[[SZLeaf alloc] initWithName:@"Leaf B"]];
    
    // 树枝1
    SZComposite *comp = [[SZComposite alloc] initWithName:@"Composite X"];
    
    // 树枝1 树叶 XA
    [comp add:[[SZLeaf alloc] initWithName:@"Leaf XA"]];
    
    // 树枝1 树叶 XB
    [comp add:[[SZLeaf alloc] initWithName:@"Leaf XB"]];
    
    [root add:comp];
    
    // 树枝2
    SZComposite *comp2 = [[SZComposite alloc] initWithName:@"Composite XY"];
    
    // 树枝2 树叶 XYA
    [comp2 add:[[SZLeaf alloc] initWithName:@"Leaf XYA"]];
    // 树枝2 树叶 XYB
    [comp2 add:[[SZLeaf alloc] initWithName:@"Leaf XYB"]];
    
    [root add:comp2];
    
    // 顶部树叶C
    [root add:[[SZLeaf alloc] initWithName:@"Leaf C"]];
    
    // 顶部树叶D
    SZLeaf *leaf = [[SZLeaf alloc] initWithName:@"Leaf D"];
    
    [root add:leaf];
    
    // 顶部树叶D 被风吹走了
    [root remove:leaf];
    
    // 显示结构
    self.lblResult.text = [NSString stringWithFormat:@"结构：\n%@", [root display:1]];
}

- (void)testReflex
{
    SZConcreteCompany *root = [[SZConcreteCompany alloc] initWithName:@"北京总公司"];
    
    [root add:[[SZHRDepartment alloc] initWithName:@"总公司人力资源部"]];
    [root add:[[SZFinanceDepartment alloc] initWithName:@"总公司财务部"]];
    
    SZConcreteCompany *comp = [[SZConcreteCompany alloc] initWithName:@"上海华东分公司"];
    
    [comp add:[[SZHRDepartment alloc] initWithName:@"华东分公司人力资源部"]];
    [comp add:[[SZFinanceDepartment alloc] initWithName:@"华东分公司财务部"]];
    
    [root add:comp];
    
    SZConcreteCompany *comp1 = [[SZConcreteCompany alloc] initWithName:@"南京办事处"];
    
    [comp1 add:[[SZHRDepartment alloc] initWithName:@"南京办事处人力资源部"]];
    [comp1 add:[[SZFinanceDepartment alloc] initWithName:@"南京办事处财务部"]];
    
    [root add:comp1];
    
    SZConcreteCompany *comp2 = [[SZConcreteCompany alloc] initWithName:@"杭州办事处"];
    
    [comp2 add:[[SZHRDepartment alloc] initWithName:@"杭州办事处人力资源部"]];
    [comp2 add:[[SZFinanceDepartment alloc] initWithName:@"杭州办事处财务部"]];
    
    [root add:comp2];
    
    // 显示结构和职责
    self.lblResult.text = [NSString stringWithFormat:@"结构：\n%@\n\n职责：\n%@", [root display:1], [root lineOfDuty]];
}

@end
