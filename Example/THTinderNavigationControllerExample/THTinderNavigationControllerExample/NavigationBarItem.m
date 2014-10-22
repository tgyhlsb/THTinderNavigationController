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
//    Color change animation
    
    self.coloredView.alpha = ratio;
    
//    Size change animation
    
//    ratio = ratio/2.0 + 0.5;
//    CGFloat height = self.frame.size.height * ratio;
//    CGFloat width = self.frame.size.width * ratio;
//    CGFloat x = (self.frame.size.width - width) / 2.0;
//    CGFloat y = (self.frame.size.height - height) / 2.0;
//    self.coloredView.frame = CGRectMake(x, y, width, height);
//    self.coloredView.layer.cornerRadius = height/2.0;
}

@end
