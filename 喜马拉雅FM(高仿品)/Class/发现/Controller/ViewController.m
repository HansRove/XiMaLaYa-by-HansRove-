//
//  ViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "ViewController.h"
#import "TitleView.h"
#import "FindPutCell.h"
#import "ContentImageView.h"
#import "DiscoveryCell.h"
#import "SpecialCell.h"
#import "CategorySpecialCell.h"
#import "CategoryCommonCell.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate, ContentImageViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"你那";
    
    
    self.tableView.hidden = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    FindPutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    cell.clickBtn0.image = [UIImage imageNamed:@"btn_01"];
//    cell.clickBtn0.titleLb.text = @"Rovee";
//    cell.clickBtn0.tag = indexPath.row*10 + 0;
//    cell.clickBtn1.image = [UIImage imageNamed:@"btn_01"];
//    cell.clickBtn1.titleLb.text = @"Rovee";
//    cell.clickBtn1.tag = indexPath.row*10 + 1;
    NSURL *url = [NSURL URLWithString:@"http://fdfs.xmcdn.com/group9/M07/1C/8C/wKgDYlV3rd2zGc9PAAAgRAu1VLU052.png"];
//    cell.clickBtn2.titleLb.text = @"Rovee";
//    [cell.clickBtn2 setImageWithURL:url placeholderImage:[UIImage imageNamed:@"btn_01"]];
//    cell.clickBtn2.tag = indexPath.row*10 + 2;
//    cell.detailLb0.text = @"测试文字";
//    cell.detailLb1.text = @"测试文字";
//    cell.detailLb2.text = @"测试文字";
    
//    SpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    [cell.coverIV setImageWithURL:url placeholderImage:[UIImage imageNamed:@"btn_01"]];
//    cell.titleLb.text = @"我是标题";
//    cell.subTitleLb.text = @"我是描述fjdisoah";
//    cell.footNoteLb.text = @"90张专辑";
    
//    CategorySpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSCell"];
//    cell.icon0.image = [UIImage imageNamed:@"小新"];
//    cell.icon1.image = [UIImage imageNamed:@"剪刀"];
//    cell.icon2.image = [UIImage imageNamed:@"剪刀"];
//    cell.icon3.image = [UIImage imageNamed:@"剪刀"];
//    cell.icon4.image = [UIImage imageNamed:@"剪刀"];
    CategoryCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CCCell"];
//    cell.icon1.image = [UIImage imageNamed:@"剪刀"];
//    cell.icon2.image = [UIImage imageNamed:@"剪刀"];
//    cell.categoryLb1.text = @"哈哈哈哈";
//    cell.categoryLb2.text = @"嘿嘿嘿黑";
    cell.btn1.icon.image = [UIImage imageNamed:@"剪刀"];
    cell.btn1.categoryLb.text = @"哈哈哈哈";
    cell.btn2.icon.image = [UIImage imageNamed:@"剪刀"];
    cell.btn2.categoryLb.text = @"哈哈哈哈";
    
    // 200
//    cell.clickBtn2.tag / 10;
//    cell.clickBtn2.tag % 10;
    return cell;
}


- (UITableView *)tableView {

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
//        [_tableView registerClass:[FindPutCell class] forCellReuseIdentifier:@"Cell"];
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[DiscoveryCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[SpecialCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[CategorySpecialCell class] forCellReuseIdentifier:@"CSCell"];
        [_tableView registerClass:[CategoryCommonCell class] forCellReuseIdentifier:@"CCCell"];
//        _tableView.rowHeight = 44;
        
        
    }
    return _tableView;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewAutomaticDimension;
//}

- (void)contentImageViewClick:(NSInteger)tag{
    NSInteger group = tag / 10;
    NSInteger pos = tag % 10;
}



@end
