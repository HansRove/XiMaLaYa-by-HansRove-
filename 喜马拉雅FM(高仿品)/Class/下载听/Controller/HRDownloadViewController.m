//
//  HRDownloadViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRDownloadViewController.h"
#import "AlbumViewController.h"  // 专辑
#import "SoundViewController.h"  // 声音
#import "DownloadingViewController.h"  // 下载中

@interface HRDownloadViewController ()

@end

@implementation HRDownloadViewController

// 创建一个单例
+ (instancetype)downloadViewController {
    static HRDownloadViewController *downloadVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloadVC = [[HRDownloadViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"专辑",@"声音",@"下载中"]];
//        WMPageController的设置
        downloadVC.menuViewStyle = WMMenuViewStyleLine;
        // 设置背景色
        downloadVC.menuBGColor = [UIColor whiteColor];
        // 选中时颜色
        downloadVC.titleColorSelected = [UIColor redColor];
        // 设置每个item的宽
        downloadVC.itemsWidths = @[@(kWindowW/3),@(kWindowW/3),@(kWindowW/3)];
        downloadVC.progressHeight = 3.5;
        downloadVC.menuHeight = 45;
        downloadVC.viewFrame = CGRectMake(0, 20, kWindowW, kWindowH-20);
    });
    return downloadVC;
}

// 存响应的控制器
+ (NSArray *)ViewControllerClasses {
    return @[[AlbumViewController  class],[SoundViewController class], [DownloadingViewController class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBarHidden = YES;
}



@end
