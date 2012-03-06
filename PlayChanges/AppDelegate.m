//
//  AppDelegate.m
//  PlayChanges
//
//  Created by meng tong on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "PlayBagua.h"
#import "Liuyao.h"
#import "SkyGround.h"
#import "More.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tbc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    PlayBagua *pb = [[PlayBagua alloc] init];
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:pb];
    Liuyao *ly = [[Liuyao alloc] init];
    UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:ly];
    //SkyGround *sg = [[SkyGround alloc] init];
    //UINavigationController *nc3 = [[UINavigationController alloc] initWithRootViewController:sg];
    More *more = [[More alloc] init];
    UINavigationController *nc4 = [[UINavigationController alloc] initWithRootViewController:more];
    
    self.tbc = [[UITabBarController alloc] init];
    self.tbc.viewControllers = [NSArray arrayWithObjects:nc1, nc2, nc4, nil];
    self.window.rootViewController = self.tbc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
