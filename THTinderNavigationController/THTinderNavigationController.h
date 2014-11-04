//
//  THTinderNavigationController.h
//  THTinderNavigationControllerExample
//
//  Created by Tanguy Hélesbeux on 11/10/2014.
//  Copyright (c) 2014 Tanguy Hélesbeux. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^THDidChangedPageBlock)(NSInteger currentPage, NSString *title);

@interface THTinderNavigationController : UIViewController

@property (nonatomic, copy) THDidChangedPageBlock didChangedPageCompleted;

@property (nonatomic, strong) NSArray *paggedViewControllers;
@property (nonatomic, strong) NSArray *navbarItemViews;

- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController;

- (instancetype)initWithRightViewController:(UIViewController *)rightViewController;

- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController rightViewController:(UIViewController *)rightViewController;

- (NSInteger)getCurrentPageIndex;

- (void)setCurrentPage:(NSInteger)currentPage animated:(BOOL)animated;

- (void)reloadData;

@end
