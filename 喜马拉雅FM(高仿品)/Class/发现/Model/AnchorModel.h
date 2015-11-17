//
//  AnchorModel.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseModel.h"
/**
 *  主播类: 解析URL:http://mobile.ximalaya.com/m/explore_user_index?device=android&page=1
 */
@class AnchorRecommend,ARecommend_List,AnchorLists,ALists_List;
@interface AnchorModel : BaseModel

@property (nonatomic, strong) AnchorRecommend *recommendBozhu;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<AnchorLists *> *list;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger ret;

@end
@interface AnchorRecommend : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) NSArray<ARecommend_List *> *list;

@end

@interface ARecommend_List : BaseModel

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *smallLogo;

@end

@interface AnchorLists : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<ALists_List *> *list;

@property (nonatomic, copy) NSString *name;

@end

@interface ALists_List : BaseModel

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *smallLogo;

@end

