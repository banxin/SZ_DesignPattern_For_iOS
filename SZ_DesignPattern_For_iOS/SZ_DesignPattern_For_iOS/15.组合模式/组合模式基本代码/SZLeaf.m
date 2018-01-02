//
//  SZLeaf.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/26.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZLeaf.h"

@implementation SZLeaf

@synthesize name = _name;

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        
        self.name = name;
    }
    
    return self;
}

- (void)add:(id<SZComponentProtocol>)component
{
    NSLog(@"can't add to leaf!");
}

- (void)remove:(id<SZComponentProtocol>)component
{
    NSLog(@"can't remove from a leaf!");
}

- (NSString *)display:(NSInteger)depth
{
    if (depth == 0 || depth == 1) {
        
        return [NSString stringWithFormat:@"-%@", self.name];
        
    } else {
        
        NSMutableArray *ary = [NSMutableArray arrayWithCapacity:depth];
        
        for (int i = 0; i < depth; i++) {
            
            [ary addObject:@"-"];
        }
        
        return [NSString stringWithFormat:@"%@%@", [ary componentsJoinedByString:@""], self.name];
    }
}

@end
