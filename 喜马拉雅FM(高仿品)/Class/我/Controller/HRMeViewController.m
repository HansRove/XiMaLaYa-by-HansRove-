//
//  HRMeViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRMeViewController.h"

@interface HRMeViewController ()

@end

@implementation HRMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 不允许越界
    self.tableView.bounces = NO;
    // 没有竖直的滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.navigationItem.backBarButtonItem.title = @"返回";
//    self.navigationController.navigationBarHidden = YES;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *view = [[UIView alloc]init];
        UIButton *recordedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view addSubview:recordedBtn];
        [recordedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.width.mas_equalTo(250);
            make.height.mas_equalTo(40);
        }];
        [recordedBtn setImage:[UIImage imageNamed:@"btn_record_n"] forState:UIControlStateNormal];
        [recordedBtn setImage:[UIImage imageNamed:@"btn_record_h"] forState:UIControlStateHighlighted];
        return view;
    } else {
        return nil;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? 10:60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
