//
//  SZDecorator.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/18.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZDecorator.h"

@implementation SZDecorator

- (void)operation
{
    if (self.component) {
        
        [self.component operation];
    }
}

@end
