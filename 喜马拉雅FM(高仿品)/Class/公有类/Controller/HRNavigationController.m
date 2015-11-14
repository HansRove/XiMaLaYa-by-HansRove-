//
//  HRNavigationController.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/9.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "HRNavigationController.h"
#import "HRPlayView.h"

@interface HRNavigationController ()
@property (nonatomic,strong) NSString *imageName;
@end

@implementation HRNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 防止其他ViewController的导航被遮挡, 这个类的主要作用是 PlayView
    self.navigationBarHidden = YES;
    
    
    HRPlayView *playView = [[HRPlayView alloc] initWithBackgroundImageName:self.imageName];
    [self.view addSubview:playView];
    [playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(70);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
