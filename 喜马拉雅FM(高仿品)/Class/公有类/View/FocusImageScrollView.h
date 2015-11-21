//
//  FocusImageScrollView.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/20.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
/**
 *  封装焦点图(头部滚动视图)
 */
@interface FocusImageScrollView : UIView
/**
 *  通过传入焦点图数量以及焦点图的图片路径,初始化一个View
 */
- (instancetype)initWithFocusImgNumber:(NSInteger)number;

// 给外界接受它的代理
@property (nonatomic,strong) iCarousel *ic;
@property (nonatomic,strong) UIPageControl *pageControl;

@end
