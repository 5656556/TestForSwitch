//
//  FirstViewController.m
//  Bezierpath
//
//  Created by Newtouch on 15/2/6.
//  Copyright (c) 2015年 ncl. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
@interface FirstViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>
@property (nonatomic,retain)UIPageViewController *pageController;
@property (nonatomic,retain)NSArray *pageContent;
@end

@implementation FirstViewController
- (void) createContentPages {
    NSMutableArray *pageStrings = [[NSMutableArray alloc] init];
    for (int i = 1; i < 11; i++)
    {
        NSString *contentString = [[NSString alloc] initWithFormat:@"Chapter %d This is the page %d of content displayed using UIPageViewController in iOS 5.", i, i];
        [pageStrings addObject:contentString];
                                   
    }
    self.pageContent = [[NSArray alloc] initWithArray:pageStrings];
     
}
- (id )viewControllerAtIndex:(NSUInteger)index {
    if (([self.pageContent count] == 0) || (index >= [self.pageContent count])) {
        return nil;
    }
    // 创建一个新的控制器类，并且分配给相应的数据
   
    switch (index) {
        case 0:
        {
            SecondViewController *dataViewController =[[SecondViewController alloc] init];
            dataViewController.dataObject =[self.pageContent objectAtIndex:index];
            return dataViewController;

        }
            break;
        case 1:
        {
            SecondViewController *dataViewController =[[SecondViewController alloc] init];
            dataViewController.dataObject =[self.pageContent objectAtIndex:index];
            return dataViewController;
            
        }
            break;
        case 2:
        {
            ThirdViewController *dataViewController =[[ThirdViewController alloc] init];
            dataViewController.dataObject =[self.pageContent objectAtIndex:index];
            return dataViewController;
            
        }
            break;
        case 3:
        {
            FourthViewController *dataViewController =[[FourthViewController alloc] init];
            dataViewController.dataObject =[self.pageContent objectAtIndex:index];
            return dataViewController;
            
        }
            break;
            
        default:
        {
            SecondViewController *dataViewController =[[SecondViewController alloc] init];
            dataViewController.dataObject =[self.pageContent objectAtIndex:index];
            return dataViewController;

        }
            break;
    }
   }
// 根据数组元素值，得到下标值
- (NSUInteger)indexOfViewController:(SecondViewController *)viewController {
    return [self.pageContent indexOfObject:viewController.dataObject];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContentPages];
    NSDictionary *options =[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
                                                       forKey: UIPageViewControllerOptionSpineLocationKey];
    self.pageController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:options];
    
    SecondViewController *svc = [[SecondViewController alloc]init];
    ThirdViewController *tvc = [[ThirdViewController alloc]init];
    FourthViewController *fvc = [[FourthViewController alloc]init];
    [_pageController setViewControllers:@[svc] direction:UIPageViewControllerTransitionStyleScroll animated:YES completion:^(BOOL finished) {
        
    }];
    
    
    
    
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    [self addChildViewController:_pageController];
    
    [_pageController.view setFrame:self.view.bounds];
    [self.view addSubview:_pageController.view];
    
    
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- UIPageViewControllerDataSource

// 返回上一个ViewController对象
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = [self indexOfViewController:(SecondViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    // 返回的ViewController，将被添加到相应的UIPageViewController对象上。
    // UIPageViewController对象会根据UIPageViewControllerDataSource协议方法，自动来维护次序。
    // 不用我们去操心每个ViewController的顺序问题。
    return [self viewControllerAtIndex:index];
    
    
}

// 返回下一个ViewController对象
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = [self indexOfViewController:(SecondViewController *)viewController];
    if (index == NSNotFound) {    return nil;
    }
    index++;
    if (index == [self.pageContent count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonClicked:(UIButton *)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}
@end
