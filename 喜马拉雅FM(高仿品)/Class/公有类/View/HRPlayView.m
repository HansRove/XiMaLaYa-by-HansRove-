//
//  HRPlayView.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRPlayView.h"

@interface HRPlayView ()
// 设置一个私有的定时器
@property (nonatomic,strong) CADisplayLink *link;
@end


//宏定义   角度转弧度
#define angleToRadian(x) (x/180.0*M_PI)
@implementation HRPlayView

- (instancetype)init {
    if (self = [super init]) {
        // 布局
        UIImageView *backgoundIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_normal"]];
        [self addSubview:backgoundIV];
        [backgoundIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _circleIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_loop"]];
        // KVO观察image变化, 变化了就初始化定时器, 值变化则执行task
        [_circleIV bk_addObserverForKeyPath:@"image" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            // 启动定时器
            self.link.paused = NO;
            self.playButton.selected = YES;
        }];
        
        [backgoundIV addSubview:_circleIV];
        [_circleIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(2);
            make.right.mas_equalTo(-2);
            make.bottom.mas_equalTo(-8);
        }];
        // 作圆背景
        _circleIV.layer.cornerRadius = 30;
        _circleIV.clipsToBounds = YES;
        // 设置circle的用户交互
        backgoundIV.userInteractionEnabled = YES;
        _circleIV.userInteractionEnabled = YES;
        // 点击前
        [self.playButton setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
    }
    return self;
}

/**  背景图rotation滚动 */
- (void)rotation {
    self.circleIV.layer.transform = CATransform3DRotate(self.circleIV.layer.transform, angleToRadian(72/60.0), 0, 0, 1);
}

#pragma mark - PlayButton,CADisplayLink定时器懒加载
- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 被点击后 "avatar_bg" 透明
        [_playButton setImage:[UIImage imageNamed:@"toolbar_pause_h_p"] forState:UIControlStateSelected];
        [self  addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(2);
            make.right.mas_equalTo(-2);
            make.bottom.mas_equalTo(-7);
        }];
        
        // 按钮点击后做的方法
        [_playButton bk_addEventHandler:^(UIButton* sender) {
            // 点击图和不点击图交换
            if ([self.delegate respondsToSelector:@selector(playButtonDidClick:)]) {
                sender.selected = !sender.selected;
                self.link.paused = !sender.selected;
                [self.delegate playButtonDidClick:sender.selected];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _playButton;
}

- (CADisplayLink *)link {
    if (!_link) {
        // 创建定时器, 一秒钟调用rotation方法60次
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotation)];
        // 手动将定时器加入到事件循环中
        // NSRunLoopCommonModes会使得RunLoop会随着界面切换扔继续使用, 不然如果使用Default的话UI交互没问题, 但滑动TableView就会出现不转问题, 因为RunLoop模式改变会影响定时器调度
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _link;
}



@end
