//
//  SZDecorator.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/18.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZComponent.h"

@interface SZDecorator : NSObject<SZComponent>

@property (nonatomic, strong) id<SZComponent> component;

@end
