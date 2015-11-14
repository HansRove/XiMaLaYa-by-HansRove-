//
//  HRFindViewController.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WMPageController.h>
#import "HRNavigationController.h"
/**
 *  继承 WMPageController
 */
@interface HRFindViewController : WMPageController

/** 单例一个带有WMPageController的Navi*/
+ (UINavigationController *)defaultFindUINavigationController;
@end
