THTinderNavigationController
============================

#Installation

Just drop `THTinderNavigationController` directory in your project.

#How to use

Create a `THTinderNavigationController`.

    THTinderNavigationController *tinderNavigationController = [[THTinderNavigationController alloc] init];


`THTinderNavigationController` can take any `UIView` as a navigationBarItem. Just set its `navBarItemViews' property.


    tinderNavigationController.navbarItemViews = @[
                                                   [[NavigationBarItem alloc] init],
                                                   [[NavigationBarItem alloc] init],
                                                   [[NavigationBarItem alloc] init]
                                                   ];

To animate your view based on its position, the view must respond to `- (void)updateViewWithRatio:(CGFloat)ration` in `THTinderNavigationBarItem` protocol.

    - (void)updateViewWithRatio:(CGFloat)ratio
    {
        self.coloredView.alpha = ratio;
    }
