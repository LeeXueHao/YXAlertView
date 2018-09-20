//
//  YXAlertView.h
//  testCocoaPods
//
//  Created by SRT on 2018/9/20.
//  Copyright © 2018年 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXAlertView : UIView

+ (void)showAlertViewInSubView:(UIView *)subview andClickConfirm:(void(^)(void))confirm;


@end

NS_ASSUME_NONNULL_END
