//
//  SZBuildArm.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SZBuildArmType)
{
    SZBuildArmTypeLeft = 0,
    SZBuildArmTypeRight
};

@interface SZBuildArm : NSObject

- (NSString *)buildArm:(SZBuildArmType)armType;

@end
