//
//  RankingViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/10.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "RankingViewController.h"
#import "RankViewModel.h"
#import "RankCell.h"
#import "TitleView.h"
#import "iCarousel.h"
#import "FocusImageScrollView.h"

/**
 *  榜单
 */
@interface RankingViewController ()<UITableViewDataSource, UITableViewDelegate,iCarouselDataSource,iCarouselDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) RankViewModel *rankVM;
@end

@implementation RankingViewController
{
    UIPageControl *_pageControl;  // 小圆点
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rankVM getDataCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.tableView reloadData];
    }];
}
#pragma mark - iCarousel代理方法
// @require
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.rankVM.focusImgNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    UIImageView *imgView = nil;
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/660*310)];
        imgView = [UIImageView new];
        [view addSubview:imgView];
        imgView.tag = 100;
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        view.clipsToBounds = YES;
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    
    imgView = (UIImageView *)[view viewWithTag:100];
    [imgView setImageWithURL:[self.rankVM focusImgURLForIndex:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
    return view;
}

// @option
/** 允许循环滚动 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/**  监控滚到第几个 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    _pageControl.currentPage = carousel.currentItemIndex;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.rankVM.sectionNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rankVM rowNumberForSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCell"];
    [cell.coverIV setImageWithURL:[self.rankVM coverURLForSection:indexPath.section row:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_album_bg"]];
    cell.titleLb.text = [self.rankVM titleForSection:indexPath.section row:indexPath.row];
    cell.oneLb.text = [self.rankVM firstTitleForSection:indexPath.section row:indexPath.row];
    cell.twoLb.text = [self.rankVM secondTitleForSection:indexPath.section row:indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[TitleView alloc] initWithTitle:[self.rankVM mainTitleForSection:section] hasMore:0];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - VM,UITableView懒加载
- (RankViewModel *)rankVM {
    if (!_rankVM) {
        _rankVM = [[RankViewModel alloc] init];
    }
    return _rankVM;
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
        [_tableView registerClass:[RankCell class] forCellReuseIdentifier:@"RCell"];
        // 一种模式, IndexPath无用
        _tableView.rowHeight = [self.rankVM cellHeightForIndexPath:nil];
        // 无分隔线风格
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 不能超界上下拉
        _tableView.bounces = NO;
        
        // 封装好的头部滚动视图
        FocusImageScrollView *scrollView = [[FocusImageScrollView alloc] initWithFocusImgNumber:self.rankVM.focusImgNumber];
        scrollView.ic.delegate = self;
        scrollView.ic.dataSource = self;
        _pageControl = scrollView.pageControl;
        _tableView.tableHeaderView = scrollView;
    }
    return _tableView;
}

@end
