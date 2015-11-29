//
//  TracksCell.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/26.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  选集Cell
 */
@interface TracksCell : UITableViewCell
/**  集数title */
@property (nonatomic,strong) UILabel *title;
/**  集数更新时间 */
@property (nonatomic,strong) UILabel *updateTime;
/**  集数播放数 */
@property (nonatomic,strong) UILabel *playsCount;
/**  集数播放时间 */
@property (nonatomic,strong) UILabel *playTime;
/**  集数评论 */
@property (nonatomic,strong) UILabel *commentCount;


@end
