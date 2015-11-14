//
//  HRPlayView.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRPlayView.h"

@implementation HRPlayView

- (instancetype)initWithBackgroundImageName:(NSString *)imageName {
    if (self = [super init]) {
        _imageName = imageName;
        
        // 布局
        UIImageView *backgoundIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_normal"]];
        [self addSubview:backgoundIV];
        [backgoundIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        UIImageView *circleIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_loop"]];
        [backgoundIV addSubview:circleIV];
        [circleIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(2);
            make.left.mas_equalTo(2);
            make.right.mas_equalTo(-2);
            make.bottom.mas_equalTo(-10);
        }];
        // 设置circle的用户交互
        backgoundIV.userInteractionEnabled = YES;
        circleIV.userInteractionEnabled = YES;
        UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [playBtn setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
        [playBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [circleIV addSubview:playBtn];
        [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return self;
}
// 预防性编程
- (instancetype)init {
    if (self = [super init]) {
        NSAssert1(NO, @"%s  请使用initWithBackgroundImageName:方法初始化", __FUNCTION__);
    }
    return self;
}



@end
