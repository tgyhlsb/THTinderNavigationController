THTinderNavigationController
============================

#Installation

Just drop `THTinderNavigationController` directory in your project.

#How to use

Create a `THTinderNavigationController`.

    THTinderNavigationController *tinderNavigationController = [[THTinderNavigationController alloc] init];


`THTinderNavigationController` can take any `UIView` as a navigationBarItem. Just set its `navBarItemViews` property.


    tinderNavigationController.navbarItemViews = @[
                                                   [[NavigationBarItem alloc] init],
                                                   [[NavigationBarItem alloc] init],
                                                   [[NavigationBarItem alloc] init]
                                                   ];

To animate your view based on its position, the view must respond to `- (void)updateViewWithRatio:(CGFloat)ration` in `THTinderNavigationBarItem` protocol.

In the demo, to change the color:

    - (void)updateViewWithRatio:(CGFloat)ratio
    {
    //    Color change animation

        self.coloredView.alpha = ratio;
    }

In the demo, to change the size:

    - (void)updateViewWithRatio:(CGFloat)ratio
    {
    //    Size change animation

        ratio = ratio/2.0 + 0.5;
        CGFloat height = self.frame.size.height * ratio;
        CGFloat width = self.frame.size.width * ratio;
        CGFloat x = (self.frame.size.width - width) / 2.0;
        CGFloat y = (self.frame.size.height - height) / 2.0;
        self.coloredView.frame = CGRectMake(x, y, width, height);
        self.coloredView.layer.cornerRadius = height/2.0;
    }
