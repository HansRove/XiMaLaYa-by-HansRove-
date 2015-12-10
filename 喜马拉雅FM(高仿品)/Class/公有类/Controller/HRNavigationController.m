//
//  HRNavigationController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRNavigationController.h"
#import "HRPlayView.h"
// 播放
#import <AVFoundation/AVFoundation.h>
//#import "SettingViewController.h"

@interface HRNavigationController ()<PlayViewDelegate>
@property (nonatomic,strong) HRPlayView *playView;
@property (nonatomic,strong) NSString *imageName;

@property (nonatomic,strong) AVPlayer *player;
@end

@implementation HRNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 防止其他ViewController的导航被遮挡, 这个类的主要作用是 PlayView
    self.navigationBarHidden = YES;
    
    // 开启两个通知接收(HRMeViewController传入)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidePlayView:) name:@"hidePlayView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showPlayView:) name:@"showPlayView" object:nil];
    
    // 开启一个通知接受,播放URL 及图片
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playingWithInfoDictionary:) name:@"BeginPlay" object:nil];

    self.playView = [[HRPlayView alloc] init];
    self.playView.delegate = self;
    [self.view addSubview:_playView];
    [_playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(70);
    }];
}
// 隐藏图片
- (void)hidePlayView:(NSNotification *)notification
{
    self.playView.hidden = YES;
}

// 显示图片
- (void)showPlayView:(NSNotification *)notification
{
    self.playView.hidden = NO;
}

/** 通过播放地址 和 播放图片 */
- (void)playingWithInfoDictionary:(NSNotification *)notification {
    // 设置背景图
    NSURL *coverURL = notification.userInfo[@"coverURL"];
    NSURL *musicURL = notification.userInfo[@"musicURL"];
    [self.playView.contentIV setImageWithURL:coverURL];
    
    // 支持后台播放
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    // 激活
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    // 开始播放
    _player = [AVPlayer playerWithURL:musicURL];
    [_player play];
    // 已改到背景变化时再变化
//    self.playView.playButton.selected = YES;
}


#pragma mark - PlayView的代理方法
- (void)playButtonDidClick:(BOOL)selected {
    // 按钮被点击方法, 判断按钮的selected状态
    if (selected) {
        [_player play];  // 继续播放
    } else {
        [_player pause];  // 暂停播放, 以后会取消, 此处应该是跳转最后一个播放器控制器
    }
}


- (void)dealloc {
    // 关闭消息中心
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
