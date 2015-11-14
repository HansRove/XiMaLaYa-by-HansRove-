//
//  HomePageViewModel.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomePageViewModel : BaseViewModel
/** 存储focusImages.list焦点图数组*/
@property (nonatomic,strong) NSArray *focusImagesArr;
/** 存储小编推荐栏 editorRecommendAlbums */
/** 存储发现新奇栏 discoveryColumns */
@property (nonatomic,assign) NSInteger discoverCount;
/** 存储精品听单栏 specialColumn*/
@property (nonatomic,assign) NSInteger specialCount;
/** 存储热门hotRecommends.list 各个分类栏 */
@property (nonatomic,strong) NSArray *hotRecommendsArr;

/** 返回分组数 = 热门list + 其他*/
@property (nonatomic,assign) NSInteger section;

/** 给TitleView的title*/
- (NSString *)titleForSection:(NSInteger)section;
- (BOOL)hasMoreForSection:(NSInteger)section;

@end
