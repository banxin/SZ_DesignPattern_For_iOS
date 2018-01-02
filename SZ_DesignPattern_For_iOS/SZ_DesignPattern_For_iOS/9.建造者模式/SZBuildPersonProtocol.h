//
//  SZBuildPersonProtocol.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZBuildPersonProtocol <NSObject>

- (NSString *)buildHead;

- (NSString *)buildBody;

- (NSString *)buildLeftArm;

- (NSString *)buildRightArm;

- (NSString *)buildLeftLeg;

- (NSString *)buildRightLeg;

- (NSString *)buildPerson;

@end
