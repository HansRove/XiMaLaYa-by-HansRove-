//
//  CategoryViewModel.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/16.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseViewModel.h"
/**
 *  分类VM
 */
@interface CategoryViewModel : BaseViewModel

// 返回list个数
@property (nonatomic,assign) NSInteger listsCount;

/** 获取图标接口 */
- (NSURL *)coverURLForIndex:(NSInteger)index;
/** 获取Title接口 */
- (NSString *)titleForIndex:(NSInteger)index;


@end
