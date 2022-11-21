//
//  BDPlateView.m
//  BuyDemo
//
//  Created by admin on 2022/11/20.
//

#import "BDPlateView.h"
#import <Masonry/Masonry.h>
@interface BDPlateView()

@property(nonatomic, strong) UIImageView *backgroudView;
@property(nonatomic, strong) UIImageView *hanberView;
@property(nonatomic, strong) UIImageView *coffeeView;
@property(nonatomic, strong) UIImageView *snapView;

@end
@implementation BDPlateView

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
    [self addSubview:self.backgroudView];
    [self.backgroudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@256);
        make.height.mas_equalTo(@97);
        make.top.mas_equalTo(self.mas_top).offset(14);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [self addSubview:self.coffeeView];
    [self.coffeeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(@128);
        make.centerY.mas_equalTo(self.mas_top).offset(-5);
        make.centerX.mas_equalTo(self.backgroudView.mas_centerX).offset(10);
    }];
    
    [self addSubview:self.hanberView];
    [self.hanberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@110);
        make.height.mas_equalTo(@110);
        make.centerX.mas_equalTo(self.backgroudView.mas_centerX).offset(-40);
        make.centerY.mas_equalTo(self.backgroudView.mas_centerY);
    }];
    
    [self addSubview:self.snapView];
    [self.snapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@94);
        make.height.mas_equalTo(@94);
        make.centerX.mas_equalTo(self.backgroudView.mas_centerX).offset(40);
        make.centerY.mas_equalTo(self.backgroudView.mas_centerY).offset(-20);
    }];

    
}

-(BOOL)refreshWithIndex:(NSInteger)index {
    //0 hanber 1:coffee 2:snap
    if (index == 0 && self.hanberView.hidden == YES) {
        self.hanberView.hidden = NO;
        return YES;
    } else if(index == 1 && self.coffeeView.hidden == YES) {
        self.coffeeView.hidden = NO;
        return YES;
    } else if(index == 2 && self.snapView.hidden == YES) {
        self.snapView.hidden = NO;
        return YES;
    }
    return NO;
}

- (UIImageView *)backgroudView {
    if (!_backgroudView) {
        _backgroudView = [[UIImageView alloc] init];
        _backgroudView.image = [UIImage imageNamed:@"plate"];
        
    }
    
    return _backgroudView;
}

- (UIImageView *)coffeeView {
    if (!_coffeeView) {
        _coffeeView = [[UIImageView alloc] init];
        _coffeeView.hidden = YES;
        _coffeeView.image = [UIImage imageNamed:@"coffee_small"];
    }
    return _coffeeView;
}

- (UIImageView *)hanberView {
    if (!_hanberView) {
        _hanberView = [[UIImageView alloc] init];
        _hanberView.hidden = YES;
        _hanberView.image = [UIImage imageNamed:@"hanber_small"];
    }
    return _hanberView;
}

- (UIImageView *)snapView {
    if (!_snapView) {
        _snapView = [[UIImageView alloc] init];
        _snapView.hidden = YES;
        _snapView.image = [UIImage imageNamed:@"shutiao_small"];
    }
    return _snapView;
}

@end
