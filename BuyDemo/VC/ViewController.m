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
#import "BDLocationView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "BDModel.h"
#import "BDAnimateView.h"
//TODO 待补充动画效果
@interface ViewController ()<SDCycleScrollViewDelegate>
@property(nonatomic, strong) SDCycleScrollView *cycleView;
@property(nonatomic, strong) UIButton *addBtn;
@property(nonatomic, assign) NSInteger currentIndex;
@property(nonatomic, assign) NSInteger totalPrice;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentIndex = 0;
    self.totalPrice = 0;
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
   
    [self.view addSubview:self.locationView];
    [self.locationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.bottomView.mas_top);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@60);
    }];
    
    [self.view addSubview:self.plateView];
    [self.plateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.locationView.mas_top);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@245);
    }];
     NSArray *imgArray = @[
                          [UIImage imageNamed:@"hanber_large"],
                          [UIImage imageNamed:@"coffee_large"],
                          [UIImage imageNamed:@"potato_large"]
     
     ];
    NSArray *titleArray = @[
        @"FRIES 4$",
        @"LATTE 3$",
        @"BURGER 6$"
    ];
     // 本地加载图片的轮播器
    self.cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 320) imageNamesGroup:imgArray];
    self.cycleView.titlesGroup = titleArray;
    self.cycleView.titleLabelBackgroundColor = [UIColor clearColor];
    self.cycleView.backgroundColor = [UIColor clearColor];
    self.cycleView.titleLabelTextFont = [UIFont systemFontOfSize:32];
    self.cycleView.titleLabelTextColor = [UIColor colorWithRed:235.0/255.0 green:92.0/255.0 blue:119.0/255.0 alpha:1];
    self.cycleView.delegate = self;
//    [self.cycleView autoScroll];
    self.cycleView.autoScroll = false;
    self.cycleView.infiniteLoop = NO;
    [self.view addSubview:self.cycleView];
    [self.cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.plateView.mas_top);
        make.top.mas_equalTo(self.topView.mas_bottom);
    }];
    
    [self.view addSubview:self.addBtn];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(@100);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.cycleView.mas_bottom).offset(-39);
    }];
    
    [self.view addSubview:self.animateView];
    CGFloat topOffset = 0;
    if (@available(iOS 11.0, *)) {
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        topOffset = window.safeAreaInsets.top;
    }
    self.animateView.frame = CGRectMake( 50,65 + topOffset + 50, 170, 170);
}

- (void)onAddFood {

    if (self.currentIndex == 0) {
        self.totalPrice += 4;
    } else if(self.currentIndex == 1) {
        self.totalPrice += 3;
    } else {
        self.totalPrice += 6;
    }
    BOOL needAdded = [self.plateView refreshWithIndex:self.currentIndex];
    if (needAdded) {
        BDModel *model = [[BDModel alloc] init];
        model.price = self.totalPrice;
        [self.bottomView refreshWithPrice:model];
    }

}

#pragma mark -- delegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    self.currentIndex = index;
//    NSLog(@"cycleOffset x:%d, y:%d",cycleScrollView.frame.origin.x,cycleScrollView.frame.origin.y);
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    self.currentIndex = index;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView scrollViewDidScroll:(CGFloat)ratio {
    [self.animateView refreshLocation:ratio];
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

- (BDLocationView *)locationView {
    if (!_locationView) {
        _locationView = [[BDLocationView alloc] init];
    }
    return _locationView;
}

- (BDPlateView *)plateView {
    if (!_plateView) {
        _plateView = [[BDPlateView alloc] init];
    }
    return  _plateView;
}

- (BDAnimateView *)animateView {
    if (!_animateView) {
        _animateView = [[BDAnimateView alloc] initWithFrame:CGRectMake(50, 50, 170, 170)];
    }
    return  _animateView;
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [[UIButton alloc] init];
        [_addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(onAddFood) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _addBtn;
}

@end
