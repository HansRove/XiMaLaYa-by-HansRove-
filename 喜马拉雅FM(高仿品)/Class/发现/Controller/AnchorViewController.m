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
    [self.tableView.mj_header beginRefreshing];
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
//    [cell.anchorView0.anchorIV setImageWithURL:[self.anchorVM coverURLForSection:indexPath.section Index:0] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[AnchorCell class] forCellReuseIdentifier:@"ACell"];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.anchorVM getDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
        }];
        _tableView.rowHeight = 180;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
