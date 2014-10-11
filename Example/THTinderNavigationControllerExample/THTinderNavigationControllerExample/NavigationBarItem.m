//
//  NavigationBarItem.m
//  THTinderNavigationControllerExample
//
//  Created by Tanguy Hélesbeux on 11/10/2014.
//  Copyright (c) 2014 Tanguy Hélesbeux. All rights reserved.
//

#import "NavigationBarItem.h"

@interface NavigationBarItem()

@property (strong, nonatomic) UIView *coloredView;

@end

@implementation NavigationBarItem


- (UIView *)coloredView
{
    if (!_coloredView) {
        self.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius = self.frame.size.width/2;
        self.clipsToBounds = YES;
        
        _coloredView = [[UIView alloc] initWithFrame:self.bounds];
        _coloredView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_coloredView];
    }
    
    return _coloredView;
}

- (void)updateViewWithRatio:(CGFloat)ratio
{
    self.coloredView.alpha = ratio;
}

@end
