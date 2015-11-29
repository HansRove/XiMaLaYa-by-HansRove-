//
//  MoreCategoryViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/19.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "MoreCategoryViewController.h"
#import "MoreCategoryViewModel.h"
#import "MoreCategoryCell.h"
#import "DestinationViewController.h"

@interface MoreCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MoreCategoryViewModel *categoryVM;
@end

@implementation MoreCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 启动开启上拉刷新
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - UITableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoreCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MCCell"];
    [cell.coverBtn setImageForState:UIControlStateNormal withURL:[self.categoryVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
    cell.titleLb.text = [self.categoryVM titleForRow:indexPath.row];
    cell.introLb.text = [self.categoryVM introForRow:indexPath.row];
    cell.playsLb.text = [self.categoryVM playsForRow:indexPath.row];
    cell.tracksLb.text = [self.categoryVM tracksForRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 从本控制器VM获取头标题, 以及分类ID回初始化
    DestinationViewController *vc = [[DestinationViewController alloc] initWithAlbumId:[self.categoryVM albumIdForRow:indexPath.row] title:[self.categoryVM titleForRow:indexPath.row]];
    // 隐藏状态栏及底部栏
    vc.hidesBottomBarWhenPushed = YES;
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - VM,tableView懒加载
- (MoreCategoryViewModel *)categoryVM {
    if (!_categoryVM) {
        // 通过categoryID name创建网络解析
        _categoryVM = [[MoreCategoryViewModel alloc] initWithCategoryId:[_keyArr[0] integerValue] tagName:_keyArr[1]];
    }
    return _categoryVM;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MoreCategoryCell class] forCellReuseIdentifier:@"MCCell"];
        // 上拉刷新
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.categoryVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView.mj_header endRefreshing];
                [_tableView reloadData];
            }];
        }];
        
        // 下拉加载数据
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.categoryVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView.mj_footer endRefreshing];
                [_tableView reloadData];
            }];
        }];
        
        _tableView.rowHeight = 70;
    }
    return _tableView;
}
@end
