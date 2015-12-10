//
//  HRPlayView.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlayViewDelegate <NSObject>
// 传入按钮的selected属性
- (void)playButtonDidClick:(BOOL)selected;
@end


@interface HRPlayView : UIView
@property (nonatomic,strong) UIImageView *circleIV;
@property (nonatomic,strong) UIImageView *contentIV;
@property (nonatomic,strong) UIButton *playButton;
@property (nonatomic,weak) id<PlayViewDelegate> delegate;

@end
