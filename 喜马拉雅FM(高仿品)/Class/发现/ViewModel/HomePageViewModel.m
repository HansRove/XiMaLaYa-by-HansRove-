//
//  HomePageViewModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HomePageViewModel.h"
#import "HomePageNetManager.h"
#import "HomePageModel.h"

@interface HomePageViewModel ()
@property (nonatomic,strong) HomePageModel *model;
@end

@implementation HomePageViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [HomePageNetManager getHomePageIntroduceCompletionHandle:^(HomePageModel* responseObject, NSError *error) {
        self.model = responseObject;
        self.hotRecommendsArr = responseObject.hotRecommends.list;
        
        // 分组等于热门list内容+小编推荐+发现新奇+精品听单+猜你喜欢+热门直播(entrances)+查看更多分类
        self.section = _hotRecommendsArr.count + 6;
    }];
}

- (id)modelForSection:(NSInteger)section {
    if (section==0) { // 猜你喜欢
        // 判断 list是否有东西
        return @"";
    } else if (section == 1) {  // 小编推荐
        return self.model.editorRecommendAlbums;
    } else if (section == 2) {  //精品听单
        return self.model.specialColumn;
    } else if (section == 3) {  // 发现新奇
        return self.model.discoveryColumns;
    } else if (section == _section){  // 热门直播
        return self.model.entrances;
    } else if (section == _section-1) {  // 查看更多分类
        return nil;
    } else {  // 热门推荐
        return  self.model.hotRecommends.list[section-4];
    }
}

- (NSString *)titleForSection:(NSInteger)section {
    if (section==0) { // 猜你喜欢
        // 判断 list是否有东西
        return @"";
    } else if (section == 1) {  // 小编推荐
        return self.model.editorRecommendAlbums.title;
    } else if (section == 2) {  //精品听单
        return self.model.specialColumn.title;
    } else if (section == 3) {  // 发现新奇
        return self.model.discoveryColumns.title;
    } else if (section == _section){  // 热门直播
        return @"热门直播";
    } else if (section == _section-1) {  // 查看更多分类
        return @"查看更多分类";
    } else {  // 热门推荐
        return  self.model.hotRecommends.list[section-4].title;
    }
}

- (BOOL)hasMoreForSection:(NSInteger)section {
    if (section==0) { // 猜你喜欢
        // 判断 list是否有东西
        return @"";
    } else if (section == 1) {  // 小编推荐
        return self.model.editorRecommendAlbums.hasMore;
    } else if (section == 2) {  //精品听单
        return self.model.specialColumn.hasMore;
    } else if (section == 3) {  // 发现新奇
        return NO;
    } else if (section >= _section-2){  // 热门直播 && 查看更多分类
        return NO;
    } else {  // 热门推荐
        return  YES;
    }
}

#pragma mark - 懒加载
- (NSInteger)discoverCount {
   DiscoveryC *discover =  self.model.discoveryColumns;
    return discover.list.count;
}

- (NSInteger)specialCount {
    SpecialC *special = self.model.specialColumn;
    return special.list.count;
}

@end
