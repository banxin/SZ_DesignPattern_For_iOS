//
//  SZBuilderViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZBuilderViewController.h"
#import "SZBuildPersonDirector.h"
#import "SZBuildFatPerson.h"
#import "SZBulidThinPerson.h"

/*
 由吃饭时饭菜质量是由厨师做饭的细节决定引入话题。
 需求，画一个小人，要有头、身体、双手、双脚。
 版本1
 直接画头、身体、双手、双脚的路径。
 问题：直接画，代码未封装，如果需要修改条件会比较困难，容易出错，没有形成规范的流程。
 版本2
 胖人的类和瘦人的类，各自有相对应的绘制方法。
 问题：还是由于没有规范的流程，在修改条件的时候容易出错。
 版本3
 建一个人的抽象类，有绘制头、身体等的抽象方法，然后胖人、瘦人子类实现具体方法。
 
 建造者模式
 • 建造者模式是将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。
 • 如果你需要将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示的意图时，就需要使用建造者模式。
 • 建造者模式将一个产品内部表象与产品的生成过程分割开来，用户就只需要指定需要建造的类型就可以得到他们，而具体的建造过程和细节就不需要知道了。
 • 建造者模式通常用于创建一些复杂的对象，这些对象内部构建间的建造顺序通常是稳定的，但对象内部的构建通常面临着复杂的变化。
 • 建造者模式的好处是使得建造代码与表示代码分离，由于建造者隐藏了该产品是如何组装的，所以需要改变一个产品的内部表示只需要再定义一个具体的建造者就可以了。
 • 建造者模式是在当创建复杂对象的书案发应该独立于该对象的组成部分以及他们的装配方法时适用的模式。
 */

@interface SZBuilderViewController ()

@end

@implementation SZBuilderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"建造者模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testBuilder:[self getRandomNumber:0 to:2]];
}

- (void)testBuilder:(NSInteger)buildType
{
    SZBuildPersonDirector *director = [SZBuildPersonDirector new];
    
    if (buildType == 0) {
        
        director.buildDirector = [SZBulidThinPerson new];
        
    } else if (buildType == 1) {
        
        director.buildDirector = [SZBuildFatPerson new];
    }
    
    self.lblResult.text = [director buildPerson];
}

@end
