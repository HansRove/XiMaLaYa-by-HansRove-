//
//  SpecialMoreViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/21.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "SpecialMoreViewController.h"
#import "SpecialMoreViewMoel.h"
#import "SpecialCell.h"
#import "TitleView.h"
//#import "DestinationViewController.h"

@interface SpecialMoreViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) SpecialMoreViewMoel  *specialVM;

@end

@implementation SpecialMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - UITableView协议代理
// 分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return self.specialVM.section;
}
// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger row = [self.specialVM rowNumberForSection:section];
    return row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 精品听单
    SpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SCell"];
    [cell.coverBtn setImageForState:UIControlStateNormal withURL:[self.specialVM coverURLForSection:indexPath.section row:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
    cell.titleLb.text = [self.specialVM titleForSection:indexPath.section row:indexPath.row];
    cell.subTitleLb.text = [self.specialVM trackTitleForSection:indexPath.section row:indexPath.row];
    cell.footNoteLb.text = [self.specialVM footNoteForSection:indexPath.section row:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

// 分组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[TitleView alloc] initWithTitle:[self.specialVM mainTitleForSection:section] hasMore:NO];
}



#pragma mark - VM,tableView懒加载
- (SpecialMoreViewMoel *)specialVM {
    if (!_specialVM) {
        _specialVM = [SpecialMoreViewMoel new];
    }
    return _specialVM;
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
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[SpecialCell class] forCellReuseIdentifier:@"SCell"];
                               
        // 上拉刷新
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.specialVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView.mj_header endRefreshing];
                [_tableView reloadData];
            }];
        }];
        
        // 下拉加载数据
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.specialVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView.mj_footer endRefreshing];
                [_tableView reloadData];
            }];
        }];
        
        _tableView.rowHeight = 70;
    }
    return _tableView;
}

@end
