//
//  ContentImageView.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/13.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "ContentImageView.h"

@implementation ContentImageView

- (instancetype)init {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        self.coverView.alpha = 0.6;
        self.titleLb.font = [UIFont systemFontOfSize:12];
        self.button.hidden = NO;
    }
    return self;
}


#pragma mark - 懒加载

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return _button;
}

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [UIView new];
        [self addSubview:_coverView];
        // 此时已经绑定
        [_coverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        _coverView.backgroundColor = [UIColor blackColor];
        
        
    }
    return _coverView;
}
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self addSubview:_titleLb];
        // 此时已经绑定
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(3);
            make.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        _titleLb.textColor = [UIColor whiteColor];
        
    }
    return _titleLb;
}

- (void)buttonClick{
    if ([self.delegate respondsToSelector:@selector(contentImageViewClick:)]) {
        [self.delegate contentImageViewClick:self.tag];
    }
    NSLog(@"按钮被点击 %ld",self.tag);
}
@end
