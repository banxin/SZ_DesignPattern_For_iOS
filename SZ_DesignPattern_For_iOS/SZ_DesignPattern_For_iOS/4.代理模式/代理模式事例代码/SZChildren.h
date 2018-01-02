//
//  SZChildren.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SZChildren;

@protocol SZChildrenDelegate <NSObject>

- (void)wash;
- (void)play;

@end

@interface SZChildren : NSObject

- (void)setupDelegate:(id)delegate;

- (void)startWash;

- (void)startPlay;

@end
