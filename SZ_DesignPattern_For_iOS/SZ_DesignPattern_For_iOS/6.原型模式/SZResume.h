//
//  SZResume.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SZResume : NSObject<NSCopying>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSNumber *age;

@end
