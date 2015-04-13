//
//  CECalculatorLayoutView.m
//  CRM-HD
//
//  Created by Newtouch on 15/2/6.
//  Copyright (c) 2015年 creditease. All rights reserved.
//

#import "CECalculatorLayoutView.h"
#import "UIColor+expanded.h"

#define AllFont ([UIFont systemFontOfSize:15])
#define AllTextColor [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
#define TopMenuSelectedColor [UIColor colorWithRed:186/255.0 green:137/255.0 blue:37/255.0 alpha:1]
@implementation CECalculatorLayoutView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:20/250.f green:20/250.f blue:20/250.f alpha:0.4];
        
        
    }
    return self;
}


-(void)createUIInView:(UIView *)view
{
#define TEXTFIELDSET(a) a.clearButtonMode = UITextFieldViewModeWhileEditing
    
//    menu.financial.calculator = "理财计算";
    CGFloat offx = 10;
    CGFloat offy = 68;
    UILabel *topLabel = [[UILabel alloc] init];
    topLabel.text = NSLocalizedString(@"menu.financial.calculator", @"理财计算");
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.font = [UIFont systemFontOfSize:38];
    topLabel.textColor = AllTextColor;
    [view addSubview:topLabel];
//    self.investmentAmountLabel = topLabel;
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.greaterThanOrEqualTo(@70);
        make.top.equalTo(view).offset(12);
        make.left.equalTo(view).offset(200);
    }];
    UILabel *amountLabel = [[UILabel alloc] init];
    amountLabel.text = NSLocalizedString(@"financial.calculator.amount", @"投资金额");
    amountLabel.textAlignment = NSTextAlignmentRight;
    [view addSubview:amountLabel];
    self.investmentAmountLabel = amountLabel;
    
    [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(30+offy);
        make.left.equalTo(view).offset(36+offx);
        make.width.greaterThanOrEqualTo(@50);
        make.height.greaterThanOrEqualTo(@40);

    }];
    
    /**
     投资金额textField
     */
    UITextField *amountField = [[UITextField alloc] init];
    amountField.borderStyle = UITextBorderStyleNone;
    [view addSubview:amountField];
    [amountField setBackground:[[UIImage imageNamed:@"calinput"] stretchableImageWithLeftCapWidth:5 topCapHeight:5]];
    amountField.keyboardType = UIKeyboardTypeNumberPad;
    amountField.clearButtonMode = UITextFieldViewModeWhileEditing;
    TEXTFIELDSET(amountField);
    amountField.delegate = self;
    self.investmentAmountField = amountField;
    

    [amountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(30+offy);
        make.left.equalTo(view).offset(116+offx);
        make.width.greaterThanOrEqualTo(@300);
        make.height.greaterThanOrEqualTo(@40);
        
    }];
    /**
     投资金额label
     */
    UILabel *rmbLabel = [[UILabel alloc] init];
    rmbLabel.text = NSLocalizedString(@"financial.calculator.rmb", @"元");
    [self addSubview:rmbLabel];
    self.rmbLabel = rmbLabel;
    [rmbLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(30+offy);
        make.left.equalTo(amountField).offset(316);
        make.width.greaterThanOrEqualTo(@20);
        make.height.greaterThanOrEqualTo(@40);
        
    }];
    /**
     投资时间label
     */
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = NSLocalizedString(@"financial.calculator.time", @"投资时间");
    timeLabel.textAlignment = NSTextAlignmentRight;
    [view addSubview:timeLabel];
    self.investmentTimeLabel = timeLabel;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(amountLabel).offset(offy);
        make.left.equalTo(view).offset(36+offx);
        make.width.greaterThanOrEqualTo(@50);
        make.height.greaterThanOrEqualTo(@40);
        
    }];

    /**
     投资时间textField
     */
    UITextField *timeField = [[UITextField alloc] init];
    timeField.borderStyle = UITextBorderStyleNone;
    [view addSubview:timeField];
    TEXTFIELDSET(timeField);

    self.investmentTimeField = timeField;
    [timeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(amountLabel).offset(offy);
        make.left.equalTo(view).offset(116+offx);
        make.width.greaterThanOrEqualTo(@300);
        make.height.greaterThanOrEqualTo(@40);
        
    }];
    timeField.keyboardType = UIKeyboardTypeNumberPad;
    timeField.delegate = self;
    [timeField setBackground:[[UIImage imageNamed:@"calinput"] stretchableImageWithLeftCapWidth:5 topCapHeight:5]];

    //        self.timeField = timeField;
    
    /**
     投资时间单位label -》》 按月
     */
    UILabel *monthLabel = [[UILabel alloc] init];
    monthLabel.text = NSLocalizedString(@"financial.calculator.month", @"月");
    [view addSubview:monthLabel];
    self.monthLabel = monthLabel;
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(amountLabel).offset(offy);
        make.left.equalTo(amountField).offset(316);
        make.width.greaterThanOrEqualTo(@20);
        make.height.greaterThanOrEqualTo(@40);
        
    }];
    /**
     年华收益label
     */
    UILabel *incomeLabel = [[UILabel alloc] init];
    incomeLabel.text = NSLocalizedString(@"financial.calculator.yearOfIncome", @"年华收益");
    incomeLabel.textAlignment = NSTextAlignmentRight;
    [view addSubview:incomeLabel];
    self.investmentIncomeLabel = incomeLabel;
    [incomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeLabel).offset(offy);
        make.left.equalTo(view).offset(36+offx);
        make.width.greaterThanOrEqualTo(@50);
        make.height.greaterThanOrEqualTo(@40);
        
    }];
    /**
     年化收益textField
     */
    UITextField *incomeField = [[UITextField alloc] init];
    incomeField.borderStyle = UITextBorderStyleNone;
    [view addSubview:incomeField];
    TEXTFIELDSET(incomeField);

    self.annualIncomeField = incomeField;
    [incomeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeLabel).offset(offy);
        make.left.equalTo(view).offset(116+offx);
        make.width.greaterThanOrEqualTo(@100);
        make.height.greaterThanOrEqualTo(@40);
        
    }];
    incomeField.keyboardType = UIKeyboardTypeNumberPad;

    incomeField.delegate = self;
    [incomeField setBackground:[[UIImage imageNamed:@"calinput"] stretchableImageWithLeftCapWidth:5 topCapHeight:5]];
    //        self.timeField = timeField;
    
    /**
     投资金额label
     */
    UILabel *unitLabel = [[UILabel alloc] init];
    unitLabel.text = @"%";
    [self addSubview:unitLabel];
    self.unitLabel = unitLabel;
    [unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeLabel).offset(offy);
        make.left.equalTo(amountField).offset(116);
        make.width.greaterThanOrEqualTo(@20);
        make.height.greaterThanOrEqualTo(@40);
        
    }];
    /**
    /**
     *  计算 button
     */
    UIButton *calculatorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [calculatorBtn setTitle:NSLocalizedString(@"financial.calculator.calculator", @"计算") forState:UIControlStateNormal];
//    [calculatorBtn setBackgroundColor:[UIColor grayColor]];
    [calculatorBtn setBackgroundImage:[[UIImage imageNamed:@"calbutton"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:0];
    [calculatorBtn setTitleColor:[UIColor colorWithRGBHex:0x714a19] forState:0];
    [calculatorBtn addTarget:self action:@selector(calculateAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:calculatorBtn];
    [calculatorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(unitLabel).offset(offy);
        make.left.equalTo(view).offset(130);
        make.width.greaterThanOrEqualTo(@310);
        make.height.greaterThanOrEqualTo(@42);
        
    }];
    self.calculatorButton = calculatorBtn;
    

}
-(void)calculateAction:(UIButton *)sender
{

    UIView *calculatorBackView = (UIView *)[self viewWithTag:10010];
    UIImageView *imgview0 = (UIImageView *)[calculatorBackView viewWithTag:10011];
    [imgview0 removeFromSuperview];
    UIImageView *imgview = [[UIImageView alloc]init];
    imgview.tag = 10011;
    [calculatorBackView addSubview:imgview];
    imgview.image = [[UIImage imageNamed:@"calresult"] stretchableImageWithLeftCapWidth:15 topCapHeight:75];
[imgview mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.calculatorButton).offset(72);
    make.left.equalTo(calculatorBackView).offset(115);
    make.width.greaterThanOrEqualTo(@340);
    make.height.greaterThanOrEqualTo(@260); 
    
    CGFloat offImgx = 10;
    CGFloat labelHei = 30;
    for (int i=0; i<4; i++) {
        UILabel *label = [[UILabel alloc]init];
        [imgview addSubview:label];
        if((i==0)||(i==2)){
        
            label.text = (i==0)?(NSLocalizedString(@"financial.calculator.expectedamountofrevenue", @"预期收益金额")):(NSLocalizedString(@"financial.calculator.totalprincipalandinterest", @"本息总计"));
            label.textColor = AllTextColor;
        }
        else{
            label.textColor = (i==1)?[UIColor colorWithRGBHex:0xac783a]:[UIColor colorWithRGBHex:0xc2a47d];
        label.text = (i==1)? @"222233,00":@"9090909,00";
        
        }
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:25];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imgview).offset(50+(offImgx+labelHei)*i);
            make.left.equalTo(imgview).offset(10);
            make.width.equalTo(@320);
            make.height.equalTo(@(labelHei));
        }];
    }
    
    
    
    
    
}];



}
-(void)dismissMe{
    UIView *calculatorBackView = (UIView *)[self viewWithTag:10010];
//    CGRect rect0 = calculatorBackView.frame;
    
    CGFloat bhei = CGRectGetHeight(calculatorBackView.frame);

    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = calculatorBackView.frame;
        rect.origin.x+=100;
        calculatorBackView.frame = rect;
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        if (finished) {
            CGRect rect = calculatorBackView.frame;
            rect.origin.x-=100;
            calculatorBackView.frame = rect;
//            [self removeFromSuperview];
  
        }
    }];

    
}
+(CECalculatorLayoutView *)showCalculatorInView:(UIView *)view
{
    CECalculatorLayoutView *calculaView = [[CECalculatorLayoutView alloc]init];
    calculaView.userInteractionEnabled = YES;
    
    calculaView.showInView = view;
    //创建背景覆盖图
    UIView *backView = [[UIView alloc]init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:calculaView action:@selector(dismissMe)];
    tap.numberOfTapsRequired = 1;
    backView.userInteractionEnabled = YES;
    [backView addGestureRecognizer:tap];
   
    [view addSubview:calculaView];
    [calculaView addSubview:backView];
    backView.backgroundColor = [UIColor colorWithRed:20/250.f green:20/250.f blue:20/250.f alpha:0.4];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(0);
        make.left.equalTo(view).offset(0);
        make.width.equalTo(view);
        make.height.equalTo(view);
    }];
    [calculaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(0);
        make.left.equalTo(view).offset(0);
        make.width.equalTo(view);
        make.height.equalTo(view);
    }];
    //创建白色背景图
    UIView *calculatorBackView = [[UIView alloc]init];
    calculatorBackView.userInteractionEnabled = YES;
    calculatorBackView.backgroundColor = [UIColor whiteColor];
    [calculaView addSubview:calculatorBackView];
    UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc]initWithTarget:calculaView action:@selector(dismissMe)];
    swipeGes.direction = UISwipeGestureRecognizerDirectionRight;
    [calculatorBackView addGestureRecognizer:swipeGes];

    calculatorBackView.alpha = 0;
    calculatorBackView.tag = 10010;
    [calculatorBackView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(view).offset(0);
      make.right.equalTo(view).offset(0);
      make.bottom.equalTo(view).offset(0);
      make.width.equalTo(@100);
 
    }];

//    rect.origin.x+=100;
    calculaView.alpha = 0;
    return calculaView;
    }
-(void)realshowInview:(UIView *)view{
    UIView *calculatorBackView = (UIView *)[self viewWithTag:10010];
    CGFloat boffx = CGRectGetMaxX(calculatorBackView.frame);
    CGFloat bhei = CGRectGetHeight(calculatorBackView.frame);
    NSLog(@"boffx and bhei is (%f,%f)",boffx,bhei);
  CGFloat aa =  [UIScreen mainScreen].bounds.size.width;
    NSLog(@"screen.width is %f",aa);
    calculatorBackView.frame = CGRectMake(boffx+100, 0, 100, bhei);

    [UIView animateWithDuration:1 animations:^{
        calculatorBackView.alpha = 1;
        self.alpha = 1;
        calculatorBackView.frame = CGRectMake(boffx-100, 0, 100, bhei);
        [calculatorBackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view).offset(0);
        }];

        
    }completion:^(BOOL finished) {
        if (finished) {
            
            [self createUIInView:calculatorBackView];
                   }
    }];


}

-(void)layoutSubviews
{
    [super layoutSubviews];

//    CGRect rect0 = calculatorBackView.frame;
//    NSLog(@"rect is (%f,%f,%f,%f)",calculatorBackView.frame.origin.x,calculatorBackView.frame.origin.y,calculatorBackView.frame.size.width,calculatorBackView.frame.size.height);
//   [UIView animateWithDuration:0.3 animations:^{ 
     
//   }];

}

#pragma -----textfieldDelegate------
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    return YES;
}
@end
