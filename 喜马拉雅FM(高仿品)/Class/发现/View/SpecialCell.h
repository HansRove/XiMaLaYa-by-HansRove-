//
//  SpecialCell.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/14.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  精品听单Cell
 */
@interface SpecialCell : UITableViewCell

@property (nonatomic,strong) UIButton *coverBtn;
@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *subTitleLb;
// 10张专辑
@property (nonatomic,strong) UILabel *footNoteLb;
@end
