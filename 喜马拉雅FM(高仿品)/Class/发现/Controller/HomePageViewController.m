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

@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) HomePageViewModel *homeVM;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 1 || indexPath.section  == 2) {  // 精品听单list个数
//        
//    } else if () {  // 发现新奇list个数
//        
//    } else {
//        return 1;
//    }
//}

// 配置分组头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section <= self.homeVM.section-2) {
        return [[TitleView alloc] initWithTitle:[self.homeVM titleForSection:section] hasMore:[self.homeVM hasMoreForSection:section]];
    } else { // 最后两组无
        return nil;
    }
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
        [_tableView registerClass:[FindPutCell class] forCellReuseIdentifier:@"FindCell"];
        
    }
    return _tableView;
}
@end
