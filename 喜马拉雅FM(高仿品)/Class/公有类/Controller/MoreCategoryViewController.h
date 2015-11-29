//
//  MoreCategoryViewController.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/19.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  (发现-热门更多)其他分类控制器
 */
@interface MoreCategoryViewController : UIViewController

// 作一个键, 让MV可以绑定    接收外部传参，决定当前控制器显示哪种类型的信息
/**  需要键数组, [0]存_categoryId   [1]存 name*/
@property (nonatomic,strong) NSArray *keyArr;

@end
