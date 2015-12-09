//
//  SettingViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/23.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hidePlayView" object:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"设置";
}

#pragma mark - UITableView协议代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==1 && indexPath.row <= 1) {
        return NO;
    }
    return YES;
}

//  设置头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

// 设置尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (void)viewWillDisappear:(BOOL)animated {
    // 即将消失时, 不要导航
    self.navigationController.navigationBarHidden = YES;
    // 恢复playView
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showPlayView" object:nil];
}




@end
