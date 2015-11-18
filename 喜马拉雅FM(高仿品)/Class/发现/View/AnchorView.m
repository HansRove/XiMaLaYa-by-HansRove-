//
//  AnchorView.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "AnchorView.h"


@interface AnchorView ()
@property (nonatomic,strong) UIButton *attractBtn;
@end

@implementation AnchorView

- (instancetype)init {
    if (self = [super init]) {
        
        self.userInteractionEnabled = YES;
        // 关注按钮点击事件
        [self.attractBtn bk_addEventHandler:^(UIButton* sender) {
            sender.selected = !sender.selected;
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - 控件属性懒加载

- (UIButton *)anchorBtn {
    if (!_anchorBtn) {
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"findradio_bg"]];
        [self addSubview:imgView];
        imgView.userInteractionEnabled = YES;
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(100);
        }];
        _anchorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [imgView addSubview:_anchorBtn];
        [_anchorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(2);
            make.right.bottom.mas_equalTo(-2);

        }];
        _anchorBtn.contentMode = UIViewContentModeScaleAspectFit;
//        _anchorBtn.contentMode = UIViewContentModeScaleAspectFill;

        [_anchorBtn bk_addEventHandler:^(id sender) {
            NSLog(@"惦记了");
        } forControlEvents:UIControlEventTouchUpInside];

    }
    return _anchorBtn;
}
- (UILabel *)nameLb {
    if (!_nameLb) {
        _nameLb = [UILabel new];
        [self addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.anchorBtn.mas_bottom).mas_equalTo(10);
            make.centerX.leadingMargin.trailingMargin.mas_equalTo(self.anchorBtn);
        }];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        _nameLb.font = [UIFont systemFontOfSize:14];
    }
    return _nameLb;
}

- (UIButton *)attractBtn {
    if (!_attractBtn) {
        _attractBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_attractBtn];
        [_attractBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(10);
            make.centerX.mas_equalTo(self.anchorBtn);
            make.size.mas_equalTo(CGSizeMake(60, 25));
        }];
        // 117*47像素图
        [_attractBtn setImage:[UIImage imageNamed:@"find_radio_focuse"] forState:UIControlStateNormal];
        // 点击后图
        [_attractBtn setImage:[UIImage imageNamed:@"find_radio_focuse_sel"] forState:UIControlStateSelected];
    }
    return _attractBtn;
}


@end
