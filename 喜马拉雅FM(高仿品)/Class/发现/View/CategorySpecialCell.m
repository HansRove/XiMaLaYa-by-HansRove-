//
//  CategorySpecialCell.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/15.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "CategorySpecialCell.h"

#define kBigWidth ((kWindowW-25)/2)
#define kSmallWidth (kBigWidth-5)/2
@implementation CategorySpecialCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.backgroundColor = kRGBColor(235, 235, 241);
    }
    return self;
}

#pragma mark - 懒加载
- (UIImageView *)icon0 {
    if (!_icon0) {
        _icon0 = [UIImageView new];
        [self.contentView addSubview:_icon0];
        [_icon0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(kBigWidth);
        }];
    }
    return _icon0;
}
- (UIImageView *)icon1 {
    if (!_icon1) {
        _icon1 = [UIImageView new];
        [self.contentView addSubview:_icon1];
        [_icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.icon0);
            make.left.mas_equalTo(self.icon0.mas_right).mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(kSmallWidth, kSmallWidth));
        }];
    }
    return _icon1;
}
- (UIImageView *)icon2 {
    if (!_icon2) {
        _icon2 = [UIImageView new];
        [self.contentView addSubview:_icon2];
        [_icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.icon1);
            make.size.mas_equalTo(self.icon1);
            make.left.mas_equalTo(self.icon1.mas_right).mas_equalTo(5);
        }];
    }
    return _icon2;
}
- (UIImageView *)icon3 {
    if (!_icon3) {
        _icon3 = [UIImageView new];
        [self.contentView addSubview:_icon3];
        [_icon3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.icon0);
            make.left.mas_equalTo(self.icon0.mas_right).mas_equalTo(5);
            make.size.mas_equalTo(self.icon2);
        }];
    }
    return _icon3;
}
- (UIImageView *)icon4 {
    if (!_icon4) {
        _icon4 = [UIImageView new];
        [self.contentView addSubview:_icon4];
        [_icon4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.icon3);
            make.size.mas_equalTo(self.icon3);
            make.left.mas_equalTo(self.icon3.mas_right).mas_equalTo(5);
        }];
    }
    return _icon4;
}

- (CGFloat)cellHeight {
    return kBigWidth+20;
}


@end
