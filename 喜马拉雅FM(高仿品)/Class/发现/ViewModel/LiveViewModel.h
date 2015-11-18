//
//  LiveViewModel.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseViewModel.h"
/**
 *  直播VM
 */
@interface LiveViewModel : BaseViewModel
/**  返回分组数 */
@property (nonatomic,assign) NSInteger sectionNumber;
/**  通过分组数返回行数 */
- (NSInteger)rowNumberForSection:(NSInteger)section;
/**  通过分组数返回主标题 */
- (NSString *)mainTitleForSection:(NSInteger)section;
/**  通过分组数判断是否有更多 */
- (BOOL)hasMoreForSection:(NSInteger)section;

/** 通过分组和index返回按钮背景URL*/
- (NSURL *)coverURLForSection:(NSInteger)section index:(NSInteger)index;
/** 通过分组和index返回按钮标签*/
- (NSString *)nameForSection:(NSInteger)section index:(NSInteger)index;


/** 通过indexPath返回coverURL*/
- (NSURL *)coverURLForRow:(NSInteger)row;
/** 通过indexPath返回标题*/
- (NSString *)titleForRow:(NSInteger)row;
/** 通过indexPath返回子标题*/
- (NSString *)subTitleForRow:(NSInteger)row;
/** 通过indexPath返回收听数*/
- (NSString *)soundCountForRow:(NSInteger)row;

/** 通过indexPath返回cell高*/
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath;

@end
