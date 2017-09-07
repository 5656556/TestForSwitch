//
//  ViewController.m
//  Bezierpath
//
//  Created by Newtouch on 15/2/5.
//  Copyright (c) 2015年 ncl. All rights reserved.
//

#import "ViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "Masonry.h"
#import "UIView+ITTAdditions.h"
#import "CECalculatorLayoutView.h"
#import "XTSegmentControl.h"
#import "iCarousel.h"
#define kWidth 70
#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define kScreenHeight      [UIScreen mainScreen].bounds.size.height
#define leftOffx ((kScreenWidth-4*kWidth)/2)
#define kfont [UIFont systemFontOfSize:14]
@interface ViewController ()<iCarouselDataSource,iCarouselDelegate>
@property (nonatomic,retain)UIView *lineView;
@property (nonatomic,retain)UIPageViewController *pageviewController;
@property (nonatomic,retain)NSMutableArray *vcArr;
@property (nonatomic,retain)CECalculatorLayoutView *cecalview;
@property (nonatomic,retain)UIButton *cLbel;
@property (nonatomic,assign)CGFloat lastOffx;
@property (nonatomic,retain)NSArray *arr;
@property (nonatomic,retain)NSMutableArray *arr1;
@property (nonatomic , strong) XTSegmentControl *segmentControl;
@property (nonatomic , strong) iCarousel *carousel;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _arr = @[@"P2P",@"互联网产品",@"信托",@"理财产品"];

    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 98, 320, CGRectGetHeight(self.view.bounds) - 98)];
    _carousel.backgroundColor = [UIColor whiteColor];
    _carousel.dataSource = self;
    _carousel.delegate = self;
    _carousel.decelerationRate = 0.7;
    _carousel.type = iCarouselTypeLinear;
    _carousel.pagingEnabled = YES;
    _carousel.edgeRecognition = YES;
    _carousel.bounceDistance = 0.4;
    [self.view addSubview:_carousel];
    __weak typeof(_carousel) weakCarousel = _carousel;
    
    _segmentControl = [[XTSegmentControl alloc] initWithFrame:CGRectMake(20, 64, 320, 36) Items:_arr selectedBlock:^(NSInteger index) {
        
        [weakCarousel scrollToItemAtIndex:index animated:NO];
    }];
    
    [self.view addSubview:_segmentControl];
   }
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return _arr.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UIView *listView = nil;
    
    if (view == nil)
    {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        listView = [[UIView alloc] initWithFrame:view.bounds];
        listView.tag = 1;
        [view addSubview:listView];
    }
    else
    {
        listView = (UIView *)[view viewWithTag:1];
    }
    
    return view;
}
- (void)carouselDidScroll:(iCarousel *)carousel
{
    if (_segmentControl) {
        
        float offset = carousel.scrollOffset;
        
        if (offset > 0) {
            
            [_segmentControl moveIndexWithProgress:offset];
        }
    }
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    if (_segmentControl) {
        [_segmentControl endMoveIndex:carousel.currentItemIndex];
    }
}

@end
