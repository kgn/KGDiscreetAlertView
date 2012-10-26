//
//  KGViewController.m
//  KGDiscreteAlertViewExample
//
//  Created by David Keegan on 10/26/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "KGViewController.h"
#import "KGDiscreteAlertView.h"

@interface KGViewController()
@property (weak, nonatomic) KGDiscreteAlertView *alert2;
@property (weak, nonatomic) KGDiscreteAlertView *alert3;
@end

@implementation KGViewController

- (IBAction)alert1:(id)sender{
    [self.alert2 hide];    
    [self.alert3 hide];
    [KGDiscreteAlertView showDiscreteAlertWithText:@"KGDiscreteAlertView, add discrete alerts to any view!"
                                                inView:self.view];
}

- (IBAction)alert2:(id)sender{
    [self.alert3 hide];
    KGDiscreteAlertView *alert2 =
    [KGDiscreteAlertView showDiscreteAlertWithText:@"Even multiline messages just...\n\nwork!"
                                                inView:self.view];
    if(alert2){
        self.alert2 = alert2;
    }
}

- (IBAction)alert3:(id)sender{
    [self.alert2 hide];
    KGDiscreteAlertView *alert3 =
    [KGDiscreteAlertView showDiscreteAlertWithText:@"The old lady pulled her spectacles down and looked "
     "over them about the room; then she put them up and looked out under them. She seldom or never looked "
     "THROUGH them for so small a thing as a boy; they were her state pair, the pride of her heart, and were "
     "built for \"style,\" not service -- she could have seen through a pair of stove-lids just as well. "
                                                inView:self.view maxWidth:500 delay:0];
    if(alert3){
        self.alert3 = alert3;
    }
}

@end
