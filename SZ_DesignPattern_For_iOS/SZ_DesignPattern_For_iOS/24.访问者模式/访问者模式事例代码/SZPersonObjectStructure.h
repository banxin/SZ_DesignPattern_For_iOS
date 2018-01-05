//
//  SZPersonObjectStructure.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZHumanActionProtocol, SZPersonProtocol;

@interface SZPersonObjectStructure : NSObject

- (void)attach:(id<SZPersonProtocol>)element;

- (void)detach:(id<SZPersonProtocol>)element;

- (NSString *)accept:(id<SZHumanActionProtocol>)vistor;

@end
