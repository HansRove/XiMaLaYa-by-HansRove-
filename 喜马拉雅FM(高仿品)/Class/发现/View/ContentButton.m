//
//  ContentButton.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/13.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "ContentButton.h"

@implementation ContentButton

// 重写  取消点击高亮
- (void)setHighlighted:(BOOL)highlighted {
}

- (instancetype)init {
    if (self == [super init]) {
      // 有顺序  不可颠倒顺序 否则label会被遮盖
        self.coverView.alpha = 0.6;
        self.titleLb.font = [UIFont systemFontOfSize:12];
//        self.imageView.contentMode = UIViewContentModeLeft;
    }
    return self;
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    return [[self alloc] init];
}

// 按钮图片占满屏幕宽度
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return self.bounds;
}


#pragma mark - 懒加载

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

@end
