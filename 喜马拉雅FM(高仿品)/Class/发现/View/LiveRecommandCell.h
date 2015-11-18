//
//  LiveRecommandCell.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  三个图片按钮, 三个按钮名称
 */
@interface LiveRecommandCell : UITableViewCell

@property (nonatomic,strong) UIButton *radioBtn0;
@property (nonatomic,strong) UIButton *radioBtn1;
@property (nonatomic,strong) UIButton *radioBtn2;

@property (nonatomic,strong) UILabel *nameLb0;
@property (nonatomic,strong) UILabel *nameLb1;
@property (nonatomic,strong) UILabel *nameLb2;
@end
