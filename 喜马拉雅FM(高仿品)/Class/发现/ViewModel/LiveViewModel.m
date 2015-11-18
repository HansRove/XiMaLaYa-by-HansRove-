//
//  LiveViewModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "LiveViewModel.h"
#import "HomePageNetManager.h"
#import "LiveModel.h"

@interface LiveViewModel ()
@property (nonatomic,strong) LiveModel *model;
@end

@implementation LiveViewModel
// 网络加载数据
- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [HomePageNetManager getLivePageCompletionHandle:^(LiveModel* responseObject, NSError *error) {
        self.model = responseObject;
        
        completed(error);
    }];
}

- (NSInteger)sectionNumber {
    return 3; // 两组
}

/**  通过分组数返回行数 */
- (NSInteger)rowNumberForSection:(NSInteger)section {
    return  (section == 0 || section == 1) ? 1 : self.model.result.topRadioList.count;
}
/**  通过分组数返回主标题 */
- (NSString *)mainTitleForSection:(NSInteger)section {
    return  (section == 1) ?@"推荐电台":@"排行榜";

}
/**  通过分组数判断是否有更多 */
- (BOOL)hasMoreForSection:(NSInteger)section {
    return section == 2;
}


/** 通过分组和index返回按钮背景URL*/
- (NSURL *)coverURLForSection:(NSInteger)section index:(NSInteger)index {
    NSString *path = self.model.result.recommandRadioList[index].picPath;
    return [NSURL URLWithString:path];
}
/** 通过分组和index返回按钮标签*/
- (NSString *)nameForSection:(NSInteger)section index:(NSInteger)index {
    return self.model.result.recommandRadioList[index].rname;
}

/** 通过indexPath返回coverURL*/
- (NSURL *)coverURLForRow:(NSInteger)row {
    NSString *path = self.model.result.topRadioList[row].radioCoverSmall;
    return [NSURL URLWithString:path];
}
/** 通过indexPath返回标题*/
- (NSString *)titleForRow:(NSInteger)row {
    return self.model.result.topRadioList[row].rname;
}
/** 通过indexPath返回子标题*/
- (NSString *)subTitleForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"正在直播: %@",self.model.result.topRadioList[row].programName];
}
/** 通过indexPath返回收听数*/
- (NSString *)soundCountForRow:(NSInteger)row {
    NSInteger total =  self.model.result.topRadioList[row].radioPlayCount;
    if (total >= 10000) {
        return [NSString stringWithFormat:@"%.1lf万人",total/10000.0];
    } else {
        return [NSString stringWithFormat:@"%ld人",total];
    }
}

/** 通过indexPath返回cell高*/
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 90;
    } else if (indexPath.section == 1) {
        return 150;
    } else {
        return 80;
    }
}


@end
