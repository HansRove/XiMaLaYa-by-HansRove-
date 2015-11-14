//
//  ViewController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "ViewController.h"
#import "TitleView.h"
#import "ContentButton.h"
#import "FindPutCell.h"
#import "ContentImageView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate, ContentImageViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"你那";
    
    ContentButton *_clickBtn0 = [ContentButton new];
//    _clickBtn0.backgroundColor = [UIColor redColor];
    [_clickBtn0 setBackgroundImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];
    _clickBtn0.backgroundColor = [UIColor clearColor];
    _clickBtn0.titleLb.text = @"测试";
//    [_clickBtn0 setTitle:@"我的" forState:UIControlStateNormal];
    [self.view addSubview:_clickBtn0];
    [_clickBtn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(100 , 100));
    }];
    
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
    FindPutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.clickBtn0.image = [UIImage imageNamed:@"btn_01"];
    cell.clickBtn0.titleLb.text = @"Rovee";
    cell.clickBtn0.tag = indexPath.row*10 + 0;
    cell.clickBtn1.image = [UIImage imageNamed:@"btn_01"];
    cell.clickBtn1.titleLb.text = @"Rovee";
    cell.clickBtn1.tag = indexPath.row*10 + 1;
    NSURL *url = [NSURL URLWithString:@"http://fdfs.xmcdn.com/group11/M01/99/5E/wKgDbVYt4lagZj55AADuaE7uRnI349_mobile_large.jpg"];
    cell.clickBtn2.titleLb.text = @"Rovee";
    [cell.clickBtn2 setImageWithURL:url placeholderImage:[UIImage imageNamed:@"btn_01"]];
    cell.clickBtn2.tag = indexPath.row*10 + 2;
    cell.detailLb0.text = @"测试文字";
    cell.detailLb1.text = @"测试文字";
    cell.detailLb2.text = @"测试文字";
    
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
        [_tableView registerClass:[FindPutCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.rowHeight = 200;
    }
    return _tableView;
}

- (void)contentImageViewClick:(NSInteger)tag{
    NSInteger group = tag / 10;
    NSInteger pos = tag % 10;
}

@end
