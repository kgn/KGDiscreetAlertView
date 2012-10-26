`KGDiscreteAlertView` is an easy drop in control that allows you to display a discrete alert in any view.

![](https://raw.github.com/kgn/KGDiscreteAlertView/master/example.gif)

You supply your own text and `KGDiscreteAlertView` does the rest to properly fit the text in the discrete alert and animate it down from the top of the specified view:

``` obj-c
[KGDiscreteAlertView showDiscreteAlertWithText:@"KGDiscreteAlertView, add discrete alerts to any view!" inView:self.view];
```

There are a couple other options but it's purposely designed to be simple and easy to use:

``` obj-c
// Show a discrete alert with the given text in a view,
// the alert will be automatically dismissed after 3 seconds.
// Returns the discrete alert view, or nil if the alert was not shown.
+ (id)showDiscreteAlertWithText:(NSString *)text inView:(UIView *)view;

// Show a discrete alert with the given text in a view,
// the alert will be automatically dismissed after the specified delay.
// If the delay is 0 the alert will be 'sticky' and will not be dismissed until `hide` is called.
// Returns the discrete alert view, or nil if the alert was not shown.
+ (id)showDiscreteAlertWithText:(NSString *)text inView:(UIView *)view delay:(NSTimeInterval)delay;

// Show a discrete alert with the given text in a view, and a max width for the alert.
// The alert will be automaticly dismissed after the specified delay,
// if the delay is 0 the alert will be 'sticky' and will not be dismissed until `hide` is called.
// Returns the discrete alert view, or nil if the alert was not shown.
+ (id)showDiscreteAlertWithText:(NSString *)text inView:(UIView *)view maxWidth:(CGFloat)maxWidth delay:(NSTimeInterval)delay;

#pragma mark - Instance Methods

// Show a discrete alert with the given text in a view,
// the alert will be automatically dismissed after 3 seconds.
// Returns YES if the discrete alert was shown.
- (BOOL)showWithText:(NSString *)text inView:(UIView *)view;

// Show a discrete alert with the given text in a view,
// the alert will be automatically dismissed after the specified delay.
// If the delay is 0 the alert will be 'sticky' and will not be dismissed until `hide` is called.
// Returns YES if the discrete alert was shown.
- (BOOL)showWithText:(NSString *)text inView:(UIView *)view delay:(NSTimeInterval)delay;

// Show a discrete alert with the given text in a view, and a max width for the alert.
// The alert will be automatically dismissed after the specified delay,
// if the delay is 0 the alert will be 'sticky' and will not be dismissed until `hide` is called.
// Returns YES if the discrete alert was shown.
- (BOOL)showWithText:(NSString *)text inView:(UIView *)view maxWidth:(CGFloat)maxWidth delay:(NSTimeInterval)delay;

// Dismiss the discrete alert.
- (void)hide;
```

Check out the ExampleApp to see it in action!