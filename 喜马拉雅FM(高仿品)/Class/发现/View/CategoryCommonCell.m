//
//  CategoryCommonCell.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/16.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "CategoryCommonCell.h"

@implementation CategoryCommonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
//        self.categoryLb1.hidden = NO;
        self.btn1.hidden = NO;
        self.btn2.hidden = NO;
    }
    return self;
}

#pragma mark - 各View懒加载
/*
- (UIImageView *)icon1 {
    if (!_icon1) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.contentView addSubview:btn];
//        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(0);
//            make.bottom.top.mas_equalTo(0);
//            make.width.mas_equalTo(kWindowW/2);
//        }];
//        [btn bk_addEventHandler:^(id sender) {
//            btn.backgroundColor = [UIColor grayColor];
//            NSLog(@"sss");
//        } forControlEvents:UIControlEventTouchDown];
        _icon1 = [UIImageView new];
//        [btn addSubview:_icon1];
        [_icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _icon1;
}
- (UILabel *)categoryLb1 {
    if (!_categoryLb1) {
        _categoryLb1 = [UILabel new];
        [self.contentView addSubview:_categoryLb1];
        [_categoryLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.icon1.mas_right).mas_equalTo(20);
            make.centerY.mas_equalTo(0);
            make.width.mas_lessThanOrEqualTo(80);
        }];
    }
    return _categoryLb1;
    
}
- (UIImageView *)icon2 {
    if (!_icon2) {
        _icon2 = [UIImageView new];
        [self.contentView addSubview:_icon2];
        
        // 做分割线
        UIView *partitionView = [UIView new];
        [self.contentView addSubview:partitionView];
        [partitionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(2);
        }];
        partitionView.backgroundColor = [UIColor lightGrayColor];
        
        [_icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(partitionView.mas_right).mas_equalTo(20);
            make.size.mas_equalTo(self.icon1);
            make.centerY.mas_equalTo(0);
        }];
        
    }
    return _icon2;
}
- (UILabel *)categoryLb2 {
    if (!_categoryLb2) {
        _categoryLb2 = [UILabel new];
        [self.contentView addSubview:_categoryLb2];
        [_categoryLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.icon2.mas_right).mas_equalTo(20);
            make.centerY.mas_equalTo(0);
            make.width.mas_lessThanOrEqualTo(80);
        }];
        
        
    }
    return _categoryLb2;
}
*/

- (CategoryButton *)btn1 {
    if (!_btn1) {
        _btn1 = [CategoryButton new];
        [self.contentView addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(kWindowW/2-1);
        }];
//        _btn1.backgroundColor = [UIColor redColor];
        [_btn1 bk_addEventHandler:^(id sender) {
            [_btn1 setImage:[UIImage imageNamed:@"cell_common"] forState:UIControlStateHighlighted];
            NSLog(@"ddddd");
        } forControlEvents:UIControlEventTouchDown];
    }
    return _btn1;
}

- (CategoryButton *)btn2 {
    if (!_btn2) {
        _btn2 = [CategoryButton new];
        [self.contentView addSubview:_btn2];
        // 做分割线
        UIView *partitionView = [UIView new];
        [self.contentView addSubview:partitionView];
        [partitionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(1);
        }];
        partitionView.backgroundColor = [UIColor lightGrayColor];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.mas_equalTo(0);
            make.left.mas_equalTo(partitionView.mas_right);
        }];
//        _btn2.backgroundColor = [UIColor yellowColor];
        [_btn2 bk_addEventHandler:^(id sender) {
            [_btn2 setImage:[UIImage imageNamed:@"cell_common"] forState:UIControlStateHighlighted];
            NSLog(@"ddddd");
        } forControlEvents:UIControlEventTouchDown];
    }
    return _btn2;
}

@end
