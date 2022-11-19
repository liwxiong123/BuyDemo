//
//  BDBottomView.m
//  BuyDemo
//
//  Created by admin on 2022/11/19.
//

#import "BDBottomView.h"
#import <Masonry/Masonry.h>
@interface  BDBottomView()

@property(nonatomic, strong) UILabel *sumLabel;
@property(nonatomic, strong) UIButton *payBtn;
@end

@implementation BDBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self addSubview:self.sumLabel];
    [self.sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.width.mas_equalTo(@126);
        make.height.mas_equalTo(@37);
        make.top.mas_equalTo(self.mas_top).offset(21);
    }];
    [self addSubview:self.payBtn];
    [self.payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right);
        make.width.mas_equalTo(@143);
        make.height.mas_equalTo(@65);
        make.top.mas_equalTo(self.mas_top);
    }];
//    [self.sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.mas_
//
//    }];
}

#pragma mark -- init
- (UILabel *)sumLabel {
    if (!_sumLabel) {
        _sumLabel = [[UILabel alloc] init];
        _sumLabel.textAlignment = NSTextAlignmentLeft;
        _sumLabel.font = [UIFont boldSystemFontOfSize:43.0f];
        _sumLabel.textColor = [UIColor colorWithRed:79.0/255.0 green:79.0/255.0 blue:79.0/255.0 alpha:1];
        _sumLabel.text = @"13$";
    }
    
    return _sumLabel;
}

- (UIButton *)payBtn {
    if (!_payBtn) {
        _payBtn = [[UIButton alloc] init];
        _payBtn.titleLabel.font = [UIFont boldSystemFontOfSize:32.0f];
        [_payBtn setTitle:@"Pay" forState:UIControlStateNormal];
        [_payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _payBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:93/255.0 blue:121/255.0 alpha:1];
    }
    return _payBtn;
}

@end
