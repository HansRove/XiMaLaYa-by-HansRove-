//
//  LiveModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel

@end
@implementation LiveResult

+ (NSDictionary *)objectClassInArray{
    return @{@"recommandRadioList" : [LResult_Recommand class], @"topRadioList" : [LResult_TopRadioList class]};
}

@end


@implementation LResult_Recommand

@end


@implementation LR_R_RadioPlayURLs

@end


@implementation LResult_TopRadioList

@end


@implementation LR_T_RadioPlayURLs

@end


