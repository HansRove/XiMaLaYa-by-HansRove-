//
//  FindTabsNetManager.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseNetManager.h"

@interface FindTabsNetManager : BaseNetManager
/**
 *  从网络上获取XMFind的标题菜单
 */
+ (id)getFindTabsCompletionHandle:(void(^)(id responseObject, NSError *error))completed;

/**  取从网络中获取的标题数组 */
@property (nonatomic,strong) NSArray *tabsList;

@end
