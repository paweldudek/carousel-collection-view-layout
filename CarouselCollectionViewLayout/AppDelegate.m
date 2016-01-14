//
//  AppDelegate.m
//  CarouselLayout
//
//  Created by Pawel Dudek on 20/07/14.
//  Copyright (c) 2014 dudek. All rights reserved.
//

#import "AppDelegate.h"
#import "CarouselCollectionViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    CarouselCollectionViewController *carouselCollectionViewController = [[CarouselCollectionViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:carouselCollectionViewController];
    navigationController.navigationBarHidden = YES;
    self.window.rootViewController = navigationController;

    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
