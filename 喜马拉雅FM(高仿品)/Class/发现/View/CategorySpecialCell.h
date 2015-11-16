//
//  CategorySpecialCell.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/15.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  一个大  四个小, Cell高195
 */
@interface CategorySpecialCell : UITableViewCell
// 大图
@property (nonatomic,strong) UIImageView *icon0;
// 四个小图
@property (nonatomic,strong) UIImageView *icon1;
@property (nonatomic,strong) UIImageView *icon2;
@property (nonatomic,strong) UIImageView *icon3;
@property (nonatomic,strong) UIImageView *icon4;

// 告诉外界 cell该有多宽
@property (nonatomic,assign) CGFloat cellHeight;
@end
