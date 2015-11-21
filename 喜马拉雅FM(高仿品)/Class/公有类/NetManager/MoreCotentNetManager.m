//
//  MoreCotentNetManager.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/18.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "MoreCotentNetManager.h"
#import "ContentsModel.h"
#import "MenusModel.h"
#import "ContentCategoryModel.h"

#define kURLPath @"http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends"
#define kURLCategoryPath @"http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends"
#define kURLAlbumPath @"http://mobile.ximalaya.com/mobile/discovery/v1/category/album"
#define kURLVersion @"version":@"4.3.26.2"
#define kURLDevice @"device":@"ios"
#define KURLScale @"scale":@2
#define kURLCalcDimension @"calcDimension":@"hot"
#define kURLPageID @"pageId":@1
#define kURLStatus  @"status":@0
// 汉字UTF8进行转换并转入字典
//#define kURLTitle @"title":[@"更多" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]

@implementation MoreCotentNetManager



/** 解析,获取内容推荐数据模型 */
// http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends?categoryId=1&contentType=album&device=android&scale=2&version=4.3.32.2
+ (id)getContentsForForCategoryId:(NSInteger)categoryID contentType:(NSString*)type completionHandle:(void(^)(id responseObject, NSError *error))completed {
    NSDictionary *params = @{@"categoryId":@(categoryID),@"contentType":type,kURLDevice,KURLScale,kURLVersion};
    return [self GET:kURLPath parameters:params complationHandle:^(id responseObject, NSError *error) {
        completed([ContentsModel mj_objectWithKeyValues:responseObject],error);
    }];
}

/**  解析,内容分类数据模型*/
// http://mobile.ximalaya.com/mobile/discovery/v1/category/album?calcDimension=hot&categoryId=1&device=android&pageId=1&pageSize=20&status=0&tagName=%E6%AD%A3%E8%83%BD%E9%87%8F%E5%8A%A0%E6%B2%B9%E7%AB%99
+ (id)getCategoryForCategoryId:(NSInteger)categoryId tagName:(NSString *)name pageSize:(NSInteger)size completionHandle:(void(^)(id responseObject, NSError *error))completed {
    // tagName中文需要转换成UTF8格式, 这个另类   直接需要中文
//    NSString *tagName = [name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *params = @{@"categoryId":@(categoryId),@"pageSize":@(size),@"tagName":name, kURLPageID,kURLDevice,kURLStatus,kURLCalcDimension};
    return [self GET:kURLAlbumPath parameters:params complationHandle:^(ContentCategoryModel* responseObject, NSError *error) {
        completed([ContentCategoryModel mj_objectWithKeyValues:responseObject],error);
    }];
}


@end
