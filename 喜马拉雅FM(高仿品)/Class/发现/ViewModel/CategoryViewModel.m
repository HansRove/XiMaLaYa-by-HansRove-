//
//  CategoryViewModel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/16.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "CategoryViewModel.h"
#import "HomePageNetManager.h"
#import "CategoryModel.h"

@interface CategoryViewModel ()
@property (nonatomic,strong) CategoryModel *model;
@end

@implementation CategoryViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [HomePageNetManager getCategoryPageCompletionHandle:^(CategoryModel* responseObject, NSError *error) {
        self.model = responseObject;
        completed(error);
    }];
}
- (NSInteger)listsCount {
    return self.model.list.count;
}
/** 获取图标接口 */
- (NSURL *)coverURLForIndex:(NSInteger)index {
    NSString *path = self.model.list[index].coverPath;
    return [NSURL URLWithString:path];
}
/** 获取Title接口 */
- (NSString *)titleForIndex:(NSInteger)index {
    return self.model.list[index].title;
}

@end
