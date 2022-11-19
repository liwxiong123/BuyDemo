//
//  BDTopView.m
//  BuyDemo
//
//  Created by admin on 2022/11/19.
//

#import "BDTopView.h"
#import <Masonry/Masonry.h>
@interface BDTopView()

@property(nonatomic, strong) UIImageView *noteView;
@property(nonatomic, strong) UIImageView *hanberView;
@property(nonatomic, strong) UIImageView *coffeeView;
@property(nonatomic, strong) UIImageView *otherView;

@end

@implementation BDTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:93.0/255.0 blue:121.0/255.0 alpha:1];;
        
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    CGFloat unitWidth = [UIScreen mainScreen].bounds.size.width / 4;
    [self addSubview:self.noteView];
    [self.noteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self);
        make.width.mas_equalTo(@(unitWidth));
    }];
    [self addSubview:self.hanberView];
    [self.hanberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.noteView.mas_right);
        make.width.mas_equalTo(@(unitWidth));
    }];
    
    [self addSubview:self.coffeeView];
    [self.coffeeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(@(unitWidth));
        make.left.mas_equalTo(self.hanberView.mas_right);
    }];
    
    [self addSubview:self.otherView];
    [self.otherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(self);
        make.left.mas_equalTo(self.coffeeView.mas_right);
    }];
}

- (UIImageView *)noteView {
    if (!_noteView) {
        _noteView = [[UIImageView alloc] init];
        _noteView.image = [UIImage imageNamed:@"note"];
        _noteView.contentMode = UIViewContentModeCenter;
    }
    return _noteView;
}

- (UIImageView *)hanberView {
    if (!_hanberView) {
        _hanberView = [[UIImageView alloc] init];
        _hanberView.image = [UIImage imageNamed:@"hanber"];
        _hanberView.contentMode = UIViewContentModeCenter;
    }
    return _hanberView;
}

- (UIImageView *)coffeeView {
    if (!_coffeeView) {
        _coffeeView = [[UIImageView alloc] init];
        _coffeeView.image = [UIImage imageNamed:@"cup"];
        _coffeeView.contentMode = UIViewContentModeCenter;
    }
    return _coffeeView;
}

- (UIImageView *)otherView {
    if (!_otherView) {
        _otherView = [[UIImageView alloc] init];
        _otherView.contentMode = UIViewContentModeCenter;
        _otherView.image = [UIImage imageNamed:@"snap"];
    }
    return _otherView;
}

@end
