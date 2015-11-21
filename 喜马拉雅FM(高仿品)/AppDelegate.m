//
//  AppDelegate.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "AppDelegate.h"
#import "HRTabBarController.h"
#import "HRNavigationController.h"
#import "HRFindViewController.h"

#import "HomePageViewModel.h"
#import "HomePageNetManager.h"  // 测试网络解析
#import "MoreCotentNetManager.h"  //  测试

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSString *parcentStr = [@"%E6%AD%A3%E8%83%BD%E9%87%8F%E5%8A%A0%E6%B2%B9%E7%AB%99" stringByRemovingPercentEncoding];
    NSLog(@"%@",parcentStr);
    
    
//    http://mobile.ximalaya.com/mobile/discovery/v1/category/album?calcDimension=hot&categoryId=1&device=android&pageId=1&pageSize=20&status=0&tagName=%E6%AD%A3%E8%83%BD%E9%87%8F%E5%8A%A0%E6%B2%B9%E7%AB%99
    [MoreCotentNetManager getCategoryForCategoryId:1 tagName:@"" pageSize:20 completionHandle:^(id responseObject, NSError *error) {
        NSLog(@"");
    }];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    HRTabBarController *tab = [[HRTabBarController alloc] init];
    HRNavigationController *navi = [[HRNavigationController alloc] initWithRootViewController:tab];
    self.window.rootViewController = navi;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
