//
//  SZConcreteMediator.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/3.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZMediatorProtocol.h"
#import "SZConcreteColleague1.h"
#import "SZConcreteColleague2.h"

@interface SZConcreteMediator : NSObject<SZMediatorProtocol>

@property (nonatomic, strong) SZConcreteColleague1 *colleague1;

@property (nonatomic, strong) SZConcreteColleague2 *colleague2;

@end
