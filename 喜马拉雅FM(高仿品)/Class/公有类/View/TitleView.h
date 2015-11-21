//
//  TitleView.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>

// 监听更多按钮点击事件协议
@protocol TitleViewDelegate <NSObject>

- (void)titleViewDidClick:(NSInteger)tag;

@end

@interface TitleView : UIView

// 添加代理
@property (nonatomic,weak) id<TitleViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title hasMore:(BOOL)more;

/**  标题 */
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UILabel *titleLb;

@end
