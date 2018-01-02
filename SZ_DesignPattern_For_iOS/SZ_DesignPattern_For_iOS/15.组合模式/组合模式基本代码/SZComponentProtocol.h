//
//  SZComponentProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/26.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZComponentProtocol <NSObject>

@property (nonatomic, copy) NSString *name;

- (void)add:(id<SZComponentProtocol>)component;

- (void)remove:(id<SZComponentProtocol>)component;

- (NSString *)display:(NSInteger)depth;

@end
