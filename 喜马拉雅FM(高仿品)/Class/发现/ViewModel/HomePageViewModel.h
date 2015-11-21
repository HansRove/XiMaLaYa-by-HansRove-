//
//  HomePageViewModel.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseViewModel.h"
#import "HomePageModel.h"

/**
 *  首页VM
 */
@interface HomePageViewModel : BaseViewModel

/** 存储小编推荐栏 editorRecommendAlbums */
/** 存储发现新奇栏 discoveryColumns */
@property (nonatomic,assign) NSInteger discoverCount;
/** 存储精品听单栏 specialColumn*/
@property (nonatomic,assign) NSInteger specialCount;
/** 存储热门hotRecommends.list 各个分类栏 */
@property (nonatomic,strong) NSArray *hotRecommendsArr;

/** 返回分组数 = 热门list + 其他*/
@property (nonatomic,assign) NSInteger section;

/** 给TitleView的组title*/
- (NSString *)mainTitleForSection:(NSInteger)section;
- (BOOL)hasMoreForSection:(NSInteger)section;


/**  给FindPutCell的属性方法 */
// section是组数, index是按钮下标( 或者行标号)--- DiscoveryCell,SpecialCell三者共用cover title track(subtitle)方法
// 图
- (NSURL *)coverURLForSection:(NSInteger)section index:(NSInteger)index;
// 蒙版标题
- (NSString *)titleForSection:(NSInteger)section index:(NSInteger)index;
// 详情
- (NSString *)trackTitleForSection:(NSInteger)section index:(NSInteger)index;
// 跳转键
- (NSInteger)albumIdForSection:(NSInteger)section index:(NSInteger)index;
// 集数  -- 跳转页tableView的row
- (NSInteger)tracksForSection:(NSInteger)section index:(NSInteger)index;

/** 给SpecialCell的属性方法 */
- (NSString *)footNoteForRow:(NSInteger)row;

/**  给属性方法*/
// 热门直播图片地址
- (NSURL *)entrancesURL;
- (NSString *)entrancesTitle;

#pragma mark - 头部滚动视图
/**  是否有滚动视图 */
@property (nonatomic,assign,getter=isExitsScrollView) BOOL exitsScrollView;
/** 滚动展示栏(焦点图)的图片数量 */
@property (nonatomic,assign) NSInteger focusImgNumber;
/** 滚动展示栏(焦点图)的图片地址 */
- (NSURL *)focusImgURLForIndex:(NSInteger)index;


#pragma mark - 跳转需要值
- (NSInteger)categoryIdForSection:(NSInteger)section;
- (NSString *)contentTypeForSection:(NSInteger)section;

@end
