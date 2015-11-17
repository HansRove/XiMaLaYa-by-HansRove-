//
//  HRMeViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRMeViewController.h"

#import "ViewController.h"
#import "HomePageViewController.h"
#import "AnchorViewController.h"

@interface HRMeViewController ()

@end

@implementation HRMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor redColor];
    NSURL *url = [NSURL URLWithString:@"http://fdfs.xmcdn.com/group5/M03/A2/B6/wKgDtVRzL6fhKYXSAADtvRuLo-U167_web_x_large.jpg"];
    [btn setImageForState:UIControlStateNormal withURL:url];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(65);
    }];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.title = @"hahah";
}

- (void)click {
//        HomePageViewController *vc = [ HomePageViewController new];
//    AnchorViewController *vc =[AnchorViewController new];
    ViewController *vc = [ViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    vc.hidesBottomBarWhenPushed = NO;
}

@end
