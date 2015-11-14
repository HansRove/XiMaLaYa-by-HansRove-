//
//  HomePageViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/13.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageViewModel.h"
#import "FindPutCell.h"
#import "TitleView.h"  // 分组头视图
#import "HomePageModel.h"
#import "DiscoveryCell.h"
#import "SpecialCell.h"

@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) HomePageViewModel *homeVM;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - UITableViewDelegate

// 去分割线
kRemoveCellSeparator

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.homeVM.section;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {  // 精品听单list个数
        return self.homeVM.specialCount;
    } else if (section == 2) {  // 发现新奇list个数 
        return self.homeVM.discoverCount;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        // 精品听单
        SpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SCell"];
        [cell.coverIV setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
        cell.titleLb.text = [self.homeVM titleForSection:indexPath.section index:indexPath.row];
        cell.subTitleLb.text = [self.homeVM trackTitleForSection:indexPath.section index:indexPath.row];
        cell.footNoteLb.text = [self.homeVM footNoteForRow:indexPath.row];
        return cell;
    } else if (indexPath.section == 2) {
        // 发现新奇
        DiscoveryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DCell"];
        [cell.coverIV setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_6"]];
        cell.titleLb.text = [self.homeVM titleForSection:indexPath.section index:indexPath.row];
        cell.subTitleLb.text = [self.homeVM trackTitleForSection:indexPath.section index:indexPath.row];
        return cell;
    } else if (indexPath.section >= self.homeVM.section - 2) {
        // 系统Cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (indexPath.section == self.homeVM.section-2) {  // 更多分类
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//            [cell.imageView setImageWithURL:[self.homeVM entrancesURL] placeholderImage:[UIImage imageNamed:@"btn_01"] ];
            cell.imageView.image = [UIImage imageNamed:@"about_bad_feel"];
            cell.textLabel.text = @"更多分类";
        } else { // 热门直播
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
//            cell.imageView.
//            cell.imageView.backgroundColor = [UIColor yellowColor];
#warning 此处图片加载有问题, 点击才出图(热门直播)
            [cell.imageView setImageWithURL:[self.homeVM entrancesURL] ];
            cell.textLabel.text = [self.homeVM entrancesTitle];
        }
        return cell;
    } else {
        // FindPutCell (三个按钮)
        FindPutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCell"];
   
            cell.clickBtn0.titleLb.text = [self.homeVM titleForSection:indexPath.section index:0];
            [cell.clickBtn0 setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        cell.detailLb0.text = [self.homeVM trackTitleForSection:indexPath.section index:0];
        
        cell.clickBtn1.titleLb.text = [self.homeVM titleForSection:indexPath.section index:1];
        [cell.clickBtn1 setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        cell.detailLb1.text = [self.homeVM trackTitleForSection:indexPath.section index:1];
        
        cell.clickBtn2.titleLb.text = [self.homeVM titleForSection:indexPath.section index:2];
        [cell.clickBtn2 setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        cell.detailLb2.text = [self.homeVM trackTitleForSection:indexPath.section index:2];
        return cell;
    }
}
// 配置分组头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section < self.homeVM.section-2) {
        return [[TitleView alloc] initWithTitle:[self.homeVM mainTitleForSection:section] hasMore:[self.homeVM hasMoreForSection:section]];
    } else { // 最后两组无
        return nil;
    }
}

// 设置行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return (indexPath.section == 1 || indexPath.section == 2) ? 70: 170;
    if (indexPath.section == 1 || indexPath.section == 2) {
        return 70;
    } else if (indexPath.section >= self.homeVM.section-2) {
        return 44;
    } else {
        return 170;
    }
        
}

// 设置头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (section < self.homeVM.section-2 ) ? 35: 5;
}

// tableView跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 懒加载
- (HomePageViewModel *)homeVM {
    if (!_homeVM) {
        _homeVM = [HomePageViewModel new];
    }
    return _homeVM;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[FindPutCell class] forCellReuseIdentifier:@"FCell"];
        [_tableView registerClass:[DiscoveryCell class] forCellReuseIdentifier:@"DCell"];
        [_tableView registerClass:[SpecialCell class] forCellReuseIdentifier:@"SCell"];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.homeVM getDataCompletionHandle:^(NSError *error) {
                NSLog(@"%@",error.userInfo);
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
        }];
        
        // 去掉分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
