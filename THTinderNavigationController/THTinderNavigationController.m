//
//  THTinderNavigationController.m
//  THTinderNavigationControllerExample
//
//  Created by Tanguy Hélesbeux on 04/11/2014.
//  Copyright (c) 2014 Tanguy Hélesbeux. All rights reserved.
//

#import "THTinderNavigationController.h"
#import "THTinderPaggingController.h"
#import "NavigationBarItem.h"

@interface THTinderNavigationController ()

@property (strong, nonatomic) THTinderPaggingController *paggingVC;

@end

@implementation THTinderNavigationController

- (id)init
{
    self = [super init];
    if (self) {
        [self setUpPaggingViewController];
    }
    return self;
}

#pragma mark - View life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavbarVisible:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *destination = [UIViewController new];
        destination.view.backgroundColor = [UIColor yellowColor];
        [self pushViewController:destination animated:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIViewController *destination = [UIViewController new];
            destination.view.backgroundColor = [UIColor yellowColor];
            [self pushViewController:destination animated:YES];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                UIViewController *destination = [UIViewController new];
                destination.view.backgroundColor = [UIColor yellowColor];
                [self pushViewController:destination animated:YES];
            });
        });
    });
}

#pragma mark - View set up

- (void)setNavbarVisible:(BOOL)visible
{
    self.navigationBarHidden = !visible;
}

- (void)setUpPaggingViewController
{
    UIViewController *viewController1 = [[UIViewController alloc] init];
    viewController1.view.backgroundColor = [UIColor redColor];
    UIViewController *viewController2 = [[UIViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor whiteColor];
    UIViewController *viewController3 = [[UIViewController alloc] init];
    viewController3.view.backgroundColor = [UIColor blueColor];
    UIViewController *viewController4 = [[UIViewController alloc] init];
    viewController4.view.backgroundColor = [UIColor purpleColor];
    
    self.paggingVC.paggedViewControllers = @[
                                             viewController1,
                                             viewController2,
                                             viewController3,
                                             viewController4
                                             ];
    
    self.paggingVC.paggedIconViews = @[
                                       [[NavigationBarItem alloc] init],
                                       [[NavigationBarItem alloc] init],
                                       [[NavigationBarItem alloc] init],
                                       [[NavigationBarItem alloc] init]
                                       ];
    
    [self.paggingVC setCurrentPage:1 animated:NO];
    [self setViewControllers:@[self.paggingVC]];
}

#pragma mark - Getters & Setters

- (THTinderPaggingController *)paggingVC
{
    if (!_paggingVC) {
        _paggingVC = [[THTinderPaggingController alloc] init];
    }
    return _paggingVC;
}

#pragma mark - Segues

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self setNavbarVisible:YES];
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *destination = [super popViewControllerAnimated:animated];
    [self setNavbarVisible:([self.viewControllers count] > 1)];
    return destination;
}

@end
