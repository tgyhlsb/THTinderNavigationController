//
//  THTinderNavigationBar.m
//  THTinderNavigationControllerExample
//
//  Created by Tanguy Hélesbeux on 11/10/2014.
//  Copyright (c) 2014 Tanguy Hélesbeux. All rights reserved.
//

#import "THTinderNavigationBar.h"

#define WIDTH self.bounds.size.width
#define IMAGESIZE 30
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
        
        CGFloat step = [self getStepSizeWithWidth:WIDTH andIndex:idx];
        
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

- (CGFloat) getStepSizeWithWidth:(CGFloat)width andIndex:(NSUInteger)idx{
    
    return (width / 2) * idx;
}

#pragma mark - Properties

- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    
    CGFloat xOffset = contentOffset.x;
    
    [self.itemViews enumerateObjectsUsingBlock:^(UIView<THTinderNavigationBarItem> *itemView, NSUInteger idx, BOOL *stop) {
        
        CGFloat step = [self getStepSizeWithWidth:WIDTH andIndex:idx];
        
        CGRect itemViewFrame = itemView.frame;
        
        itemViewFrame.origin.x = step - ((xOffset - WIDTH) / 2) - (IMAGESIZE/2);
        
        CGFloat ratio;
        if(xOffset < WIDTH * idx) {
            ratio = (xOffset - WIDTH * (idx - 1)) / WIDTH;
            itemViewFrame.origin.x -= IMAGESIZE * (1-ratio);
        }else{
            ratio = 1 - ((xOffset - WIDTH * idx) / WIDTH);
            itemViewFrame.origin.x += IMAGESIZE * (1-ratio);
        }
        
        itemView.frame = itemViewFrame;
        
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

