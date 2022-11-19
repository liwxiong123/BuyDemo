//
//  ViewController.m
//  BuyDemo
//
//  Created by admin on 2022/11/19.
//

#import "ViewController.h"
#import "BDBottomView.h"
#import <Masonry/Masonry.h>
#import "BDTopView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if (@available(iOS 11.0, *)) {
//        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
//        CGFloat topPadding = window.safeAreaInsets.top;
//        CGFloat bottomPadding = window.safeAreaInsets.bottom;
//    }
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1];
    
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@65);
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
            CGFloat topPadding = window.safeAreaInsets.top;
            make.top.mas_equalTo(self.view.mas_top).offset(topPadding);
        }
        
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@65);
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
            CGFloat bottomPadding = window.safeAreaInsets.bottom;
            make.bottom.mas_equalTo(self.view.mas_bottom).offset(-bottomPadding);
        }
        
    }];
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    [self.view insertSubview:backView belowSubview:self.bottomView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.bottomView);
        make.bottom.mas_equalTo(self.view);
    }];
    // Do any additional setup after loading the view.
}

- (BDBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[BDBottomView alloc] init];
    }
    return _bottomView;
}

- (BDTopView *)topView {
    if (!_topView) {
        _topView = [[BDTopView alloc] init];
    }
    return _topView;
}

@end
