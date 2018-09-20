//
//  YXAlertView.m
//  testCocoaPods
//
//  Created by SRT on 2018/9/20.
//  Copyright © 2018年 SRT. All rights reserved.
//

#import "YXAlertView.h"

@interface YXAlertView()

@property (nonatomic, strong) UIButton *confirm;

@property (nonatomic, copy) void (^confirmBlock)(void);

@end

@implementation YXAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 6.0;
    self.confirm = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.confirm setTitle:@"确定" forState:0];
    [self.confirm addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    self.confirm.frame = CGRectMake(20, 20, 100, 40);
    self.confirm.center = self.center;
    [self addSubview:self.confirm];

}

+ (void)showAlertViewInSubView:(UIView *)subview andClickConfirm:(void(^)(void))confirm {

    NSEnumerator *subViewsEnum = [subview.subviews reverseObjectEnumerator];
    for (UIView *view in subViewsEnum) {
        if ([view isKindOfClass:[YXAlertView class]]) {
            return;
        }
    }
    CGFloat width = CGRectGetWidth(subview.frame) * 0.6;
    YXAlertView *alert = [[YXAlertView alloc]initWithFrame:CGRectMake(0, 0, width, width * 0.4)];
    alert.center = subview.center;
    alert.confirmBlock = confirm;
    [subview addSubview:alert];
}


- (void)confirmAction:(UIButton *)sender {
    [self removeFromSuperview];
    if (self.confirmBlock) {
        self.confirmBlock();
    }
}

@end
