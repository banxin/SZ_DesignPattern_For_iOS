//
//  SZOperation.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  协议声明出来的是方法，虽然看起来是属性，其实只有 getter、setter 这两个方法，内部是没有实例变量的，并且你不能去重定义它，只能在 getter、setter 里处理
 */
@protocol SZOperation <NSObject>

@property (nonatomic, assign) CGFloat numberA;
@property (nonatomic, assign) CGFloat numberB;

- (CGFloat)getResult;

@end
