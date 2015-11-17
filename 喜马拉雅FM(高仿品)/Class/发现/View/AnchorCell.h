//
//  AnchorCell.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnchorView.h"
/**
 *  主播Cell: 三按钮 三label 三小按钮
 */
@interface AnchorCell : UITableViewCell

//@property (nonatomic,strong) UIImageView *anthorIV0;
//@property (nonatomic,strong) UIImageView *anthorIV1;
//@property (nonatomic,strong) UIImageView *anthorIV2;
//@property (nonatomic,strong) UILabel *nameLb0;
//@property (nonatomic,strong) UILabel *nameLb1;
//@property (nonatomic,strong) UILabel *nameLb2;

@property (nonatomic,strong) AnchorView *anchorView0;
@property (nonatomic,strong) AnchorView *anchorView1;
@property (nonatomic,strong) AnchorView *anchorView2;

@end
