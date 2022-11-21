//
//  ViewController.h
//  BuyDemo
//
//  Created by admin on 2022/11/19.
//

#import <UIKit/UIKit.h>
#import "BDBottomView.h"
#import "BDTopView.h"
#import "BDLocationView.h"
#import "BDPlateView.h"
#import "BDAnimateView.h"
@interface ViewController : UIViewController

@property (nonatomic, strong) BDBottomView *bottomView;
@property (nonatomic, strong) BDTopView *topView;
@property (nonatomic, strong) BDLocationView *locationView;
@property (nonatomic, strong) BDPlateView *plateView;
@property (nonatomic, strong) BDAnimateView *animateView;
@end

