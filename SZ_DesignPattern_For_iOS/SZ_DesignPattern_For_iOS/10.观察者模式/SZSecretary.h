//
//  SZSecretary.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SZSubject.h"
#import "SZObserve.h"

@interface SZSecretary : NSObject<SZSubject>

@property (nonatomic, weak) id<SZObserve> observe;

@end
