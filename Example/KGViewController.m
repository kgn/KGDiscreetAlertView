//
//  KGViewController.m
//  KGDiscreteAlertViewExample
//
//  Created by David Keegan on 10/26/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "KGViewController.h"
#import "KGDiscreteAlertView.h"

@implementation KGViewController

- (IBAction)alert1:(id)sender{
    [KGDiscreteAlertView showDiscreteAlertWithText:@"KGDiscreteAlertView, add discrete alerts to any view!"
                                                inView:self.view];
}

- (IBAction)alert2:(id)sender{
    [KGDiscreteAlertView showDiscreteAlertWithText:@"Even multiline messages just...\n\nwork!"
                                                inView:self.view delay:5];
}

- (IBAction)alert3:(id)sender{
    [KGDiscreteAlertView showDiscreteAlertWithText:@"The old lady pulled her spectacles down and looked "
     "over them about the room; then she put them up and looked out under them. She seldom or never looked "
     "THROUGH them for so small a thing as a boy; they were her state pair, the pride of her heart, and were "
     "built for \"style,\" not service -- she could have seen through a pair of stove-lids just as well. "
                                                inView:self.view maxWidth:500 delay:0];
}

@end
