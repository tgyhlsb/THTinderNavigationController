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
    [self setUpNavbar];
}

#pragma mark - View set up

- (void)setUpNavbar
{
    self.navigationBar.translucent = YES;
    self.navigationBarHidden = YES;
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

@end
