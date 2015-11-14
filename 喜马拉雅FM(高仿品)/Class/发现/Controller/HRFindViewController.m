//
//  HRFindViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRFindViewController.h"

#import "CategoryViewController.h"
#import "LiveViewController.h"
#import "RankingViewController.h"
#import "AnchorViewController.h"
//#import "RecommendViewController.h"


@interface HRFindViewController ()

@end

@implementation HRFindViewController

+ (UINavigationController *)defaultFindUINavigationController {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       HRFindViewController *findVC = [[HRFindViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"推荐",@"分类",@"直播",@"榜单"]];
//        WMPageController的设置
        
        navi = [[UINavigationController alloc] initWithRootViewController:findVC];
    });
    return navi;
}

+ (NSArray *)ViewControllerClasses {
    return @[[CategoryViewController class], [LiveViewController class], [RankingViewController class], [AnchorViewController class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}



@end
