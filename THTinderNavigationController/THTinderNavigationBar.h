//
//  THTinderNavigationBar.h
//  THTinderNavigationControllerExample
//
//  Created by Tanguy Hélesbeux on 11/10/2014.
//  Copyright (c) 2014 Tanguy Hélesbeux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THTinderNavigationController.h"

@interface THTinderNavigationBar : UINavigationBar

@property (nonatomic, strong) NSArray *itemViews;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) CGPoint contentOffset;

@property (strong, nonatomic) THTinderNavigationController *navigationController;

- (void)reloadData;

@end

@protocol THTinderNavigationBarItem <NSObject>

@optional

- (void)updateViewWithRatio:(CGFloat)ratio;

@end
