//
//  CategoryCommonCell.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/16.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryButton.h"
/**
 *  两图标 两label   中间Vie隔开
 */
@interface CategoryCommonCell : UITableViewCell
/*
@property (nonatomic,strong) UIImageView *icon1;
// icon2顺便设分隔线
@property (nonatomic,strong) UIImageView *icon2;
@property (nonatomic,strong) UILabel *categoryLb1;
@property (nonatomic,strong) UILabel *categoryLb2;
*/
@property (nonatomic,strong) CategoryButton *btn1;
@property (nonatomic,strong) CategoryButton *btn2;

@end
