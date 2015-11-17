//
//  AnchorViewModel.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseViewModel.h"

/**
 *  主播VM
 */
@interface AnchorViewModel : BaseViewModel

// 分组数量
@property (nonatomic,assign) NSInteger section;

// 主播cover图片
- (NSURL *)coverURLForSection:(NSInteger)section Index:(NSInteger)index;
// 主播Name
- (NSString *)nameForSection:(NSInteger)section Index:(NSInteger)index;

/** 给TitleView的组title-----更多都为1*/
- (NSString *)mainTitleForSection:(NSInteger)section;


@end
