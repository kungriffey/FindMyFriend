//
//  AppDelegate.m
//  FindMyFriend
//
//  Created by Kunwardeep Gill on 2015-05-12.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "LoginViewController.h"


#import "NewUserViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  // Override point for customization after application launch.
  
  // ****************************************************************************
  // Parse initialization
  [Parse setApplicationId:@"iTTRL8mKc9JszZhv9LyIClrGVR0zd2U3EoWOiwe4" clientKey:@"6fEWKJ6osKEx5v5zRwUHh2foe8q6B9eV5UrYv0ox"];
  // ****************************************************************************
  
  if ([PFUser currentUser]) {
    // Present wall straight-away
//    [self presentWallViewControllerAnimated:NO];
  }
  
  [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
  
//  [[PAWConfigManager sharedManager] fetchConfigIfNeeded];
  
  return YES;
}

#pragma mark LoginViewController

#pragma mark Delegate

- (void)loginViewControllerDidLogin:(LoginViewController *)controller {
//  [self presentWallViewControllerAnimated:YES];
}

#pragma mark WallViewController

//- (void)presentWallViewControllerAnimated:(BOOL)animated {
//  PAWWallViewController *wallViewController = [[PAWWallViewController alloc] initWithNibName:nil bundle:nil];
//  wallViewController.delegate = self;
//  [self.navigationController setViewControllers:@[ wallViewController ] animated:animated];
//}


- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
