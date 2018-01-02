//
//  SZMakeCoffee.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/19.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZMakeCoffee.h"

@implementation SZMakeCoffee

- (void)getCoffeeDescription
{
    if (self.process) {
        
        [self.process getCoffeeDescription];
    }
}

@end
