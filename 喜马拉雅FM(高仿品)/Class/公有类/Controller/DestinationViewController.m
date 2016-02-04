//
//  DestinationViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/24.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "DestinationViewController.h"
// 头部展示页
#import "AlbumHeaderView.h"
// 自定义Cell
#import "MusicDetailCell.h"
#import "TracksViewModel.h"

#import <UIKit+AFNetworking.h>


@interface DestinationViewController ()<UITableViewDataSource,UITableViewDelegate,AlbumHeaderViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) AlbumHeaderView  *infoView;
@property (nonatomic,strong) TracksViewModel *tracksVM;

// 升序降序标签: 默认升序
@property (nonatomic,assign) BOOL isAsc;
@end

@implementation DestinationViewController

- (instancetype)initWithAlbumId:(NSInteger)albumId title:(NSString *)oTitle {
    if (self = [super init]) {
        _albumId = albumId;
        _oTitle = oTitle;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _infoView = [[AlbumHeaderView alloc] initWithFrame:CGRectMake(0, -170, kWindowW, 170)];
    _infoView.delegete = self;
    [self.tableView addSubview:_infoView];
    [self.tracksVM getDataCompletionHandle:^(NSError *error) {
        [self.tableView reloadData];
        // 刷新成功时候才作的方法
        // 顶头标题
        _infoView.title.text = self.tracksVM.albumTitle;
        // cover和大背景一样   但_infoView需要经过模糊处理  不懂如何用
//        [_infoView setImageWithURL:self.tracksVM.albumCoverURL];
        [_infoView.picView.coverView setImageWithURL:self.tracksVM.albumCoverURL];
        // cover上的播放次数
        if (![self.tracksVM.albumPlays isEqualToString:@"0"]) {
            [_infoView.picView.playCountBtn setTitle:self.tracksVM.albumPlays forState:UIControlStateNormal];
        } else {
            _infoView.picView.playCountBtn.hidden = YES;
        }
        // 昵称及头像
        _infoView.nameView.name.text = self.tracksVM.albumNickName;
        [_infoView.nameView.icon setImageWithURL:self.tracksVM.albumIconURL];
        // 介绍信息, 如果返回字符串长度为0 则显示"暂无简介"
        _infoView.descView.descLb.text = self.tracksVM.albumDesc.length == 0 ? @"暂无简介": self.tracksVM.albumDesc  ;
        [_infoView setupTagsBtnWithTagNames:self.tracksVM.tagsName];
    }];
}

// 视图即将消失
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}


// 连带滚动方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (y<-170) {
        CGRect frame = _infoView.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        _infoView.frame = frame;
    }
}

#pragma mark - AlbumHeaderView代理方法
// 左边按钮点击后做的方法
- (void)topLeftButtonDidClick {
    [self.navigationController popViewControllerAnimated:NO];
}
// 右边按钮点击后做的方法
- (void)topRightButtonDidClick {
    NSLog(@"右边按钮点击");
}

#pragma mark - UITableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracksVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MusicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicDetailCell"];
    [cell.coverIV setImageWithURL:[self.tracksVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"album_cover_bg"]];
    cell.titleLb.text = [self.tracksVM titleForRow:indexPath.row];
    cell.sourceLb.text = [self.tracksVM nickNameForRow:indexPath.row];
    cell.updateTimeLb.text = [self.tracksVM updateTimeForRow:indexPath.row];
    cell.playCountLb.text = [self.tracksVM playsCountForRow:indexPath.row];
    cell.durationLb.text = [self.tracksVM playTimeForRow:indexPath.row];
    cell.favorCountLb.text = [self.tracksVM favorCountForRow:indexPath.row];
    cell.commentCountLb.text = [self.tracksVM commentCountForRow:indexPath.row];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

// 点击行数  实现听歌功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 通知按钮旋转,播放及按钮改变
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[@"coverURL"] = [self.tracksVM coverURLForRow:indexPath.row];
    userInfo[@"musicURL"] = [self.tracksVM playURLForRow:indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeginPlay" object:nil userInfo:[userInfo copy]];
}

#pragma mark - tableView懒加载
- (TracksViewModel *)tracksVM {
    if (!_tracksVM) {
        _tracksVM = [[TracksViewModel alloc] initWithAlbumId:_albumId title:_oTitle isAsc:!_isAsc];
    }
    return _tracksVM;
}

- (UITableView *)tableView {
    if (!_tableView) {
        // iOS7的状态栏（status bar）不再占用单独的20px, 所以要设置往下20px
        CGRect frame = self.view.bounds;
        frame.origin.y += 20;
        // 设置普通模式
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        // 200是插入头部视图的位置
        _tableView.contentInset = UIEdgeInsetsMake(170, 0, 0, 0);
        
        [self.view addSubview:_tableView];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"MusicDetailCell"];
        
        _tableView.rowHeight = 80;
        
    }
    return _tableView;
}

@end
