//
//  CategoryButton.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/16.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  分类按钮, 左边图片 右边标签
 */
@interface CategoryButton : UIButton

@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *categoryLb;

@end
