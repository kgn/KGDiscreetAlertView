//
//  KGDiscreetAlertView.h
//  KGDiscreetAlertView
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KGDiscreetAlertView : UIView

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

// Hide all of the discreet alerts in a given view.
+ (void)hideAllDiscreetAlertsInView:(UIView *)view;

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

@end
