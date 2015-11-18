//
//  AnchorViewModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "AnchorViewModel.h"
#import "HomePageNetManager.h"
#import "AnchorModel.h"

@interface AnchorViewModel ()
@property (nonatomic,strong) AnchorModel *model;
@end

@implementation AnchorViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [HomePageNetManager getAnchorPageCompletionHandle:^(AnchorModel* responseObject, NSError *error) {
        self.model = responseObject;
        
        completed(error);
    }];
}

- (NSInteger)section {
    return self.model.list.count;
}
// 主播cover图片
- (NSURL *)coverURLForSection:(NSInteger)section Index:(NSInteger)index {
    NSString *path = self.model.list[section].list[index].smallLogo;
    return [NSURL URLWithString:path];
}
// 主播Name
- (NSString *)nameForSection:(NSInteger)section Index:(NSInteger)index {
    return self.model.list[section].list[index].nickname;
}

- (NSString *)mainTitleForSection:(NSInteger)section {
    return self.model.list[section].title;
}

/** 通过indexPath返回cell高*/
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

@end
