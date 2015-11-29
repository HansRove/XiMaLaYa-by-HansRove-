//
//  SettingViewController.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/23.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingViewController;
@protocol SettingViewControllerDelegate <NSObject>

- (void)settingViewControllerWillAppear:(SettingViewController *)settingVC;

@end

/**
 *  设置视图
 */
@interface SettingViewController : UITableViewController

@property (nonatomic,weak) id<SettingViewControllerDelegate> delegate;

@end
