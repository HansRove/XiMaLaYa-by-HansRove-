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
#import "iCarousel.h"  // 制作头部循环滚动视图
#import "FocusImageScrollView.h"  // 封装好的头部视图

// 更多按钮 跳转视图
#import "JumpViewController.h"
#import "EditorMoreViewController.h"
#import "SpecialMoreViewController.h"

// 测试
#import "DestinationViewController.h"

@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate,iCarouselDataSource,iCarouselDelegate,ContentShowViewDelegate, TitleViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) HomePageViewModel *homeVM;

// 跳转页VM
@property (nonatomic,assign) NSInteger categoryId;
@property (nonatomic,strong) NSString *type;
@end

@implementation HomePageViewController
{ // 定义完全私有的属性 : 添加成员变量,因为不需要懒加载,所以不需要是属性
    UIPageControl *_pageControl;
    // 定义热门类或三个图片按钮的FindPutCell高
    CGFloat _hotCellHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showMessage:@"正在努力为您加载..."];
    [self.homeVM getDataCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.tableView reloadData];
    }];
}


#pragma mark - iCarousel代理方法
// @require
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.homeVM.focusImgNumber;
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
    [imgView setImageWithURL:[self.homeVM focusImgURLForIndex:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
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
        [cell.coverBtn setImageForState:UIControlStateNormal withURL:[self.homeVM coverURLForSection:indexPath.section index:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
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
            cell.imageView.image = [UIImage imageNamed:@"find_gotocate"];
            cell.textLabel.text = @"更多分类";
        } else { // 热门直播
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
// 此处图片加载有问题, 点击才出图(热门直播)setImageWithURL:[self.homeVM entrancesURL] 
            cell.imageView.image = [UIImage imageNamed:@"live"];
            cell.textLabel.text = [self.homeVM entrancesTitle];
        }
        return cell;
    } else {
        // FindPutCell (三个按钮)
        FindPutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCell"];
        _hotCellHeight = cell.cellHeight;
   
            cell.clickBtn0.titleLb.text = [self.homeVM titleForSection:indexPath.section index:0];
            [cell.clickBtn0.contentImgView setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        // 定Tag值,跳转需要
        cell.clickBtn0.tag = indexPath.section*10 + 0;
        cell.clickBtn0.delegate = self;
        cell.detailLb0.text = [self.homeVM trackTitleForSection:indexPath.section index:0];
        
        cell.clickBtn1.titleLb.text = [self.homeVM titleForSection:indexPath.section index:1];
        [cell.clickBtn1.contentImgView setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        // 定Tag值,跳转需要
        cell.clickBtn1.tag = indexPath.section*10 + 1;
        cell.clickBtn1.delegate = self;
        cell.detailLb1.text = [self.homeVM trackTitleForSection:indexPath.section index:1];
        
        cell.clickBtn2.titleLb.text = [self.homeVM titleForSection:indexPath.section index:2];
        [cell.clickBtn2.contentImgView setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        // 定Tag值,跳转需要
        cell.clickBtn2.tag = indexPath.section*10 + 2;
        cell.clickBtn2.delegate = self;
        cell.detailLb2.text = [self.homeVM trackTitleForSection:indexPath.section index:2];
        return cell;
    }
}
// 配置分组头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section < self.homeVM.section-2) {
        TitleView *moreView = [[TitleView alloc] initWithTitle:[self.homeVM mainTitleForSection:section] hasMore:[self.homeVM hasMoreForSection:section]];
        // 定义TitleView的tag  可以通过tag知section
        moreView.tag = section;
        moreView.delegate = self;
        return moreView;
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
        return _hotCellHeight;
    }
        
}

// 设置头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (section < self.homeVM.section-2 ) ? 35: 5;
}

// tableView跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 15) {
        // 更多分类, 则跳转过去
    }
    
}
// 是否允许点击高亮
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    // 只允许后两排被点击高亮
    return indexPath.section >= 15 ;
}

#pragma mark - ContentShowViewDelegate代理实现跳转
- (void)contentShowViewClick:(NSInteger)tag {
    // 第几分区
    NSInteger section = tag/10;
    // 第几个按钮
    NSInteger row = tag%10;
    // 从本控制器VM获取头标题, 以及分类ID回初始化
    DestinationViewController *vc = [[DestinationViewController alloc] initWithAlbumId:[self.homeVM albumIdForSection:section index:row] title:[self.homeVM mainTitleForSection:section]];
    // 隐藏状态栏及底部栏
    vc.hidesBottomBarWhenPushed = YES;
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:vc animated:YES];
//    vc.hidesBottomBarWhenPushed = NO;
}

#pragma mark - 点击更多按钮代理实现跳转
- (void)titleViewDidClick:(NSInteger)tag {
    // 网络加载数据 VM获取
    // 创建控制器(tag>3)
    
    _categoryId = [self.homeVM categoryIdForSection:tag];
    _type = [self.homeVM contentTypeForSection:tag];
    
    switch (tag) {
        case 0:
        {
            EditorMoreViewController *vc = [EditorMoreViewController new];
            // push 跳转控制器 隐藏tabbar
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
        case 1:
        {
            SpecialMoreViewController *vc = [SpecialMoreViewController new];
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
        default:
        {
            // 如果>=2  跳转到中介页
            JumpViewController *vc = [[JumpViewController alloc] initWithCategoryId:_categoryId contentType:_type tag:tag];
            // push 跳转控制器 隐藏tabbar
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
    }
    
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
        
        // 去掉分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 越界不能上下拉
        _tableView.bounces = NO;
        
        // 封装好的头部滚动视图
        FocusImageScrollView *scrollView = [[FocusImageScrollView alloc] initWithFocusImgNumber:self.homeVM.focusImgNumber];
        scrollView.ic.delegate = self;
        scrollView.ic.dataSource = self;
        _pageControl = scrollView.pageControl;
        _tableView.tableHeaderView = scrollView;
    }
    return _tableView;
}
@end
