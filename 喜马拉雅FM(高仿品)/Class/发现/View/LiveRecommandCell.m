//
//  LiveRecommandCell.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "LiveRecommandCell.h"


@interface LiveRecommandCell ()
// 三个按钮的深层背景图
@property (nonatomic,strong) UIImageView *bgImgView0;
@property (nonatomic,strong) UIImageView *bgImgView1;
@property (nonatomic,strong) UIImageView *bgImgView2;
@end

@implementation LiveRecommandCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 无风格
        self.accessoryType = UITableViewCellAccessoryNone;
        self.nameLb2.font= [UIFont systemFontOfSize:13];
        self.nameLb1.font= [UIFont systemFontOfSize:13];
        self.nameLb0.font= [UIFont systemFontOfSize:13];
    }
    return self;
}


#pragma mark - 各控件懒加载

- (UIImageView *)bgImgView0 {
    if (!_bgImgView0) {
        _bgImgView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liveRadioPlay_album_mask"]];
        [self.contentView addSubview:_bgImgView0];
        [_bgImgView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(0);
            make.height.width.mas_equalTo(kRect);
        }];
    }
    return _bgImgView0;
}
- (UIImageView *)bgImgView1 {
    if (!_bgImgView1) {
        _bgImgView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liveRadioPlay_album_mask"]];
        [self.contentView addSubview:_bgImgView1];
        [_bgImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(self.bgImgView0.mas_right).mas_equalTo(10);
            make.height.width.mas_equalTo(kRect);
        }];
    }
    return _bgImgView1;
}
- (UIImageView *)bgImgView2 {
    if (!_bgImgView2) {
        _bgImgView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liveRadioPlay_album_mask"]];
        [self.contentView addSubview:_bgImgView2];
        [_bgImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(self.bgImgView1.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.width.mas_equalTo(kRect);
        }];
    }
    return _bgImgView2;
}

- (UIButton *)radioBtn0 {
    if (!_radioBtn0) {
        _radioBtn0 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgImgView0 addSubview:_radioBtn0];
        [_radioBtn0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(3);
            make.right.mas_equalTo(-3);
            make.bottom.mas_equalTo(-13);
        }];
    }
    return _radioBtn0;
}
- (UIButton *)radioBtn1 {
    if (!_radioBtn1) {
        _radioBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgImgView1 addSubview:_radioBtn1];
        [_radioBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(3);
            make.right.mas_equalTo(-3);
            make.bottom.mas_equalTo(-13);
        }];
    }
    return _radioBtn1;
}
- (UIButton *)radioBtn2 {
    if (!_radioBtn2) {
        _radioBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgImgView2 addSubview:_radioBtn2];
        [_radioBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(3);
            make.right.mas_equalTo(-3);
            make.bottom.mas_equalTo(-13);
        }];
    }
    return _radioBtn2;
}

- (UILabel *)nameLb0 {
    if (!_nameLb0) {
        _nameLb0 = [UILabel new];
        [self.contentView addSubview:_nameLb0];
        [_nameLb0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leadingMargin.trailingMargin.mas_equalTo(self.bgImgView0);
            make.top.mas_equalTo(self.bgImgView0.mas_bottom).mas_equalTo(10);
        }];
        _nameLb0.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLb0;
}
- (UILabel *)nameLb1 {
    if (!_nameLb1) {
        _nameLb1 = [UILabel new];
        [self.contentView addSubview:_nameLb1];
        [_nameLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leadingMargin.trailingMargin.mas_equalTo(self.bgImgView1);
            make.top.mas_equalTo(self.bgImgView1.mas_bottom).mas_equalTo(10);
        }];
        _nameLb1.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLb1;
}
- (UILabel *)nameLb2 {
    if (!_nameLb2) {
        _nameLb2 = [UILabel new];
        [self.contentView addSubview:_nameLb2];
        [_nameLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leadingMargin.trailingMargin.mas_equalTo(self.bgImgView2);
            make.top.mas_equalTo(self.bgImgView2.mas_bottom).mas_equalTo(10);
        }];
        _nameLb2.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLb2;
}

@end
