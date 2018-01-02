//
//  SZDesignPatternBaseViewController.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZDesignPatternBaseViewController : UIViewController

@property (nonatomic, strong) UILabel *lblTips;

@property (nonatomic, strong) UILabel *lblResult;

// 获取一个随机整数，范围在[from,to]，包括from，包括to
- (int)getRandomNumber:(int)from to:(int)to;

@end
