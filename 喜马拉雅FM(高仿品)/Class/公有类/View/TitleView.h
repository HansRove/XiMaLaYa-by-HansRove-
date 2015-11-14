//
//  TitleView.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIView

- (instancetype)initWithTitle:(NSString *)title hasMore:(BOOL)more;

/**  标题 */
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UILabel *titleLb;

@end
