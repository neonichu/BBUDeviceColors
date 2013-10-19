//
//  BBUAppDelegate.m
//  DeviceColorsDemo
//
//  Created by Boris Bügling on 19.10.13.
//  Copyright (c) 2013 Boris Bügling. All rights reserved.
//

#import "BBUAppDelegate.h"
#import "UIDevice+Colors.h"

@implementation BBUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor clearColor];
    
    self.window.rootViewController = [UIViewController new];
    self.window.rootViewController.view.backgroundColor = [[UIDevice currentDevice] bbu_frontColor];
    self.window.rootViewController.view.frame = self.window.frame;
    
    UIView* enclosureColorView = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.window.frame.size.height / 2, self.window.frame.size.width, self.window.frame.size.height / 2)];
    enclosureColorView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    enclosureColorView.backgroundColor = [[UIDevice currentDevice] bbu_enclosureColor];
    [self.window.rootViewController.view addSubview:enclosureColorView];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
