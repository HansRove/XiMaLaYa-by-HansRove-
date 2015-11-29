//
//  AlbumHeaderView.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/24.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "AlbumHeaderView.h"

@interface AlbumHeaderView ()
// 不对外暴露的控件
// 顶部左返回按钮
@property (nonatomic,strong) UIButton *topLeftBtn;
// 顶部右功能按钮
@property (nonatomic,strong) UIButton *topRightBtn;

@end

@implementation AlbumHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 用户交互
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"bg_albumView_header"];
        
        // 必须这样  不然下拉变大有可能留白
//        self.contentMode = UIViewContentModeScaleAspectFill;
        [self.topLeftBtn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [self.topRightBtn setImage:[UIImage imageNamed:@"btn_share_n"] forState:UIControlStateNormal];

        self.descView.hidden = NO;
    }
    return self;
}

#pragma mark - 各个控件的懒加载
- (UIButton *)topLeftBtn {
    if (!_topLeftBtn) {
        _topLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_topLeftBtn];
        [_topLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.top.left.mas_equalTo(0);
        }];
        // 左按钮点击事件
        [_topLeftBtn bk_addEventHandler:^(id sender) {
            if ([self.delegete respondsToSelector:@selector(topLeftButtonDidClick)]) {
                [self.delegete topLeftButtonDidClick];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _topLeftBtn;
}
- (UILabel *)title {
    if (!_title) {
        _title = [UILabel new];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            // 横向居中
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(self.topLeftBtn);
            make.width.mas_lessThanOrEqualTo(250);
        }];
        _title.textColor = [UIColor whiteColor];
        _title.font = [UIFont boldSystemFontOfSize:18];
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
}

- (UIButton *)topRightBtn {
    if (!_topRightBtn) {
        _topRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_topRightBtn];
        [_topRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.right.top.mas_equalTo(0);
        }];
        // 右按钮点击事件
        [_topRightBtn bk_addEventHandler:^(id sender) {
            if ([self.delegete respondsToSelector:@selector(topRightButtonDidClick)]) {
                // 代理需要做的方法
                [self.delegete topRightButtonDidClick];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _topRightBtn;
}

- (PicView *)picView {
    if (!_picView) {
        _picView = [PicView new];
        [self addSubview:_picView];
        [_picView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.left.mas_equalTo(20);
            // 距离上面40-45
            make.top.mas_equalTo(self.topLeftBtn.mas_bottom).mas_equalTo(15);
        }];
    }
    return _picView;
}

- (IconNameView *)nameView {
    if (!_nameView) {
        _nameView = [IconNameView new];
        [self addSubview:_nameView];
        [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.picView);
            make.left.mas_equalTo(self.picView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-20);
            make.height.mas_equalTo(30);
        }];

    }
    return _nameView;
}

- (DescView *)descView {
    if (!_descView) {
        _descView = [DescView new];
        [self addSubview:_descView];
        [_descView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.picView);
            make.leadingMargin.mas_equalTo(self.nameView);
            // 可能根据字体来设置
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(30);
        }];
        _descView.descLb.text = @"暂无简介";
    }
    return _descView;
}

/** 根据标签数组, 设置按钮标签 */
- (void)setupTagsBtnWithTagNames:(NSArray *)tagNames {
    // 记录最后一个视图控件
    UIView *lastView = nil;
    // 创建标签按钮
    // 首页只展示两个标签按钮 所以要判断个数
    // 记录个数, 最高展示就两个
    NSInteger maxTags = 2;
    if (tagNames.count < 2) {
        maxTags = tagNames.count;
    }
    for (NSInteger i = 0; i<maxTags; i++) {
        UIButton *tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:tagBtn];
        // 按钮根据按钮上文字自适应大小,NSFontAttributeName 要和按钮titleLabel的font对应
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        CGFloat length = [tagNames[i] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.width;
        [tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.picView);
            // 文字大小
            make.size.mas_equalTo(CGSizeMake(length+20, 25));
            if (lastView) {  // 存在
                make.left.mas_equalTo(lastView.mas_right).mas_equalTo(5);
            } else {  // 刚开始创建, 按钮的位置
                make.leadingMargin.mas_equalTo(self.descView);
            }
        }];
        // 赋值标签按钮指针
        lastView = tagBtn;
        
        // 设置按钮的属性
        [tagBtn setTitle:tagNames[i] forState:UIControlStateNormal];
        tagBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        // 76*50 背景图
        [tagBtn setBackgroundImage:[UIImage imageNamed:@"sound_tags"] forState:UIControlStateNormal];
//        tagBtn.backgroundColor = [UIColor colorWithPatternImage:<#(nonnull UIImage *)#>]
    }
}

@end
