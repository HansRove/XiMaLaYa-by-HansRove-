//
//  DestinationViewController.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/24.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  最终展示页控制器
 */
@interface DestinationViewController : UIViewController

// 选择接受外界title, 以及albumId 初始化
- (instancetype)initWithAlbumId:(NSInteger)albumId title:(NSString *)oTitle;
@property (nonatomic,assign) NSInteger albumId;
@property (nonatomic,strong) NSString *oTitle;

@end
