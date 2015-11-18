//
//  LiveViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/10.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveViewModel.h"
#import "LiveRadioCell.h"
#import "LiveRecommandCell.h"
#import "LiveTopCell.h"
#import "TitleView.h"


@interface LiveViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) LiveViewModel *liveVM;
@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showMessage:@"正在努力为您加载..."];
    [self.liveVM getDataCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.liveVM.sectionNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.liveVM rowNumberForSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        LiveRadioCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCell"];
        return cell;
    } else if (indexPath.section == 1) {
        LiveRecommandCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LRCell"];
        [cell.radioBtn0 setImageForState:UIControlStateNormal withURL: [self.liveVM coverURLForSection:indexPath.section index:0]placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
        [cell.radioBtn1 setImageForState:UIControlStateNormal withURL: [self.liveVM coverURLForSection:indexPath.section index:1]placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
        [cell.radioBtn2 setImageForState:UIControlStateNormal withURL: [self.liveVM coverURLForSection:indexPath.section index:2]placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
        cell.nameLb0.text = [self.liveVM nameForSection:indexPath.section index:0];
        cell.nameLb1.text = [self.liveVM nameForSection:indexPath.section index:1];
        cell.nameLb2.text = [self.liveVM nameForSection:indexPath.section index:2];
        return cell;
    } else {
        LiveTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LTCell"];
        [cell.coverBtn setImageForState:UIControlStateNormal withURL:[self.liveVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
        cell.titleLb.text = [self.liveVM titleForRow:indexPath.row];
        cell.subTitleLb.text = [self.liveVM subTitleForRow:indexPath.row];
        cell.footNoteLb.text = [self.liveVM soundCountForRow:indexPath.row];
        return cell;
    }
}
// 设置各cell高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.liveVM cellHeightForIndexPath:indexPath];
}
// 设置头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  !section ? 0:35;
}
// 设置尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

// 点击cell动作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 设置Cell头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return !section ? nil : [[TitleView alloc] initWithTitle:[self.liveVM mainTitleForSection:section] hasMore:[self.liveVM hasMoreForSection:section]];
}


#pragma mark - VM,UITableView懒加载
- (LiveViewModel *)liveVM {
    if (!_liveVM) {
        _liveVM = [[LiveViewModel alloc] init];
    }
    return _liveVM;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            // 防止头部空出一块(因为无头视图)
            make.top.mas_equalTo(-35);
            make.bottom.left.right.mas_equalTo(0);
        }];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[LiveRecommandCell class] forCellReuseIdentifier:@"LRCell"];
        [_tableView registerClass:[LiveTopCell class] forCellReuseIdentifier:@"LTCell"];
        [_tableView registerClass:[LiveRadioCell class] forCellReuseIdentifier:@"RCell"];
        // 无线条
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // 禁止上下拉
        _tableView.bounces = NO;
    }
    return _tableView;
}


@end
