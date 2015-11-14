//
//  FindTabsModel.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/12.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseModel.h"

@class FindTabs,FindTabs_List;
/**
 *  http://mobile.ximalaya.com/mobile/discovery/v1/tabs?device=ios
 */
@interface FindTabsModel : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) FindTabs *tabs;

@end
@interface FindTabs : BaseModel

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<FindTabs_List *> *list;

@end

@interface FindTabs_List : BaseModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *contentType;

@end
