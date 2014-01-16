//
//  HostViewController.m
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import "HostViewController.h"
#import "ContentViewController.h"

@interface HostViewController () <ViewPagerDataSource, ViewPagerDelegate>

@end

@implementation HostViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.dataSource = self;
    self.delegate = self;
    self.indicatorWidth = 108.0;
    self.hasNavigationBar = YES;
    
    self.title = @"View Pager";
    
    // Keeps tab bar below navigation bar on iOS 7.0+
    // if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
    //     self.edgesForExtendedLayout = UIRectEdgeNone;
    // }
    
    self.navigationItem.rightBarButtonItem = ({
        
        UIBarButtonItem *button;
        button = [[UIBarButtonItem alloc] initWithTitle:@"Tab #5" style:UIBarButtonItemStylePlain target:self action:@selector(selectTabWithNumberFive)];
        
        button;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectTabWithNumberFive {
    [self selectTabAtIndex:5];
}

#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return 5;
}
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    label.text = [NSString stringWithFormat:@"Tab #%i", index];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    
    return label;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    ContentViewController *cvc = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    
    cvc.labelString = [NSString stringWithFormat:@"Content View #%i", index];
    
    return cvc;
}

#pragma mark - ViewPagerDelegate
- (CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 0.0;
        case ViewPagerOptionCenterCurrentTab:
            return 0.0;
        case ViewPagerOptionTabLocation:
            return 1.0;
        case ViewPagerOptionTabHeight:
            return 32.0;
        case ViewPagerOptionTabOffset:
            return 36.0;
        case ViewPagerOptionTabWidth:
            return 108.0;
        case ViewPagerOptionFixFormerTabsPositions:
            return 0.0;
        case ViewPagerOptionFixLatterTabsPositions:
            return 0.0;
        default:
            return value;
    }
}
- (UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color
{
    switch (component) {
        case ViewPagerIndicator:
            return [[UIColor blueColor] colorWithAlphaComponent:0.64];
        case ViewPagerTabsView:
            return [[UIColor greenColor] colorWithAlphaComponent:0.64];
        case ViewPagerContent:
            return [[UIColor darkGrayColor] colorWithAlphaComponent:0.32];
        default:
            return color;
    }
}

@end
