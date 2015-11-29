//
//  HRPlayView.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlayViewDelegate <NSObject>

- (void)playButtonDidClick;

@end

@interface HRPlayView : UIView

@property (nonatomic,strong) UIImageView *circleIV;
@property (nonatomic,strong) UIButton *playButton;
//@property (nonatomic,assign,getter=isScroll) BOOL scroll;
@property (nonatomic,weak) id<PlayViewDelegate> delegate;

@end
