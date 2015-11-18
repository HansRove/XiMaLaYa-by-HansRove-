//
//  LiveModel.h
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/17.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "BaseModel.h"
/**
 *  (电台)直播模型
 */
@class LiveResult,LResult_Recommand,LR_R_RadioPlayURLs,LResult_TopRadioList,LR_T_RadioPlayURLs;
@interface LiveModel : BaseModel

@property (nonatomic, copy) NSString *ret;

@property (nonatomic, strong) LiveResult *result;

@property (nonatomic, copy) NSString *msg;

@end
@interface LiveResult : BaseModel

@property (nonatomic, strong) NSArray<LResult_Recommand *> *recommandRadioList;

@property (nonatomic, strong) NSArray<LResult_TopRadioList *> *topRadioList;

@end

@interface LResult_Recommand : BaseModel

@property (nonatomic, copy) NSString *radioPlayCount;

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, copy) NSString *endTime;

@property (nonatomic, assign) NSInteger recommendType;

@property (nonatomic, assign) NSInteger radioId;

@property (nonatomic, strong) LR_R_RadioPlayURLs *radioPlayUrl;

@property (nonatomic, assign) NSInteger programScheduleId;

@property (nonatomic, copy) NSString *picPath;

@property (nonatomic, copy) NSString *rname;

@property (nonatomic, copy) NSString *programName;

@end

@interface LR_R_RadioPlayURLs : BaseModel

@property (nonatomic, copy) NSString *radio_24_ts;

@property (nonatomic, copy) NSString *radio_64_aac;

@property (nonatomic, copy) NSString *radio_24_aac;

@property (nonatomic, copy) NSString *radio_64_ts;

@end

@interface LResult_TopRadioList : BaseModel

@property (nonatomic, assign) NSInteger radioPlayCount;

@property (nonatomic, copy) NSString *radioCoverLarge;

@property (nonatomic, assign) NSInteger radioId;

@property (nonatomic, assign) NSInteger programScheduleId;

@property (nonatomic, strong) LR_T_RadioPlayURLs *radioPlayUrl;

@property (nonatomic, copy) NSString *rname;

@property (nonatomic, copy) NSString *programName;

@property (nonatomic, copy) NSString *radioCoverSmall;

@end

@interface LR_T_RadioPlayURLs : BaseModel

@property (nonatomic, copy) NSString *radio_24_ts;

@property (nonatomic, copy) NSString *radio_64_aac;

@property (nonatomic, copy) NSString *radio_24_aac;

@property (nonatomic, copy) NSString *radio_64_ts;

@end

