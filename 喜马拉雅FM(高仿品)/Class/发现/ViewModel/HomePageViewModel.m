//
//  HomePageViewModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HomePageViewModel.h"
#import "HomePageNetManager.h"

// 除了热门推荐其他 (小编推荐+发现新奇+精品听单+热门直播(entrances)+查看更多分类)
#define kOtherCount 5
// 热门推荐前面 (小编推荐+发现新奇+精品听单)
#define kFrontCount 3
@interface HomePageViewModel ()
@property (nonatomic,strong) HomePageModel *model;
@end

@implementation HomePageViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [HomePageNetManager getHomePageIntroduceCompletionHandle:^(HomePageModel* responseObject, NSError *error) {
        self.model = responseObject;
        self.hotRecommendsArr = responseObject.hotRecommends.list;
        
        // 分组等于热门list内容+小编推荐+发现新奇+精品听单+热门直播(entrances)+查看更多分类
        self.section = _hotRecommendsArr.count + kOtherCount;
        completed(error);
    }];
}

- (id)modelForSection:(NSInteger)section {
    if (section == 0) {  // 小编推荐
        return self.model.editorRecommendAlbums;
    } else if (section == 1) {  //精品听单
        return self.model.specialColumn;
    } else if (section == 2) {  // 发现新奇
        return self.model.discoveryColumns;
    } else if (section == _section){  // 热门直播
        return self.model.entrances;
    } else if (section == _section-1) {  // 查看更多分类
        return nil;
    } else {  // 热门推荐
        return  self.model.hotRecommends.list[section-3];
    }
}

- (NSString *)mainTitleForSection:(NSInteger)section {
    if (section == 0) {  // 小编推荐
        return self.model.editorRecommendAlbums.title;
    } else if (section == 1) {  //精品听单
        return self.model.specialColumn.title;
    } else if (section == 2) {  // 发现新奇
        return self.model.discoveryColumns.title;
    } else if (section == _section){  // 热门直播
        return @"热门直播";
    } else if (section == _section-1) {  // 查看更多分类
        return @"查看更多分类";
    } else {  // 热门推荐
        return  self.model.hotRecommends.list[section-3].title;
    }
}

- (BOOL)hasMoreForSection:(NSInteger)section {
    if (section == 0) {  // 小编推荐
        return self.model.editorRecommendAlbums.hasMore;
    } else if (section == 1) {  //精品听单
        return self.model.specialColumn.hasMore;
    } else if (section == 2) {  // 发现新奇
        return NO;
    } else if (section >= _section-2){  // 热门直播 && 查看更多分类
        return NO;
    } else {  // 热门推荐
        return  YES;
    }
}

#pragma mark - 给FindPutCell的属性方法
#pragma mark  section是组数, index是按钮下标( 或者行标号)--- DiscoveryCell,SpecialCell三者共用cover title track(subtitle)方法
// 图
// 热门推荐 列表(外层需要HotR_List_List* 读取数组中的对象)
- (NSURL *)coverURLForSection:(NSInteger)section index:(NSInteger)index {
    NSString *path = nil;
    if (section == 0) {
        path =  self.model.editorRecommendAlbums.list[index].coverLarge;
    } else if (section == 1) {
        NSString *path =  self.model.specialColumn.list[index].coverPath;
        return [NSURL URLWithString:path];
    } else if (section == 2) {
        NSString *path =  self.model.discoveryColumns.list[index].coverPath;
        return [NSURL URLWithString:path];
    }  else {
        path = self.model.hotRecommends.list[section - 3].list[index].coverLarge;
    }
    return [NSURL URLWithString:path];
}
- (NSString *)titleForSection:(NSInteger)section index:(NSInteger)index {
    if (section == 0) {
        return self.model.editorRecommendAlbums.list[index].title;
    } else if (section == 1) {
        return self.model.specialColumn.list[index].title;
    } else if (section == 2) {
        return self.model.discoveryColumns.list[index].title;
    } else {
        return self.model.hotRecommends.list[section - 3].list[index].title;
    }
}
- (NSString *)trackTitleForSection:(NSInteger)section index:(NSInteger)index {
    if (section == 0) {
        return self.model.editorRecommendAlbums.list[index].trackTitle;
    } else if (section == 1) {
        return self.model.specialColumn.list[index].subtitle;
    } else if (section == 2) {
        return self.model.discoveryColumns.list[index].subtitle;
    } else {
        return self.model.hotRecommends.list[section - 3].list[index].trackTitle;
    }
}
- (NSInteger)albumIdForSection:(NSInteger)section index:(NSInteger)index {
    if (section == 0) {
        return self.model.editorRecommendAlbums.list[index].albumId;
    } else {
        return self.model.hotRecommends.list[section - 3].list[index].albumId;
    }
}
// 集数  -- 跳转页tableView的row
- (NSInteger)tracksForSection:(NSInteger)section index:(NSInteger)index {
    if (section == 0) {
        return self.model.editorRecommendAlbums.list[index].tracks;
    } else {
        return self.model.hotRecommends.list[section - 3].list[index].tracks;
    }
}

- (NSArray *)hotListsModelForSection:(NSInteger)section {
    return self.model.hotRecommends.list;
}

/** 给SpecialCell的属性方法 */
- (NSString *)footNoteForRow:(NSInteger)row {
    return self.model.specialColumn.list[row].footnote;
}

// 热门直播
- (NSURL *)entrancesURL {
    NSString *path = self.model.entrances.list.firstObject.coverPath;
    return [NSURL URLWithString:path];
}
- (NSString *)entrancesTitle {
    return self.model.entrances.list.firstObject.title;
}

#pragma mark - 头部滚动视图
/**  是否有滚动视图 */
- (BOOL)isExitsScrollView {   // 判断一个数组不空办法, 还要加上NSNull类, 因为服务器人员可能出错
    
    return self.model.focusImages.list != nil && self.model.focusImages.list.count != 0 && ![self.model.focusImages.list isKindOfClass:[NSNull class]] ;
}
/** 滚动展示栏的图片数量 */
- (NSInteger)focusImgNumber {
    return self.model.focusImages.list.count;
}
/** 滚动展示栏的图片地址 */
- (NSURL *)focusImgURLForIndex:(NSInteger)index {
    NSString *path = self.model.focusImages.list[index].pic;
    return [NSURL URLWithString:path];
}


#pragma mark - 跳转需要值
- (NSInteger)categoryIdForSection:(NSInteger)section {
    if (section >=3 && section<= 15) {
        return self.model.hotRecommends.list[section-3].categoryId;
    } else {
        return 0;
    }
}
- (NSString *)contentTypeForSection:(NSInteger)section {
    if (section >=3 && section<= 15) {
        return self.model.hotRecommends.list[section-3].contentType;
    } else {
        return nil;
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
