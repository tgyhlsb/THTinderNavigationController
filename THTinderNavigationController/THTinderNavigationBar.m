//
//  THTinderNavigationBar.m
//  THTinderNavigationControllerExample
//
//  Created by Tanguy Hélesbeux on 11/10/2014.
//  Copyright (c) 2014 Tanguy Hélesbeux. All rights reserved.
//

#import "THTinderNavigationBar.h"

#define kXHiPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define kXHLabelBaseTag 1000

#define MARGIN_LEFT 145
#define WIDTH self.bounds.size.width
#define IMAGESIZE 30
#define STEP 130
#define SPEED 2.45
#define Y_POSITION 28

@interface THTinderNavigationBar ()

@end

@implementation THTinderNavigationBar

#pragma mark - DataSource

- (void)reloadData {
    if (!self.itemViews.count) {
        return;
    }
    
    [self.itemViews enumerateObjectsUsingBlock:^(UIView<THTinderNavigationBarItem> *itemView, NSUInteger idx, BOOL *stop) {
        
        //dyanmically get the width with 15px side margins
        CGFloat width = (WIDTH - 30);
        CGFloat step = (width / 2 - 15) * idx + 15;
        
        CGRect itemViewFrame = CGRectMake(step, Y_POSITION, IMAGESIZE, IMAGESIZE);
        itemView.hidden = NO;
        itemView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        itemView.frame = itemViewFrame;
        if (self.currentPage + 1 == idx) {
            [self updateItemView:itemView withRatio:1.0];
        } else {
            [self updateItemView:itemView withRatio:0.0];
        }
    }];
}

- (void)tapGestureHandle:(UITapGestureRecognizer *)tapGesture
{
    NSInteger pageIndex = [self.itemViews indexOfObject:tapGesture.view];
    [self.navigationController setCurrentPage:pageIndex animated:YES];
}

#pragma mark - Other

- (void)updateItemView:(UIView<THTinderNavigationBarItem> *)itemView withRatio:(CGFloat)ratio {
    if ([itemView respondsToSelector:@selector(updateViewWithRatio:)]) {
        [itemView updateViewWithRatio:ratio];
    }
}

#pragma mark - Properties

- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    
    CGFloat xOffset = contentOffset.x;
    
    CGFloat normalWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    
    [self.itemViews enumerateObjectsUsingBlock:^(UIView<THTinderNavigationBarItem> *itemView, NSUInteger idx, BOOL *stop) {
        
        //dyanmically get the width with 15px side margins
        CGFloat width = (WIDTH - 30);
        CGFloat step = (width / 2 - 15) * idx + 15;
        
        CGRect itemViewFrame = itemView.frame;
        itemViewFrame.origin.x = step - (xOffset - normalWidth) / SPEED;
        itemView.frame = itemViewFrame;
        
        CGFloat ratio;
        if(xOffset < normalWidth * idx) {
            ratio = (xOffset - normalWidth * (idx - 1)) / normalWidth;
        }else{
            ratio = 1 - ((xOffset - normalWidth * idx) / normalWidth);
        }
        
        [self updateItemView:itemView withRatio:ratio];
    }];
}

- (void)setItemViews:(NSArray *)itemViews
{
    if (itemViews) {
        
        [self.itemViews enumerateObjectsUsingBlock:^(UIView<THTinderNavigationBarItem> *itemView, NSUInteger idx, BOOL *stop) {
            [itemView removeFromSuperview];
        }];
        
        [itemViews enumerateObjectsUsingBlock:^(UIView<THTinderNavigationBarItem> *itemView, NSUInteger idx, BOOL *stop) {
            itemView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureHandle:)];
            [itemView addGestureRecognizer:tapGesture];
            [self addSubview:itemView];
        }];
    }
    
    _itemViews = itemViews;
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

- (void)dealloc {
    self.itemViews = nil;
}

@end

