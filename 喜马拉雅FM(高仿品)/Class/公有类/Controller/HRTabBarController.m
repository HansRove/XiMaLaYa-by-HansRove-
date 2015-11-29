//
//  HRTabBarController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRTabBarController.h"
#import "HRMeViewController.h"
#import "HRDownloadViewController.h"
#import "HRFindViewController.h"
#import "HRSoundViewController.h"


@interface HRTabBarController ()

@end

@implementation HRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TabBarController绑定, 配置各个控制器
    // findNavi是套有导航的
    UINavigationController *findNavi = [HRFindViewController defaultFindUINavigationController];
    [self setupChildController:findNavi imageName:@"tabbar_find_n" selectedImage:@"tabbar_find_h"];
    HRSoundViewController *soundVC = [HRSoundViewController soundViewController];
    [self setupChildController:soundVC imageName:@"tabbar_sound_n" selectedImage:@"tabbar_sound_h"];
    // 只占用空间
    UIViewController *vc = [UIViewController new];
    [self setupChildController:vc  imageName:nil selectedImage:nil];
    
    HRDownloadViewController *downloadVC = [HRDownloadViewController downloadViewController];
    [self setupChildController:downloadVC imageName:@"tabbar_download_n" selectedImage:@"tabbar_download_h"];
    
    // 从独立的storyboard中获取一个控制器
    HRMeViewController *meVC = [kStoryboard(@"MeSetting") instantiateViewControllerWithIdentifier:@"Me"];

    [self setupChildController:meVC imageName:@"tabbar_me_n" selectedImage:@"tabbar_me_h"];
    // 设置tabbar的背景图
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    

}


/**  绑定各个控制器, 顺便设置属性 */
- (void)setupChildController:(UIViewController *)vc imageName:(NSString *)imgName selectedImage:(NSString *)selectedImgName {
    // 设置图片间距
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    // 设置图片的不渲染
    UIImage *image = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = image;
    [self addChildViewController:vc];
}

@end
