//
//  SZMakeCoffee.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/19.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZCoffee.h"

@interface SZMakeCoffee : NSObject<SZCoffee>

@property (nonatomic, strong) id<SZCoffee> process;

@end
