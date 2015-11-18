//
//  DiscoveryCell.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/14.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "DiscoveryCell.h"

#define kDpicWidth 70
@implementation DiscoveryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 剪头Cell类型
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.subTitleLb.font = [UIFont systemFontOfSize:13];
        
        // 分割线左间距调整
        self.separatorInset = UIEdgeInsetsMake(0, 70, 0, 0);
    }
    return self;
}

#pragma mark - Cell属性懒加载
- (UIImageView *)coverIV {
    if (!_coverIV) {
        _coverIV = [UIImageView new];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.mas_equalTo(0);
//            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.width.mas_equalTo(kDpicWidth);  // 在宏文件中定义
        }];
    }
    return _coverIV;
}
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-20);
        }];
        
    }
    return _titleLb;
}
- (UILabel *)subTitleLb {
    if (!_subTitleLb) {
        _subTitleLb = [UILabel new];
        [self.contentView addSubview:_subTitleLb];
        [_subTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.leadingMargin.mas_equalTo(self.titleLb);
            make.right.bottom.mas_equalTo(-10);
        }];
//        _subTitleLV.numberOfLines = 0;
        _subTitleLb.textColor = [UIColor lightGrayColor];
    }
    return _subTitleLb;
}
@end
