//
//  ContentImageView.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/13.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentImageViewDelegate <NSObject>

- (void)contentImageViewClick:(NSInteger)tag;

@end

/**
 *  自定义内容展示视图,绑定按钮 及 蒙版
 */
@interface ContentImageView : UIImageView

@property (nonatomic, assign) id<ContentImageViewDelegate> delegate;

// 全view透明按钮
@property (nonatomic,strong) UIButton *button;
// 透明蒙版
@property (nonatomic,strong) UIView *coverView;
// 蒙版标签
@property (nonatomic,strong) UILabel *titleLb;
@end
