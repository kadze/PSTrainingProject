//
//  PSAppDelegate.m
//  IOSTrainingProject
//
//  Created by Сергей on 03.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSAppDelegate.h"

#import "UIWindow+PSExtensions.h"
#import "PSSquareViewController.h"
#import "PSUsersViewController.h"
#import "PSUser.h"

@interface PSAppDelegate ()

@end

@implementation PSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
        
//    PSSquareViewController *controller = [PSSquareViewController new];
    
    PSUsersViewController *controller = [PSUsersViewController new];
    PSUser *user = [PSUser new];
    controller.user = user;
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
