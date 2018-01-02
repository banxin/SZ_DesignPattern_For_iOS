//
//  SZOperationFactory.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZOperation.h"

@interface SZOperationFactory : NSObject

+ (id<SZOperation>)createOperation:(NSString *)operationType;

@end
