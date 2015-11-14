//
//  FindTabsNetManager.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "FindTabsNetManager.h"
#import "FindTabsModel.h"

#define kMenuURL @"http://mobile.ximalaya.com/mobile/discovery/v1/tabs?device=ios"
@implementation FindTabsNetManager

+ (id)getFindTabsCompletionHandle:(void (^)(id, NSError *))completed {
    return [self GET:kMenuURL parameters:nil complationHandle:^(NSDictionary* responseObject, NSError *error) {
           
        completed([FindTabsModel mj_objectWithKeyValues:responseObject],error);
    }];
}
@end
