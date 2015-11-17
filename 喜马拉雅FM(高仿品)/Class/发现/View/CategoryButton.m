//
//  CategoryButton.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/16.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "CategoryButton.h"

@implementation CategoryButton

- (instancetype)init {
    if (self = [super init]) {
        self.categoryLb.font = [UIFont systemFontOfSize:15];
        
    }
    return self;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [UIImageView new];
        [self addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerY.mas_equalTo(0);
        }];
    }
    return _icon;
}
- (UILabel *)categoryLb {
    if (!_categoryLb) {
        _categoryLb = [UILabel new];
        [self addSubview:_categoryLb];
        [_categoryLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.icon.mas_right).mas_equalTo(20);
            make.centerY.mas_equalTo(0);
            make.width.mas_lessThanOrEqualTo(80);
        }];
    }
    return _categoryLb;
}


@end
