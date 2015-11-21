//
//  HomePageNetManager.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseNetManager.h"

@interface HomePageNetManager : BaseNetManager

/*
 <从网络上获取首界面内容>
 发现新奇discoveryColumns
 小编推荐editorRecommendAlbums
 热门推荐 (内含有 听新闻, 听小说等)hotRecommends
 焦点图focusImages
 精品听单specialColumn
 http://mobile.ximalaya.com/mobile/discovery/v1/recommends?channel=and-f5&device=ios&includeActivity=true&includeSpecial=true&scale=2&version=4.3.20.2
 */
+ (id)getHomePageIntroduceCompletionHandle:(void(^)(id responseObject, NSError *error))completed;

/**  从网络上获得分类信息 */
//http://mobile.ximalaya.com/mobile/discovery/v1/categories?device=android&picVersion=11&scale=2
+ (id)getCategoryPageCompletionHandle:(void(^)(id responseObject, NSError *error))completed;

/** 从网络上获得主播信息 */
//http://mobile.ximalaya.com/m/explore_user_index?device=android&page=1
+ (id)getAnchorPageCompletionHandle:(void(^)(id responseObject, NSError *error))completed;

/** 从网络上获得榜单信息 */
//http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group?channel=and-d10&device=android&includeActivity=true&includeSpecial=true&scale=2&version=4.3.32.2
+ (id)getRankPageCompletionHandle:(void(^)(id responseObject, NSError *error))completed;
/**  从网络上获取直播信息 */
// http://live.ximalaya.com/live-web/v1/getHomePageRadiosList?device=android
+ (id)getLivePageCompletionHandle:(void(^)(id responseObject, NSError *error))completed;

/**  获取猜你喜欢 */
//
//+ (id)getGuessYouLickCompletionHandle:(void(^)(id responseObject, NSError *error))completed;
@end
