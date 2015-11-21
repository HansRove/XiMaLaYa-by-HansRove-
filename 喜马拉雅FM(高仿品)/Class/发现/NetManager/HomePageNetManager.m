//
//  HomePageNetManager.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HomePageNetManager.h"
#import "HomePageModel.h"  // 推荐模型
#import "CategoryModel.h"  // 分类模型
#import "AnchorModel.h"     // 主播模型
#import "RankModel.h"        // 榜单模型
#import "LiveModel.h"         // 直播模型

// ?号前网址
#define kHomeURLPath @"http://mobile.ximalaya.com/mobile/discovery/v1/recommends"
#define kCategoryURLPath @"http://mobile.ximalaya.com/mobile/discovery/v1/categories"
#define kNickURLPath @"http://mobile.ximalaya.com/m/explore_user_index"
#define kRankURLPath @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group"
#define kLiveURLPath @"http://live.ximalaya.com/live-web/v1/getHomePageRadiosList"

#define kURLVersion @"version":@"4.3.26.2"
#define kURLDevice @"device":@"ios"
#define kURLSpecial @"includeSpecial":@"true"
#define kURLActivity @"includeActivity":@"true"
#define kURLScale @"scale":@2
#define kURLPage @"page":@1
#define kURLPicVersion @"picVersion":@11
#define KURLChannel @"channel":@"and-f5"   // 会变 貌似不影响

@implementation HomePageNetManager

//@"http://mobile.ximalaya.com/mobile/discovery/v1/recommends?channel=and-d3&device=android&includeActivity=true&includeSpecial=true&scale=2&version=4.3.26.2"
+ (id)getHomePageIntroduceCompletionHandle:(void (^)(id, NSError *))completed {
    return [self GET:kHomeURLPath parameters:@{KURLChannel,kURLDevice,kURLActivity,kURLSpecial,kURLScale,kURLVersion} complationHandle:^(id responseObject, NSError *error) {
        completed([HomePageModel mj_objectWithKeyValues:responseObject],error);
    }];
}

/**  从网络上获得分类信息 */
//http://mobile.ximalaya.com/mobile/discovery/v1/categories?device=android&picVersion=11&scale=2
+ (id)getCategoryPageCompletionHandle:(void(^)(id responseObject, NSError *error))completed {
    return [self GET:kCategoryURLPath parameters:@{kURLDevice,kURLPicVersion,kURLScale} complationHandle:^(id responseObject, NSError *error) {
        completed([CategoryModel mj_objectWithKeyValues:responseObject], error);
    }];
}


/** 从网络上获得主播信息 */
//http://mobile.ximalaya.com/m/explore_user_index?device=android&page=1
+ (id)getAnchorPageCompletionHandle:(void(^)(id responseObject, NSError *error))completed {
    return [self GET:kNickURLPath parameters:@{kURLDevice,kURLPage} complationHandle:^(id responseObject, NSError *error) {
        completed([AnchorModel mj_objectWithKeyValues:responseObject],error);
    }];
}

/** 从网络上获得榜单信息 */
//http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group?channel=and-d10&device=android&includeActivity=true&includeSpecial=true&scale=2&version=4.3.32.2
+ (id)getRankPageCompletionHandle:(void(^)(id responseObject, NSError *error))completed {
    return [self GET:kRankURLPath parameters:@{KURLChannel,kURLDevice,kURLActivity,kURLSpecial,kURLScale,kURLVersion} complationHandle:^(id responseObject, NSError *error) {
        completed([RankModel mj_objectWithKeyValues:responseObject],error);
    }];
}

/**  从网络上获取直播信息 */
// http://live.ximalaya.com/live-web/v1/getHomePageRadiosList?device=android
+ (id)getLivePageCompletionHandle:(void(^)(id responseObject, NSError *error))completed {
    return [self GET:kLiveURLPath parameters:@{kURLDevice}complationHandle:^(id responseObject, NSError *error) {
        completed([LiveModel mj_objectWithKeyValues:responseObject],error);
    }];
}

@end
