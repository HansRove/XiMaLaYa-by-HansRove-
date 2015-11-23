//
//  LiveTopCell.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "LiveTopCell.h"

#define kLpicWidth 70
@implementation LiveTopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 无风格
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

#pragma mark - Cell属性懒加载

- (UIButton *)coverBtn {
    if (!_coverBtn) {
        
        // 框框背景图
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"findradio_bg"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(kLpicWidth);
        }];
        
        _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [imageView addSubview:_coverBtn];
        [_coverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(2);
            make.bottom.right.mas_equalTo(-2);
        }];
    }
    return _coverBtn;
}
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(6);
            make.left.mas_equalTo(self.coverBtn.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        _titleLb.font = [UIFont systemFontOfSize:15];
        
    }
    return _titleLb;
}
- (UILabel *)subTitleLb {
    if (!_subTitleLb) {
        _subTitleLb = [UILabel new];
        [self.contentView addSubview:_subTitleLb];
        [_subTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            // 照片中间
            make.centerY.mas_equalTo(self.coverBtn);
            make.leadingMargin.mas_equalTo(self.titleLb);
            make.right.bottom.mas_equalTo(-10);
        }];
        _subTitleLb.textColor = [UIColor lightGrayColor];
        _subTitleLb.font = [UIFont systemFontOfSize:13];
        
        // 增加各播放小视图
        UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [playBtn setBackgroundImage:[UIImage imageNamed:@"find_hotuser_play"] forState:UIControlStateNormal];
        [self.contentView addSubview:playBtn];
        [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _subTitleLb;
}

- (UILabel *)footNoteLb {
    if (!_footNoteLb) {
        _footNoteLb = [UILabel new];
        [self.contentView addSubview:_footNoteLb];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"find_albumcell_play"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.leadingMargin.mas_equalTo(self.titleLb);
            make.bottom.mas_equalTo(-10);
        }];
        
        [self.contentView addSubview:_footNoteLb];
        [_footNoteLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(2);
        }];
        _footNoteLb.textColor = [UIColor lightGrayColor];
        _footNoteLb.font = [UIFont systemFontOfSize:12];
    }
    return _footNoteLb;
}

@end
