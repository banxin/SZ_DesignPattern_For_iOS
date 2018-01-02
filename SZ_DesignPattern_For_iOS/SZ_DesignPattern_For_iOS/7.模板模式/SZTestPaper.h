//
//  SZTestPaper.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/21.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZAnswerProtocol.h"

@interface SZTestPaper : NSObject<SZAnswerProtocol>

- (NSString *)testQuestion1;

- (NSString *)testQuestion2;

@end
