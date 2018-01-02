//
//  SZBuildPersonDirector.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZBuildPersonProtocol.h"

@interface SZBuildPersonDirector : NSObject

@property (nonatomic, strong) id<SZBuildPersonProtocol> buildDirector;

- (NSString *)buildPerson;

@end
