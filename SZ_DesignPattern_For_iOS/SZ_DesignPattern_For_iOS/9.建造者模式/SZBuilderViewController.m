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
