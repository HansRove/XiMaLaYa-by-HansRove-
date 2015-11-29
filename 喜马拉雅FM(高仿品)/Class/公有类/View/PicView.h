//
//  PicView.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/25.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  方形图片
 */
@interface PicView : UIView
// 方图
@property (nonatomic,strong) UIImageView *coverView;
// 透明图层
@property (nonatomic,strong) UIImageView *bgView;
// 播放数
@property (nonatomic,strong) UIButton *playCountBtn;

@end
