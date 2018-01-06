//
//  SZTemplateMethodViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/21.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZTemplateMethodViewController.h"
#import "SZAnswerProtocol.h"
#import "SZTestPaper.h"
#import "SZTestPaperA.h"
#import "SZTestPaperB.h"

/*
 通过试卷引入话题。
 需求，设计一个抄试卷题目的类，题目是相同的，只有具体答案不同。
 版本1
 题目A，题目B，结构都是打印题目，打印答案。
 问题：题目是相同的，只有答案不同，所以抄题目部分的代码重复了。
 版本2
 试卷父类，实现打印题目，子类试卷A、B，实现打印答案。
 问题：答案其实除了a/b/c/d部分，都是一样的。
 版本3
 将试卷子类的答案代码抽离上升到父类中而不是让每个子类去重复。所以讲父类中加入一个虚方法，答案去实现这个虚方法即可。
 
 模板方法模式
 • 既然用到了继承，并且肯定这个继承是有意义的，就应该要成为子类的模板，所有重复的代码都应该上升到父类去，而不是让每个子类去重复。
 • 当我们要完成在某一细节层次一致的一个过程或一系列步骤，但其个别步骤在更详细的层次上的实现可能不同时，我们通常考虑使用模板方法模式处理。
 • 模板方法模式，定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构几个重定义该算法的某些特定的步骤。
 • 父类AbstractClass中有顶级逻辑的组成步骤，给出需要补全的抽象方法，有多个子类ConcreateClass可以与父类对应，实现父类所定义的一个或多个抽象方法，补全顶级逻辑的组成步骤，从而使得逻辑在ConcreateClass的实现各不相同。
 • 模板方法模式就是通过把不变行为搬移到父类，去除子类中的重复代码，提供了一个很好的代码复用平台。
 • 当不变和可变的行为在方法的子类实现中混合在一起的时候，不变的行为就会在子类中重复出现，我们可以通过模板方法模式将这些行为搬移到单一的地方，就能帮助子类摆脱重复的不变行为的纠缠。
 */

@interface SZTemplateMethodViewController ()

@end

@implementation SZTemplateMethodViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"模板方法模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testTemplate:[self getRandomNumber:0 to:2]];
}

- (void)testTemplate:(NSInteger)type
{
    SZTestPaper *paper;
    
    switch (type) {
            
        case 0:
            
            paper = [SZTestPaperA new];
            
            break;
            
        case 1:
            
            paper = [SZTestPaperB new];
            
            break;
            
        default:
            
            self.lblResult.text = @"不存在该学生的试卷哦！！！";
            
            return;
            
            break;
    }
    
    self.lblResult.text = [NSString stringWithFormat:@"%@, %@ \n %@", [paper description], [paper testQuestion1], [paper testQuestion2]];
}

@end
