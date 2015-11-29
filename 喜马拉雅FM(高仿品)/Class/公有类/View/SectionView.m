//
//  SectionView.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/24.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "SectionView.h"

@implementation SectionView

// 使用外界传入集数值 初始化这个分组头
- (instancetype)initWithTotalTracks:(NSString *)tracks {
    if (self = [super init]) {
        _tracks = tracks;
    }
    return self;
}

#pragma mark - 懒加载各种控件

@end
