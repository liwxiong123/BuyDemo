//
//  BDLocationView.m
//  BuyDemo
//
//  Created by admin on 2022/11/20.
//

#import "BDLocationView.h"
#import <Masonry/Masonry.h>
@interface  BDLocationView()

@property(nonatomic, strong) UIImageView *imgView;
@property(nonatomic, strong) UILabel *detailLabel;
@property(nonatomic, strong) UIButton *phoneBtn;
@end

@implementation BDLocationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@20);
        make.width.mas_equalTo(@25);
        make.height.mas_equalTo(@33);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-28);
    }];
    [self addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(17);
        make.centerY.mas_equalTo(self.imgView.mas_centerY);
        make.width.mas_equalTo(@228);
    }];
    
    [self addSubview:self.phoneBtn];
    [self.phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imgView.mas_centerY);
        make.width.and.height.mas_equalTo(@32);
        make.right.mas_equalTo(self.mas_right).offset(-32);
    }];
}


- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.image = [UIImage imageNamed:@"map"];
    }
    
    return _imgView;
}
//TODO 使用苹果的MapView实现实时定位
- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.backgroundColor = [UIColor clearColor];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.numberOfLines = 0;
        _detailLabel.font = [UIFont boldSystemFontOfSize:14.0f];
        _detailLabel.textColor = [UIColor colorWithRed:96.0/255.0 green:96.0/255.0 blue:96.0/255.0 alpha:1];
        _detailLabel.text = @"Dongcheng District Metro Cultural Building";
    }
    
    return _detailLabel;
}


- (UIButton *)phoneBtn {
    if (!_phoneBtn) {
        _phoneBtn = [[UIButton alloc] init];
        [_phoneBtn setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];

    }
    return _phoneBtn;
}///


@end
