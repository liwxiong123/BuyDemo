//
//  BDAnimateView.m
//  BuyDemo
//
//  Created by admin on 2022/11/21.
//

#import "BDAnimateView.h"

@interface BDAnimateView()

@property(nonatomic, strong) UIImageView *leftView;
@property(nonatomic, strong) UIImageView *rightView;
@property(nonatomic, strong) UIImageView *topView;

@end

@implementation BDAnimateView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self initSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
          
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self addSubview:self.leftView];
    [self addSubview:self.rightView];
    [self addSubview:self.topView];
    [self resetLocation];
}

- (void)resetLocation {
    self.leftView.frame = CGRectMake(0, 0, 22.5, 25.5);
    _rightView.frame = CGRectMake(2 * self.frame.size.width / 3, self.frame.size.height, 16.5, 19.5);
    _topView.frame = CGRectMake( 0,  self.frame.size.height, 37.5, 40.5);
    
}




- (void)refreshLocation:(CGFloat)ratio {
    
    //target
    self.leftView.frame = CGRectMake(0, self.frame.size.height * ratio, 22.5, 25.5);
    CGFloat rightWidth = 2 * self.frame.size.width / 3 + self.frame.size.width / 3 * ratio;
    CGFloat rightHeight = self.frame.size.height - self.frame.size.height / 5 * ratio;
//    _rightView.frame = CGRectMake(self.frame.size.width, self.frame.size.height * 4 / 5, 16.5, 19.5);
    _rightView.frame = CGRectMake(rightWidth, rightHeight, 16.5, 19.5);
    
    CGFloat topWidth = 7 * self.frame.size.width / 8 * ratio;
    CGFloat topHeight = self.frame.size.height - 2 * self.frame.size.height / 3 * ratio;
    _topView.frame = CGRectMake( topWidth, topHeight, 37.5, 40.5);
//    _topView.frame = CGRectMake( 7 * self.frame.size.width / 8, 1 * self.frame.size.height / 3, 37.5, 40.5);
}


- (UIImageView *)leftView {
    if (!_leftView) {
        _leftView = [[UIImageView alloc] init];
        _leftView.hidden = NO;
        _leftView.image = [UIImage imageNamed:@"leftStar"];
        _leftView.frame = CGRectMake(0, 0, 22.5, 25.5);
    }
    return _leftView;
}

- (UIImageView *)rightView {
    if (!_rightView) {
        _rightView = [[UIImageView alloc] init];
        _rightView.hidden = NO;
        _rightView.image = [UIImage imageNamed:@"rightStar"];
        _rightView.frame = CGRectMake(0, 0, 16.5, 19.5);
    }
    return _rightView;
}

- (UIImageView *)topView {
    if (!_topView) {
        _topView = [[UIImageView alloc] init];
        _topView.hidden = NO;
        _topView.image = [UIImage imageNamed:@"topStar"];
        _topView.frame = CGRectMake(0, 0, 37.5, 40.5);
    }
    return _topView;
}


@end
