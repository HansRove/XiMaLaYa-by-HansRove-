//
//  MoreCotentNetManager.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/18.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseNetManager.h"

@interface MoreCotentNetManager : BaseNetManager
// 定义类型
typedef NS_ENUM(NSUInteger, ContentType) {
    ContentTypeNews,  // 听新闻
    ContentTypeNovels,  // 听小说
    ContentTypeTalkShow,  // 听脱口秀
    ContentTypeCrossTalk,  // 听相声
    ContentTypeMusic,  // 听音乐
    ContentTypeEmotion,  // 听情感心声
    ContentTypeHistory,  // 听历史
    ContentTypeLectures,  // 听讲座
    ContentTypeBroadcasr,  // 听广播剧
    ContentTypeChildrenStory,  // 听儿童故事
    ContentTypeForeignLanguage,  // 听外语
    ContentTypeGame,  // 听游戏
};


/** 解析,获取内容推荐数据模型 */
// http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends?categoryId=1&contentType=album&device=android&scale=2&version=4.3.32.2
+ (id)getContentsForForCategoryId:(NSInteger)categoryID contentType:(NSString*)type completionHandle:(void(^)(id responseObject, NSError *error))completed;


/**  解析,内容分类数据模型*/
// 通过catotyId, tagName, 以及初始行数 pageSize
// http://mobile.ximalaya.com/mobile/discovery/v1/category/album?calcDimension=hot&categoryId=1&device=android&pageId=1&pageSize=20&status=0&tagName=%E6%AD%A3%E8%83%BD%E9%87%8F%E5%8A%A0%E6%B2%B9%E7%AB%99
+ (id)getCategoryForCategoryId:(NSInteger)categoryId tagName:(NSString *)name pageSize:(NSInteger)size completionHandle:(void(^)(id responseObject, NSError *error))completed;

@end
