//
//  BaseView.h
//  CRM-HD
//
//  Created by creditease on 14-12-5.
//  Copyright (c) 2014年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

@property (nonatomic, assign) UIInterfaceOrientation interfaceOrientation;



@property (nonatomic, assign)BOOL isBorderView;


- (void)setVerticalFrame;
- (void)setHorizontalFrame;

//- (void)layoutSubviews;

@end
