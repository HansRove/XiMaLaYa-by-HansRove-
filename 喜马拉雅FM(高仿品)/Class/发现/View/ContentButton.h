//
//  ContentButton.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/13.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  自定义内容展示视图按钮
 */
@interface ContentButton : UIButton
// 透明蒙版
@property (nonatomic,strong) UIView *coverView;
// 蒙版标签
@property (nonatomic,strong) UILabel *titleLb;

@end
