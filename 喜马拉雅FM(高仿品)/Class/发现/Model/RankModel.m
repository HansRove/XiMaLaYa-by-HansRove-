//
//  RankModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "RankModel.h"

@implementation RankModel


+ (NSDictionary *)objectClassInArray{
    return @{@"datas" : [RankDatas class]};
}
@end
@implementation RankFocusimages

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RFocusImages_List class]};
}

@end


@implementation RFocusImages_List

@end


@implementation RankDatas

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RDatas_List class]};
}

@end


@implementation RDatas_List

+ (NSDictionary *)objectClassInArray{
    return @{@"firstKResults" : [RDatas_List_Firstkresults class]};
}

@end


@implementation RDatas_List_Firstkresults

@end


