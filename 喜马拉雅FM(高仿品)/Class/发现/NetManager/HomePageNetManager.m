//
//  HomePageNetManager.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HomePageNetManager.h"
#import "HomePageModel.h"
#define kHomePath @"http://mobile.ximalaya.com/mobile/discovery/v1/recommends"
#define kURLVersion @"version":@"4.3.20.2"
#define kURLDevice @"device":@"ios"
#define kURLSpecial @"includeSpecial":@"ture"
#define kURLActivity @"includeActivity":@"ture"
#define kURLScale @"scale":@2
#define KURLChannel @"channel":@"and-f5"

@implementation HomePageNetManager

+ (id)getHomePageIntroduceCompletionHandle:(void (^)(id, NSError *))completed {
    
    //    NSDictionary *params = @{kURLActivity,KURLChannel,kURLDevice,kURLScale,kURLSpecial,kURLVersion};
    //    NSString *path = [kkkk stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:@"http://mobile.ximalaya.com/mobile/discovery/v1/recommends?channel=and-f5&device=ios&includeActivity=true&includeSpecial=true&scale=2&version=4.3.20.2" parameters:nil complationHandle:^(id responseObject, NSError *error) {
        completed([HomePageModel mj_objectWithKeyValues:responseObject],error);
    }];
}



@end
