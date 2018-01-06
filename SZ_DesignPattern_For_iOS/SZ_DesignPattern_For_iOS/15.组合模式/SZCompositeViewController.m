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

/*
 由文字处理一个字可以进行编辑一段话也可以进行编辑引入问题。
 需求，写一个公司管理系统，总公司下属包括子公司和部门，子公司也包含相关部门。
 版本1
 公司Root类有增加、删除、显示、履行职责的虚方法和名称的属性，具体公司类实现相关方法和名称属性并添加一个保存其下级的数组，而部门类作为树叶节点不实现增加、删除方法。
 组合模式这样就定义了包含人力资源部和财务部这些基本对象和分公司、办事处这些组合对象的类层次结构。基本对象可以被组合成更复杂的组合对象，而这个组合对象又可以被组合，这样不断的递归下去，这个代码中基本用到基本对象的地方都可以使用组合对象了。
 用户是不用关心到底是处理一个叶节点还是处理一个组合部件，也就用不着为定义组合而写一些判断性语句了。
 
 组合模式
 • 组合模式是将对象组合成树形结构以表示部分-整体的层次结构，组合模式使得用户对单个对象和组合对象的使用具有一致性。
 • 当发现需求中是体现部分与整体层次的结构时，以及你希望用户可以忽略组合对象与单个对象的不同，统一地使用组合结构中的所有对象时，就应该考虑使用组合模式了。
 • 简单的来说，组合模式可以让客户可以一致的使用组合结构和单个对象。
 */

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
