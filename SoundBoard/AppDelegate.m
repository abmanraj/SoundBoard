////
//  AppDelegate.m
//  SoundBoard
//
//  Created by Arjun's MacBook Pro on 17/04/17.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

#import "AppDelegate.h"
#import "MVYSideMenuController.h"
#import "MVYMenuViewController.h"

#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    MVYMenuViewController *menuVC = [[MVYMenuViewController alloc] initWithNibName:@"MVYMenuViewController" bundle:nil];
//    MVYContentViewController *contentVC = [[MVYContentViewController alloc] initWithNibName:@"MVYContentViewController" bundle:nil];
//    UINavigationController *contentNavigationController = [[UINavigationController alloc] initWithRootViewController:contentVC];
   ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = navigationController;
    MVYSideMenuOptions *options = [[MVYSideMenuOptions alloc] init];
    options.contentViewScale = 1.0;
    options.contentViewOpacity = 0.05;
    options.shadowOpacity = 0.0;
    MVYSideMenuController *sideMenuController = [[MVYSideMenuController alloc] initWithMenuViewController:menuVC
                                                                                    contentViewController:navigationController
                                                                                                  options:options];
    sideMenuController.menuFrame = CGRectMake(0, 64.0, 220.0, self.window.bounds.size.height - 64.0);
    
    self.window.rootViewController = sideMenuController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
