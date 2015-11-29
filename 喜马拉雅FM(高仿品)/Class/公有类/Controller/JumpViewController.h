//
//  JumpViewController.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/19.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
  * (发现-热门更多)页面跳转视图, 负责初始化WMPageController  并跳转
 */
@interface JumpViewController : UIViewController
/** 控制器初始化 */
- (instancetype)initWithCategoryId:(NSInteger)categoryId contentType:(NSString *)type tag:(NSInteger)tag;

@property (nonatomic,assign) NSInteger categoryId;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,assign) NSInteger tag;

@end
