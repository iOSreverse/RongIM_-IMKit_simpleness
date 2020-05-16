//
//  AppDelegate.m
//  RongIM_-IMKit_simpleness
//
//  Created by wdw on 2020/5/16.
//  Copyright © 2020 wdw. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;

    [self.window makeKeyAndVisible];

    return YES;
}

@end
