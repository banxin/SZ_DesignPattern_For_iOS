//
//  SZConcreteColleague2.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/3.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZColleagueProtocol.h"

@interface SZConcreteColleague2 : NSObject<SZColleagueProtocol>

- (NSString *)send:(NSString *)message;

@end
