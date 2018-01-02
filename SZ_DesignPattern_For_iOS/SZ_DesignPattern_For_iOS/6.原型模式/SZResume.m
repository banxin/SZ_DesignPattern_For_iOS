//
//  SZResume.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZResume.h"

@implementation SZResume

- (id)copyWithZone:(nullable NSZone *)zone
{
    // 在- (id)copyWithZone:(NSZone *)zone方法中，一定要通过[self class]方法返回的对象调用allocWithZone:方法。因为指针可能实际指向的是SZResume的子类。这种情况下，通过调用[self class]，就可以返回正确的类的类型对象。
    SZResume *resume = [[[self class] allocWithZone:zone] init];
    
    resume.name = self.name;
    resume.sex = self.sex;
    resume.age = self.age;
    
    return resume;
}

@end
