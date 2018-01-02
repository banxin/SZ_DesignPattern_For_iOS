//
//  SZBuildLeg.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SZBuildLegType)
{
    SZBuildLegTypeLeft = 0,
    SZBuildLegTypeRight
};

@interface SZBuildLeg : NSObject

- (NSString *)buildLeg:(SZBuildLegType)legType;

@end
