//
//  MoreButton.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "MoreButton.h"

@interface MoreButton ()
@property (nonatomic,strong) UILabel *textLb;
@property (nonatomic,strong) UIImageView *iconIV;
@end

@implementation MoreButton
/*
- (instancetype)init {
    if (self = [super init]) {
        self.textLb.text = @"更多";
        self.iconIV.hidden = NO;
    }
    return self;
}
- (UILabel *)textLb {
    if (!_textLb) {
        _textLb = [UILabel new];
        [self addSubview:_textLb];
        [_textLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(self.iconIV.mas_left).mas_equalTo(0);
        }];
    }
    return _textLb;
}

- (UIImageView *)iconIV {
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"toolbar_like_n"]];
        [self addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _iconIV;
}
 */
- (void)awakeFromNib
{
    self.imageView.contentMode = UIViewContentModeCenter;
}

static CGFloat textH = 0;
// 不能使用self.titleLabel 因为self.titleLabel内部会调用titleRectForContentRect
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleY = 0;
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:13]
                           };
    CGFloat titleW = 0;
    if ([UIDevice currentDevice].systemVersion.floatValue > 7.0) { // 判断运行时,及当前模拟器运行在哪个系统上
        
#ifdef __IPHONE_7_0 // 判断编译时 sdk7.0才允许编译
        titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.width;
        textH = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.height;
#else // sdk 6.0 编译下面
        titleW = [self.currentTitle sizeWithFont:[UIFont systemFontOfSize:13]].width;
        
#endif
    }else{
        titleW = [self.currentTitle sizeWithFont:[UIFont systemFontOfSize:13]].width;
    }
    
    
    CGFloat titleH = contentRect.size.height;
    CGFloat titleX = contentRect.size.width - textH - titleW;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = textH;
    CGFloat imageH = textH;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = contentRect.size.height/2 - textH/2;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}
@end
