//
//  SZTestPaper.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/21.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZTestPaper.h"

@implementation SZTestPaper

- (NSString *)testQuestion1
{
//    NSLog(@"问题：杨过得到，后来给了郭靖，炼成倚天剑、屠龙刀的玄铁可能是[ ]：a.球磨铸铁 b.马口铁 c.高速合金钢 d.碳素纤维");
    
//    NSLog(@"问题：杨过得到，后来给了郭靖，炼成倚天剑、屠龙刀的玄铁可能是[ ]：a.球磨铸铁 b.马口铁 c.高速合金钢 d.碳素纤维 --> 答案：%@", [self answer1]);
    
    return [NSString stringWithFormat:@"问题：杨过得到，后来给了郭靖，炼成倚天剑、屠龙刀的玄铁可能是[ ]：a.球磨铸铁 b.马口铁 c.高速合金钢 d.碳素纤维 --> 答案：%@", [self answer1]];
}

- (NSString *)testQuestion2
{
//    NSLog(@"问题：杨过、程英、陆无双铲除了情花，造成[ ]：a.使这种植物不再害人 b.使一种珍稀物种灭绝 c.破坏了那个生物圈的生态平衡 d.造成该地区沙漠化");
    
//    NSLog(@"问题：杨过、程英、陆无双铲除了情花，造成[ ]：a.使这种植物不再害人 b.使一种珍稀物种灭绝 c.破坏了那个生物圈的生态平衡 d.造成该地区沙漠化 --> 答案：%@", [self answer2]);
    
    return [NSString stringWithFormat:@"问题：杨过、程英、陆无双铲除了情花，造成[ ]：a.使这种植物不再害人 b.使一种珍稀物种灭绝 c.破坏了那个生物圈的生态平衡 d.造成该地区沙漠化 --> 答案：%@", [self answer2]];
}

- (NSString *)answer1
{
    return nil;
}

- (NSString *)answer2
{
    return nil;
}

@end
