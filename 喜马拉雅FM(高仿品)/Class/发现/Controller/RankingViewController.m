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
/**
 *  榜单
 */
@interface RankingViewController ()<UITableViewDataSource, UITableViewDelegate,iCarouselDataSource,iCarouselDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) RankViewModel *rankVM;
@end

@implementation RankingViewController
{
    NSTimer *_timer;  // 定时器
    iCarousel *_ic;      // 滚动栏
    UIPageControl *_pageControl;  // 小圆点
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - 自定义头部视图
/**  头部滚动视图 */
- (UIView *)setupHeaderView {
    [_timer invalidate];
    
    // 当前没有头部滚动视图,返回空对象nil
    if (!self.rankVM.focusImgNumber) {
        return nil;
    }
    //头部视图origin无效,宽度无效,肯定是与table同宽
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/660*310)];
    // 添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    // 如果只有一张图,则不可以滚动
    _ic.scrollEnabled = self.rankVM.focusImgNumber != 1;
    //    _ic.scrollSpeed = 1;
    // 让图片一张一张滚, 默认NO  滚一次到尾
    _ic.pagingEnabled = YES;
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.rankVM.focusImgNumber;
    [_ic addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-6);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];
    // 如果只有一张图,则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    // 小圆点不与用户交互
    _pageControl.userInteractionEnabled = NO;
    // 小圆点颜色设置
    _pageControl.pageIndicatorTintColor = [UIColor lightTextColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    // 计时器产生,开启滚动
    if (self.rankVM.focusImgNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    return headView;
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
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.rankVM getDataCompletionHandle:^(NSError *error) {
                _tableView.tableHeaderView = [self setupHeaderView];
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
            _tableView.rowHeight = 80;
        }];
        // 无分隔线风格
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
