//
//  KGAppDelegate.m
//  KGDiscreetAlertViewExample
//
//  Created by David Keegan on 10/24/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "KGAppDelegate.h"
#import "KGDiscreetAlertView.h"
#import "KGViewController.h"

@implementation KGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    KGViewController *viewController = [[KGViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = viewController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
