//
//  SpecialMoreViewMoel.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/21.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "SpecialMoreViewMoel.h"
#import "MoreCotentNetManager.h"
#import "SpecialModel.h"

/*  (iOS)通过时间戳(年月日)对tableView实现分组分行
 
    * 记录说明: 因为最近一直在仿做喜马拉雅FM, 通过对喜马拉雅FM更多按钮事件触发后的抓包分析, 再对比软件UI发现实现没我想的那么简单, 它没有确定的返回组,行数据. 软件UI看出 数据是通过时间戳releasedAt属性进行年月日的划分(分组) 以及 组内行个数.
    * 遇到的问题: 时间戳转换成日期问题, 划分算法, 以及更新后数据的处理
    * 解决问题: 1>时间戳转换日期(百度一大堆都比我好)
    我是使用了NSDate的类方法 dateWithTimeIntervalSince1970:(时间戳)  转成NSDate对象, 在比较对象是否相等. 在此又遇到一个问题: NSDate的比较(compare)比较到时分秒, 并不是我想要的结果. 所以我写了一个方法- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay 比较两个具体年月日的NSDate
    2> 划分算法(想了我老半天): 遇到无数的数组越界问题导致的程序crash, 通过反复的断点调试调整判断及循环.  本人是算法菜鸟, 只能慢慢动笔算以及断点跟程序才发现原来可以这么简单.(进弯路走出弯路: 最好的办法就是设标志(断点))---发现iOS的动态输出非常强大[动态输出的指令有两个，p和po，与NSLog用法类似，p用于打印输出普通信息，po用于打印输出对象信息。使用动态指令需要与断点配合使用，这样就能够动态的打印输出程序执行到某个断点时的信息。](具体自己百度)
 大概思想就是: 
    1).取出模型类的数组
    2).循环数组
    3).对数组中的releasedAt属性进行转换,(与上一个对象, 下一个对象)对比操作;并用自己定义的属性记录划分(网络重新请求的时候会重新初始化), 在用主要的两个数组(记录不同日期数组, 记录全部组对应行数数组)将划分好的数据返回给控制器的tableView使用
    4). 在具体就是说 用一个下标记录刚开始(i值), i和模型list数组的每一个对象NSDate进行比较, 如果相同, 用sameNumber属性记录相同的个数. 比完了在和主要日期数组的最后一个对象对比日期(如果不一样[用另一个数组rowArr保存这个模型list产生的组,行数], 如果一样[判断是不是0(和上个模型list比较发现一样) 则取出组,行数数组最后一个对象, 删除最后一个对象,再次赋上新值(旧值+sameNumber)转成对象保存, 还有日期数组最后一个也一样要删除掉,否则日期将出现重复]), 最后主日期数组要存日期; for循环外主组,行对象也要在加上rowArr的对象数组.  口语表达有问题具体看我代码看看
    3> 加载更多后tableView表格处理
 0). 遇到的问题, 因为是不同list, 也遇到了无数次的数组越界和crash, 还有tableView数据的重复读(有重复)
    1). 以page+=1, 加载更多. 然后有接收新的模型list, 统一存到modelDatas数组
    2). 这样就能已从modelDates去数据, 就不会出现读数据重复问题
    3). tableView的组数section和行号row , 规律拿出响应的数组下标  , 进而找到对象 -----图-----
 */

// 时间戳默认*1000  要除回来
#define kBIT 1000
@interface SpecialMoreViewMoel ()
@property (nonatomic,strong) SpecialModel *model;
// 具体天个数
@property (nonatomic,assign) NSInteger dayCount;
// 保存同一天row个数
@property (nonatomic,strong) NSMutableArray *rowArr;
// 记相同数
@property (nonatomic,assign) NSInteger sameNumber;
// 记i增量
@property (nonatomic,assign) NSInteger iNumber;
// 记录加载出来的全部数据(组行数)
@property (nonatomic,strong) NSMutableArray *allDatas;
// 保存时间数组
@property (nonatomic,strong) NSMutableArray *saveDates;
// 保存模型list数组
@property (nonatomic,strong) NSMutableArray *modelArr;
@end

@implementation SpecialMoreViewMoel

#pragma mark - 获取数据方法
- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [MoreCotentNetManager getSpecialForPage:_page completionHandle:^(SpecialModel* responseObject, NSError *error) {
        // 记录模型数组
        [self.modelArr  addObjectsFromArray:responseObject.list];
        // 记录模型
        self.model = responseObject;
        // 各属性初始化
        self.dayCount = 0;
        [self.rowArr removeAllObjects];
        self.sameNumber = 0;
        self.iNumber = 0;
        
        // 获取时间
        [self computationTime];
        completed(error);
    }];
}

- (void)refreshDataCompletionHandle:(void (^)(NSError *))completed {
    // 默认第一次根据page=1加载出来的数据
    _page = 1;
    
    // 清空组行号数组, 日期数组,模型数组
    [_allDatas removeAllObjects];
    [_saveDates removeAllObjects];
    [_modelArr removeAllObjects];
    [self getDataCompletionHandle:completed];
}

- (void)getMoreDataCompletionHandle:(void (^)(NSError *))completed {
    // page+1加载出来的数据作为新值
    _page += 1;
    [self getDataCompletionHandle:completed];
}

#pragma mark - 暴露给外界的接口实现逻辑
// 行数
- (NSInteger)section {
    return self.allDatas.count;
}

/** 通过分组数, 以时间, 获取相应的行数*/
- (NSInteger)rowNumberForSection:(NSInteger)section {
    return [self.allDatas[section] integerValue];
}

- (NSURL *)coverURLForSection:(NSInteger)section row:(NSInteger)row {
    NSString *path  = [self indexForSection:section row:row].coverPathSmall;
    return [NSURL URLWithString:path];
}
- (NSString *)titleForSection:(NSInteger)section row:(NSInteger)row {
    return [self indexForSection:section row:row].title;
}
// 详情
- (NSString *)trackTitleForSection:(NSInteger)section row:(NSInteger)row {
    return [self indexForSection:section row:row].subtitle;
}
/** 几个声音 */
- (NSString *)footNoteForSection:(NSInteger)section row:(NSInteger)row {
    return [self indexForSection:section row:row].footnote;
}

/** 根据分组获取,组头title */
- (NSString *)mainTitleForSection:(NSInteger)section {
    NSDate *date =  self.saveDates[section];
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"YYYY/MM/dd"];
    return [matter stringFromDate:date];
}


/**  根据分组号及行号  获得下标进而返回 一个对象*/
- (SpecialMoreList *)indexForSection:(NSInteger)section row:(NSInteger)row {
    // 累加求值
    NSInteger index = row;  // 记录行号数
    while (section) {
        // 如果组数不为0   则下标=行数+(之前组的所有行数)
        index += [self.allDatas[--section] integerValue];
    }
    return  self.modelArr[index];
}




#pragma mark - 获取时间

/** 以对应的时间分类(分组) 逻辑  -- 时间戳计算时间*/
- (void)computationTime {
    NSArray *arr = self.model.list;
    // 用于记录下标
    NSInteger index = 0;
    for (NSInteger i=0; i<arr.count; i++) {
        // 取出时间,releasedAt因为时间戳多了三位数所以除以1000 宏定义: kBIT 是 1000
        NSDate *oneDate = [NSDate dateWithTimeIntervalSince1970:self.model.list[i].releasedAt/kBIT];
        // 下标不等 (原下标+时间相同个数), 则继续加
       if ( i != index + _iNumber) continue;
        // 记录新下标
        index = i;
        _sameNumber = 0;
        for (NSInteger j=i; j<arr.count; j++) {
            if ([self compareOneDay:oneDate withAnotherDay:[NSDate dateWithTimeIntervalSince1970:self.model.list[j].releasedAt/kBIT]] == 0) {
                // 如果年月日相等 则_sameNumber+1( 一组的行数 )
                _sameNumber +=1;
            }
        }
        // i != 0, 和上一个时间相比, 不同则(分组数)+1
        if ([self compareOneDay:oneDate withAnotherDay:self.saveDates.lastObject]) {
            // rowArr存组对应的行数
            self.rowArr[_dayCount++] = @(_sameNumber);
        } else {
            if (i==0) {
                // 取出最后一个值, 并加上相同个数
                NSInteger number = [self.allDatas.lastObject integerValue] +_sameNumber;
                // 先删除最后一个
                [self.allDatas removeLastObject];
                // 后增加
                [self.allDatas addObject:@(number)];
                // 删除日期最后一个
                [self.saveDates removeLastObject];
            }
        }
        // 记录相同时间个数
        _iNumber = _sameNumber;
        // 保存的日期
        [self.saveDates addObject:oneDate];
        
    }
    // allDatas保存所有组(含行数)数据
    [self.allDatas addObjectsFromArray:[_rowArr copy]];
}

// 比较时间 年月日
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"时间1快了");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"时间1慢了");
        return -1;
    }
    //NSLog(@"两个时间相等");
    return 0;
}

#pragma mark - 有数组必懒加载 创建出空间
- (NSMutableArray *)rowArr {
    if (!_rowArr) {
        _rowArr = [NSMutableArray array];
    }
    return _rowArr;
}

- (NSMutableArray *)allDatas {
    if (!_allDatas) {
        _allDatas = [NSMutableArray array];
    }
    return _allDatas;
}
- (NSMutableArray *)saveDates {
    if (!_saveDates) {
        _saveDates = [NSMutableArray array];
    }
    return _saveDates;
}
- (NSMutableArray *)modelArr {
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}
@end
