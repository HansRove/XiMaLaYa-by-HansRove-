//
//  SectionView.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/24.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  第0组分组头
 */
@interface SectionView : UIView

// 使用外界传入集数值 初始化这个分组头
- (instancetype)initWithTotalTracks:(NSString *)tracks;
@property (nonatomic,strong) NSString *tracks;

@end
