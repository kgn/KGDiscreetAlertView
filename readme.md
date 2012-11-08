`KGDiscreetAlertView` is an easy drop in control that allows you to display a discreet alert in any view.

![](https://raw.github.com/kgn/KGDiscreetAlertView/master/example.gif)

You supply your own text and `KGDiscreetAlertView` does the rest to properly fit the text in the discreet alert and animate it down from the top of the specified view:

``` obj-c
[KGDiscreetAlertView showDiscreetAlertWithText:@"KGDiscreetAlertView, add discreet alerts to any view!" inView:self.view];
```

There are a couple other options but it's purposely designed to be simple and easy to use:

``` obj-c
#pragma mark - Convenience Class Methods

// Show a discreet alert with the given text in a view,
// the alert will be automatically dismissed after 3 seconds.
+ (id)showDiscreetAlertWithText:(NSString *)text inView:(UIView *)view;

// Show a discreet alert with the given text in a view,
// the alert will be automatically dismissed after the specified delay.
// If the delay is 0 the alert will be 'sticky' and will not be dismissed until `hide` is called.
+ (id)showDiscreetAlertWithText:(NSString *)text inView:(UIView *)view delay:(NSTimeInterval)delay;

// Show a discreet alert with the given text in a view, and a max width for the alert.
// The alert will be automaticly dismissed after the specified delay,
// if the delay is 0 the alert will be 'sticky' and will not be dismissed until `hide` is called.
+ (id)showDiscreetAlertWithText:(NSString *)text inView:(UIView *)view maxWidth:(CGFloat)maxWidth delay:(NSTimeInterval)delay;

#pragma mark - Instance Methods

// Show a discreet alert with the given text in a view,
// the alert will be automatically dismissed after 3 seconds.
- (void)showWithText:(NSString *)text inView:(UIView *)view;

// Show a discreet alert with the given text in a view,
// the alert will be automatically dismissed after the specified delay.
// If the delay is 0 the alert will be 'sticky' and will not be dismissed until `hide` is called.
- (void)showWithText:(NSString *)text inView:(UIView *)view delay:(NSTimeInterval)delay;

// Show a discreet alert with the given text in a view, and a max width for the alert.
// The alert will be automatically dismissed after the specified delay,
// if the delay is 0 the alert will be 'sticky' and will not be dismissed until `hide` is called.
- (void)showWithText:(NSString *)text inView:(UIView *)view maxWidth:(CGFloat)maxWidth delay:(NSTimeInterval)delay;

// Dismiss the discreet alert.
- (void)hide;
```

Check out the ExampleApp to see it in action!