//
//  RankCell.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "RankCell.h"

@implementation RankCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 提示更多格式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.twoLb.font = self.oneLb.font;
        
        // 分割线左间距调整
        self.separatorInset = UIEdgeInsetsMake(0, 70, 0, 0);
    }
    return self;
}

#pragma mark - 各控件懒加载
- (UIImageView *)coverIV {
    if (!_coverIV) {
        _coverIV = [UIImageView new];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
    return _coverIV;
}
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.coverIV.mas_topMargin);
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
        }];
        _titleLb.font = [UIFont systemFontOfSize:14];
    }
    return _titleLb;
}
- (UILabel *)oneLb {
    if (!_oneLb) {
        _oneLb = [UILabel new];
        [self.contentView addSubview:_oneLb];
        [_oneLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.coverIV);
            make.leadingMargin.mas_equalTo(self.titleLb);
            make.right.mas_equalTo(-10);
        }];
        _oneLb.font = [UIFont systemFontOfSize:12];
        [_oneLb setTextColor:[UIColor lightGrayColor]];
    }
    return _oneLb;
}
- (UILabel *)twoLb {
    if (!_twoLb) {
        _twoLb = [UILabel new];
        [self.contentView addSubview:_twoLb];
        [_twoLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.oneLb.mas_bottom).mas_equalTo(5);
            make.leadingMargin.mas_equalTo(self.oneLb);
            make.right.mas_equalTo(-10);
        }];
        _twoLb.textColor = [UIColor lightGrayColor];
    }
    return _twoLb;
}

@end
