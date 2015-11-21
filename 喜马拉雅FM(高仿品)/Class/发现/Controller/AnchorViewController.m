//
//  AnchorViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/10.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "AnchorViewController.h"
#import "AnchorViewModel.h"
#import "AnchorCell.h"
#import "TitleView.h"  // 分组头视图

@interface AnchorViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) AnchorViewModel *anchorVM;
@end

@implementation AnchorViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showMessage:@"正在努力为您加载..."];
    [self.anchorVM getDataCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.tableView reloadData];
    }];
    
}

#pragma mark - UITableView代理协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.anchorVM.section;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnchorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ACell"];
    [cell.anchorView0.anchorBtn setImageForState:UIControlStateNormal withURL:[self.anchorVM coverURLForSection:indexPath.section Index:0] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
    cell.anchorView0.nameLb.text = [self.anchorVM nameForSection:indexPath.section Index:0];
    [cell.anchorView1.anchorBtn setImageForState:UIControlStateNormal withURL:[self.anchorVM coverURLForSection:indexPath.section Index:1] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
    cell.anchorView1.nameLb.text = [self.anchorVM nameForSection:indexPath.section Index:1];
    [cell.anchorView2.anchorBtn setImageForState:UIControlStateNormal withURL:[self.anchorVM coverURLForSection:indexPath.section Index:2] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
    cell.anchorView2.nameLb.text = [self.anchorVM nameForSection:indexPath.section Index:2];
    
    return cell;
}

// 分组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[TitleView alloc] initWithTitle:[self.anchorVM mainTitleForSection:section] hasMore:1];
}
// 头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}
// 尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

kRemoveCellSeparator

#pragma mark - VM,TableView懒加载
- (AnchorViewModel *)anchorVM {
    if (!_anchorVM) {
        _anchorVM = [AnchorViewModel new];
    }
    return _anchorVM;
}
- (UITableView *)tableView {
    if (!_tableView) {
        // 创建分组
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            // 防止头部空出一块
            make.top.mas_equalTo(-35);
            make.bottom.left.right.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[AnchorCell class] forCellReuseIdentifier:@"ACell"];
        // 因为cell只有一个无特殊, indexPath不需要
        _tableView.rowHeight = [self.anchorVM cellHeightForIndexPath:nil];
        // 去分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 不能超
        _tableView.bounces = NO;
    }
    return _tableView;
}
@end
