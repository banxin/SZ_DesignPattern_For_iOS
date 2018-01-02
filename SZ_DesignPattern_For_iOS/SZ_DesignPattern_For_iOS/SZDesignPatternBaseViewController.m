//
//  SZDesignPatternBaseViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZDesignPatternBaseViewController.h"

@interface SZDesignPatternBaseViewController ()

@end

@implementation SZDesignPatternBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - public method

- (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

#pragma mark - laze load

- (UILabel *)lblTips
{
    if (!_lblTips) {
        
        _lblTips = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 100)];
        
        _lblTips.numberOfLines = 0;
        _lblTips.textColor = [[UIColor blueColor] colorWithAlphaComponent:0.4];
        _lblTips.font = [UIFont systemFontOfSize:16.f];
        _lblTips.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:_lblTips];
    }
    
    return _lblTips;
}

- (UILabel *)lblResult
{
    if (!_lblResult) {
        
        _lblResult = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200)];
        
        _lblResult.numberOfLines = 0;
        _lblResult.textColor = [[UIColor redColor] colorWithAlphaComponent:0.4];
        _lblResult.font = [UIFont systemFontOfSize:16.f];
        
        [self.view addSubview:_lblResult];
    }
    
    return _lblResult;
}

@end
