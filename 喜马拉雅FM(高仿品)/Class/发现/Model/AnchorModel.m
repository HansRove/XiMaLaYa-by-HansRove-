//
//  AnchorModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "AnchorModel.h"

@implementation AnchorModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [AnchorLists class]};
}
@end
@implementation AnchorRecommend

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [ARecommend_List class]};
}

@end


@implementation ARecommend_List

@end


@implementation AnchorLists

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [ALists_List class]};
}

@end


@implementation ALists_List

@end


