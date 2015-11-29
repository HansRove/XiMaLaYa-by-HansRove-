//
//  TracksCell.m
//  喜马拉雅FM(高仿品)
//
//  Created by apple-jd33 on 15/11/26.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "TracksCell.h"

@interface TracksCell ()
// 下载按钮
@property (nonatomic,strong) UIButton *downloadBtn;

// 一个视图, 方便对齐
@property (nonatomic,strong) UIImageView *alignmentView;
@end

@implementation TracksCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 私有要初始化 方便调用懒加载
        [self.downloadBtn setImage:[UIImage imageNamed:@"btn_srdownloaded"] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark  - 各懒加载
- (UILabel *)title {
    if (!_title) {
        _title = [UILabel new];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.width.mas_lessThanOrEqualTo(280);
        }];
    }
    _title.font = [UIFont systemFontOfSize:14];
    _title.numberOfLines = 2;
    return _title;
}
- (UILabel *)updateTime {
    if (!_updateTime) {
        _updateTime = [UILabel new];
        [self.contentView addSubview:_updateTime];
        [_updateTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_lessThanOrEqualTo(80);
        }];
        _updateTime.textColor = [UIColor lightGrayColor];
        _updateTime.textAlignment = NSTextAlignmentRight;
        _updateTime.font = [UIFont systemFontOfSize:12];
    }
    return _updateTime;
}
- (UILabel *)playsCount {
    if (!_playsCount) {
        _playsCount = [UILabel new];
        [self.contentView addSubview:_playsCount];
        
        // 增加一个小播放图
        _alignmentView = [UIImageView new];
        [self.contentView addSubview:_alignmentView];
        [_alignmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.title.mas_bottom).mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
        _alignmentView.image = [UIImage imageNamed:@"sound_playtimes"];
        
        [_playsCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_alignmentView);
            make.left.mas_equalTo(_alignmentView.mas_right).mas_equalTo(5);
//            make.width.mas_lessThanOrEqualTo(40);
        }];
        _playsCount.textColor = [UIColor lightGrayColor];
        _playsCount.font = [UIFont systemFontOfSize:11];
    }
    return _playsCount;
}
- (UILabel *)playTime {
    if (!_playTime) {
        _playTime = [UILabel new];
        [self.contentView addSubview:_playTime];
        // 增加一个小播放时间图
        UIImageView *imgView = [UIImageView new];
        [self.contentView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playsCount.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.alignmentView);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
        imgView.image = [UIImage imageNamed:@"sound_duration"];
        
        [_playTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imgView);
            make.left.mas_equalTo(imgView.mas_right).mas_equalTo(5);
//            make.width.mas_lessThanOrEqualTo(50);
        }];
        _playTime.textColor = [UIColor lightGrayColor];
        _playTime.font = [UIFont systemFontOfSize:11];
    }
    return _playTime;
}
- (UILabel *)commentCount {
    if (!_commentCount) {
        _commentCount = [UILabel new];
        
        // 增加一个小评论图
        UIImageView *imgView = [UIImageView new];
        [self.contentView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playTime.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.alignmentView);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
        imgView.image = [UIImage imageNamed:@"sound_comments"];
        
        [self.contentView addSubview:_commentCount];
        [_commentCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imgView);
            make.left.mas_equalTo(imgView.mas_right).mas_equalTo(5);
//            make.width.mas_lessThanOrEqualTo(40);
        }];
        _commentCount.textColor = [UIColor lightGrayColor];
        _commentCount.font = [UIFont systemFontOfSize:11];
    }
    return _commentCount;
}


// 私有的下载按钮
- (UIButton *)downloadBtn {
    if (!_downloadBtn) {
        _downloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_downloadBtn];
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.updateTime).mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _downloadBtn;
}

@end
