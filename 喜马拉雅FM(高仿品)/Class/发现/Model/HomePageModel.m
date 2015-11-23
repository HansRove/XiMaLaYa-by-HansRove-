//
//  HomePageModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HomePageModel.h"

@implementation HomePageModel

@end
@implementation DiscoveryC

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list" : [DiscoveryC_List class]};
}

@end


@implementation DiscoveryC_List

@end


@implementation FocusImg

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [FocusImg_List class]};
}

@end


@implementation FocusImg_List

@end


@implementation HotR

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [HotR_List class]};
}

@end


@implementation HotR_List

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [HotR_List_List class]};
}

@end


@implementation HotR_List_List

@end


@implementation Entrances

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [Entrances_List class]};
}

@end


@implementation Entrances_List

@end


@implementation EditorrRA

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [EditorrRA_List class]};
}

@end


@implementation EditorrRA_List

@end


@implementation SpecialC

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [SpecialC_List class]};
}

@end


@implementation SpecialC_List

@end


