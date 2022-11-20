//
//  BDBottomView.h
//  BuyDemo
//
//  Created by admin on 2022/11/19.
//

#import <UIKit/UIKit.h>
#import "BDModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BDBottomView : UIView

- (void)refreshWithPrice:(BDModel *)model;
@end

NS_ASSUME_NONNULL_END
