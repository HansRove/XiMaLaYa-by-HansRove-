//
//  AnchorCell.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "AnchorCell.h"


#define kAnchorWidth (kWindowW-60)/3
@interface AnchorCell ()
// 关注按钮
@property (nonatomic,strong) UIButton *attractBtn;
@end

@implementation AnchorCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        
    }
    return self;
}


#pragma mark - 控件属性懒加载
/*
- (UIImageView *)anthorIV0 {
    if (!_anthorIV0) {
        _anthorIV0 = [UIImageView new];
        [self.contentView addSubview:_anthorIV0];
        [_anthorIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(kRect, kRect));
        }];
    }
    return _anthorIV0;
}
- (UIImageView *)anthorIV1 {
    if (!_anthorIV1) {
        _anthorIV1 = [UIImageView new];
        [self.contentView addSubview:_anthorIV1];
        [_anthorIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(self.anthorIV0.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(self.anthorIV0);
            
        }];
    }
    return _anthorIV1;
}
- (UIImageView *)anthorIV2 {
    if (!_anthorIV2) {
        _anthorIV2 = [UIImageView new];
        [self.contentView addSubview:_anthorIV2];
        [_anthorIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(self.anthorIV1);
            make.left.mas_equalTo(self.anthorIV1.mas_right).mas_equalTo(10);
        }];
    }
    return _anthorIV2;
}

- (UILabel *)nameLb0 {
    if (!_nameLb0) {
        _nameLb0 = [UILabel new];
        [self.contentView addSubview:_nameLb0];
        [_nameLb0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leadingMargin.mas_equalTo(self.anthorIV0);
            make.trailingMargin.mas_equalTo(self.anthorIV0);
            make.top.mas_equalTo(self.anthorIV0.mas_bottom).mas_equalTo(10);
            
            
        }];
    }
    return _nameLb0;
}
- (UILabel *)nameLb1 {
    if (!_nameLb1) {
        _nameLb1 = [UILabel new];
        [self.contentView addSubview:_nameLb1];
        [_nameLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leadingMargin.mas_equalTo(self.anthorIV1);
            make.trailingMargin.mas_equalTo(self.anthorIV1);
            make.top.mas_equalTo(self.anthorIV1.mas_bottom).mas_equalTo(10);
        }];
    }
    return _nameLb1;
}
- (UILabel *)nameLb2 {
    if (!_nameLb2) {
        _nameLb2 = [UILabel new];
        [self.contentView addSubview:_nameLb2];
        [_nameLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leadingMargin.mas_equalTo(self.anthorIV2);
            make.trailingMargin.mas_equalTo(self.anthorIV2);
            make.top.mas_equalTo(self.anthorIV2.mas_bottom).mas_equalTo(10);
        }];
    }
    return _nameLb2;
}

// 关注按钮
- (UIButton *)attractBtn {
    if (!_attractBtn) {
        _attractBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_attractBtn addSubview:_attractBtn];
        [_attractBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _attractBtn;
}
 */

- (AnchorView *)anchorView0 {
    if (!_anchorView0) {
        _anchorView0 = [AnchorView new];
        [self.contentView addSubview:_anchorView0];
        [_anchorView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(kAnchorWidth);
//            make.size.mas_equalTo(CGSizeMake(kAnchorWidth, 160));
//            make.height.mas_equalTo(160);
        }];
    }
    return _anchorView0;
}

- (AnchorView *)anchorView1 {
    if (!_anchorView1) {
        _anchorView1 = [AnchorView new];
        [self.contentView addSubview:_anchorView1];
        [_anchorView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(self.anchorView0.mas_right).mas_equalTo(15);
            make.width.mas_equalTo(self.anchorView0);
        }];
    }
    return _anchorView1;
}
- (AnchorView *)anchorView2 {
    if (!_anchorView2) {
        _anchorView2 = [AnchorView new];
        [self.contentView addSubview:_anchorView2];
        [_anchorView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-15);
//            make.left.mas_equalTo(self.anchorView1.mas_right);
            make.width.mas_equalTo(self.anchorView1);
        }];
    }
    return _anchorView2;
}

@end
