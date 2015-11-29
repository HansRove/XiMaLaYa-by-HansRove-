//
//  MoreRecommendController.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/19.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreContentViewModel.h"

/**
 *  (发现-热门更多)推荐控制器
 */
@interface MoreRecommendController : UIViewController

// 作一个键(name), 让MV可以绑定
/**  需要键数组, [0]存_categoryId   [1]存 name*/
@property (nonatomic,strong) NSArray *keyArr;



@end
