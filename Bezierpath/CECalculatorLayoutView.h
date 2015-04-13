//
//  CECalculatorLayoutView.h
//  CRM-HD
//
//  Created by Newtouch on 15/2/6.
//  Copyright (c) 2015年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "Masonry.h"

@interface CECalculatorLayoutView : BaseView<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *investmentAmountLabel;
@property (nonatomic, strong) UITextField *investmentAmountField;
@property (nonatomic, strong) UILabel *rmbLabel;

@property (nonatomic, strong) UILabel *investmentTimeLabel;
@property (nonatomic, strong) UITextField *investmentTimeField;
@property (nonatomic, strong) UILabel *monthLabel;

@property (nonatomic, strong) UILabel *investmentIncomeLabel;
@property (nonatomic, strong) UITextField *annualIncomeField;
@property (nonatomic, strong) UILabel *unitLabel;

@property (nonatomic, strong) UIButton *calculatorButton;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic,retain)UIView *showInView;
+(CECalculatorLayoutView *)showCalculatorInView:(UIView *)view;
-(void)realshowInview:(UIView *)view;

@end
