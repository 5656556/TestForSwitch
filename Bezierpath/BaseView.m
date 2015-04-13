//
//  BaseView.m
//  CRM-HD
//
//  Created by creditease on 14-12-5.
//  Copyright (c) 2014年 creditease. All rights reserved.
//

#import "BaseView.h"
#define kGetColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define kGlobalBg kGetColor(46, 46, 46)


#define KGetPublicBgImageName @"common_bg_p"
#define KGetCommonBorder  @"common_border_bg_ls"
#define kGetCommonMoreBut @"common_more_but"
#define kGetCommonLin   @"common_ imaginary_short"
@implementation BaseView
{
    UIImageView *borderImageView;
}
- (instancetype)init
{
    if(self =[super init])
    {
        self.interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    
       [super layoutSubviews];
    self.interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (self.interfaceOrientation == UIDeviceOrientationPortrait || self.interfaceOrientation ==UIInterfaceOrientationPortraitUpsideDown) {
        [self setVerticalFrame];
    } else if(self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation ==UIInterfaceOrientationLandscapeRight){
        [self setHorizontalFrame];
    }

}

- (void)setVerticalFrame
{
    //    initVerticalFrame(竖屏)
    borderImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

}

- (void)setHorizontalFrame
{
    //  initHorizontalFrame(横屏)
    borderImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

}


-(void)setIsBorderView:(BOOL)isBorderView {
    
    if (isBorderView) {
        borderImageView = [[UIImageView alloc] init];
        borderImageView.image = [[UIImage imageNamed:KGetCommonBorder] resizableImageWithCapInsets:UIEdgeInsetsMake(1,1,1,1)  resizingMode:UIImageResizingModeStretch];
        if (self.interfaceOrientation == UIDeviceOrientationPortrait || self.interfaceOrientation ==UIInterfaceOrientationPortraitUpsideDown) {
            borderImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
         } else if(self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation ==UIInterfaceOrientationLandscapeRight){
             borderImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
         }
        borderImageView.backgroundColor = [UIColor redColor];
        [self addSubview:borderImageView];
        [self sendSubviewToBack:borderImageView];
    }
    
}





@end
