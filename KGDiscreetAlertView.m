//
//  KGDiscreetAlertView.m
//  KGDiscreetAlertView
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "KGDiscreetAlertView.h"

static CGFloat const kPadding = 12;
static NSTimeInterval const kAnimation = 0.25;
static NSTimeInterval const kDelay = 3;

@interface KGDiscreetAlertView()
@property (weak, nonatomic) UILabel *label;
@property (nonatomic) BOOL willHide;
@end

@implementation KGDiscreetAlertView

- (instancetype)init{
    if((self = [super init])){
        UILabel *label = [[UILabel alloc] init];
        label.lineBreakMode = UILineBreakModeWordWrap;
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.shadowColor = [UIColor colorWithWhite:0 alpha:0.5];
        label.shadowOffset = CGSizeMake(0, 1);
        [self addSubview:label];
        self.label = label;

        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        self.userInteractionEnabled = NO;
        self.opaque = NO;

        UITapGestureRecognizer *tapGestureRecagnizer =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tapGestureRecagnizer];
    }
    return self;
}

- (void)tapAction:(UIGestureRecognizer *)gestureRecagnizer{
    if(self.tapToHide){
        [self hide];
    }
}

- (void)setTapToHide:(BOOL)tapToHide{
    if(_tapToHide != tapToHide){
        self.userInteractionEnabled = tapToHide;
        _tapToHide = tapToHide;
    }
}

- (void)sizeLabel:(UILabel *)label toFitTextWithWidth:(CGFloat)width{
    CGSize textSize =
    [label.text sizeWithFont:label.font
           constrainedToSize:CGSizeMake(width, MAXFLOAT)
               lineBreakMode:label.lineBreakMode];
    label.numberOfLines = ceil(textSize.height/label.font.lineHeight);
    CGRect frame = label.frame;
    frame.size = textSize;
    label.frame = frame;
}

+ (instancetype)showDiscreetAlertWithText:(NSString *)text inView:(UIView *)view{
    return [self showDiscreetAlertWithText:text inView:view delay:kDelay];
}

+ (instancetype)showDiscreetAlertWithText:(NSString *)text inView:(UIView *)view delay:(NSTimeInterval)delay{
    return [self showDiscreetAlertWithText:text inView:view maxWidth:MAXFLOAT delay:delay];
}

+ (instancetype)showDiscreetAlertWithText:(NSString *)text inView:(UIView *)view maxWidth:(CGFloat)maxWidth delay:(NSTimeInterval)delay{
    id discreetAlertView = [[[self class] alloc] init];
    [discreetAlertView showWithText:text inView:view maxWidth:maxWidth delay:delay];
    return discreetAlertView;
}

+ (void)hideAllDiscreetAlertsInView:(UIView *)view{
    for(UIView *subview in view.subviews){
        if([subview isKindOfClass:[KGDiscreetAlertView class]] &&
           ![(KGDiscreetAlertView *)subview willHide]){
            [(KGDiscreetAlertView *)subview hide];
        }
    }
}

- (void)showWithText:(NSString *)text inView:(UIView *)view{
    return [self showWithText:text inView:view delay:kDelay];
}

- (void)showWithText:(NSString *)text inView:(UIView *)view delay:(NSTimeInterval)delay{
    [self showWithText:text inView:view maxWidth:MAXFLOAT delay:delay];
}

- (void)showWithText:(NSString *)text inView:(UIView *)view maxWidth:(CGFloat)maxWidth delay:(NSTimeInterval)delay{
    [[self class] hideAllDiscreetAlertsInView:view];

    self.label.text = text;
    [self sizeLabel:self.label toFitTextWithWidth:MIN(maxWidth, CGRectGetWidth(view.bounds)-kPadding*2)];

    __block CGRect selfFrame = self.label.bounds;
    selfFrame.size.width += kPadding*2;
    selfFrame.size.height += 4;

    CGRect labelRect = self.label.bounds;
    labelRect.origin.x = round(CGRectGetMidX(selfFrame)-CGRectGetMidX(labelRect));
    labelRect.origin.y = round(CGRectGetMidY(selfFrame)-CGRectGetMidY(labelRect));

    selfFrame.origin.y = -CGRectGetHeight(selfFrame);
    selfFrame.origin.x = round(CGRectGetMidX(view.bounds)-CGRectGetMidX(selfFrame));

    self.frame = selfFrame;
    self.label.frame = labelRect;

    [view addSubview:self];

    [UIView animateWithDuration:kAnimation animations:^{
        selfFrame.origin.y = 0;
        self.frame = selfFrame;
    } completion:^(BOOL finished){
        if(delay > 0){
            [NSTimer scheduledTimerWithTimeInterval:kDelay target:self selector:@selector(hide) userInfo:nil repeats:NO];
        }
    }];
}

- (void)hide{
    self.willHide = YES;
    [UIView animateWithDuration:kAnimation animations:^{
        CGRect frame = self.frame;
        frame.origin.y = -CGRectGetHeight(frame);
        self.frame = frame;
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}

- (void)drawRect:(CGRect)rect{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.8];

    //// Frames
    CGRect mainFrame = self.bounds;

    //// Subframes
    CGRect frame = CGRectMake(CGRectGetMinX(mainFrame) + -1, CGRectGetMinY(mainFrame) + -1, 11, 9);
    CGRect frame2 = CGRectMake(CGRectGetMinX(mainFrame) + CGRectGetWidth(mainFrame) - 12, CGRectGetMinY(mainFrame) + -1, 14, 8);
    CGRect frame3 = CGRectMake(CGRectGetMinX(mainFrame) + 4, CGRectGetMinY(mainFrame) + CGRectGetHeight(mainFrame) - 6, 8, 7);
    CGRect frame4 = CGRectMake(CGRectGetMinX(mainFrame) + CGRectGetWidth(mainFrame) - 13, CGRectGetMinY(mainFrame) + CGRectGetHeight(mainFrame) - 6, 10, 7);


    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame2) + 0.5 * CGRectGetWidth(frame2), CGRectGetMinY(frame2) + 0.75 * CGRectGetHeight(frame2))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame4) + 0.8 * CGRectGetWidth(frame4), CGRectGetMinY(frame4) + 0.29 * CGRectGetHeight(frame4))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame4) + 0.4 * CGRectGetWidth(frame4), CGRectGetMinY(frame4) + 0.86 * CGRectGetHeight(frame4)) controlPoint1: CGPointMake(CGRectGetMinX(frame4) + 0.8 * CGRectGetWidth(frame4), CGRectGetMinY(frame4) + 0.6 * CGRectGetHeight(frame4)) controlPoint2: CGPointMake(CGRectGetMinX(frame4) + 0.62 * CGRectGetWidth(frame4), CGRectGetMinY(frame4) + 0.86 * CGRectGetHeight(frame4))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 0.62 * CGRectGetWidth(frame3), CGRectGetMinY(frame3) + 0.86 * CGRectGetHeight(frame3))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 0.12 * CGRectGetWidth(frame3), CGRectGetMinY(frame3) + 0.29 * CGRectGetHeight(frame3)) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 0.35 * CGRectGetWidth(frame3), CGRectGetMinY(frame3) + 0.86 * CGRectGetHeight(frame3)) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 0.12 * CGRectGetWidth(frame3), CGRectGetMinY(frame3) + 0.6 * CGRectGetHeight(frame3))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.55 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.67 * CGRectGetHeight(frame))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.09 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.55 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.36 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.34 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 0.86 * CGRectGetWidth(frame2), CGRectGetMinY(frame2) + 0.12 * CGRectGetHeight(frame2))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 0.5 * CGRectGetWidth(frame2), CGRectGetMinY(frame2) + 0.75 * CGRectGetHeight(frame2)) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 0.66 * CGRectGetWidth(frame2), CGRectGetMinY(frame2) + 0.12 * CGRectGetHeight(frame2)) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 0.5 * CGRectGetWidth(frame2), CGRectGetMinY(frame2) + 0.4 * CGRectGetHeight(frame2))];
    [bezier2Path closePath];
    [color setFill];
    [bezier2Path fill];

    [super drawRect:rect];
}

@end
