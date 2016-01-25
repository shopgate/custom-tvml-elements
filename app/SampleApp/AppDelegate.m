//
//  AppDelegate.m
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "AppDelegate.h"
#import "TVExtendedInterfaceCreator.h"

@interface AppDelegate () <TVApplicationControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSString *TVBaseURL = @"http://localhost:9001/";
    NSString *TVBootURL = [TVBaseURL stringByAppendingString:@"application.js"];
    
    TVApplicationControllerContext * appControllerContext = [TVApplicationControllerContext new];
    appControllerContext.javaScriptApplicationURL = [NSURL URLWithString:TVBootURL];
    
    NSMutableDictionary * appLaunchOptions = [NSMutableDictionary dictionary];
    appLaunchOptions[@"BASEURL"] = TVBaseURL;
    
    for (id key in launchOptions) {
        id value = launchOptions[key];
        appLaunchOptions[key] = value;
    }
    
    [TVInterfaceFactory sharedInterfaceFactory].extendedInterfaceCreator = [TVExtendedInterfaceCreator new];
    
    self.appController = [[TVApplicationController alloc] initWithContext:appControllerContext window:self.window delegate:self];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)appController:(TVApplicationController *)appController didFinishLaunchingWithOptions:(NSDictionary<NSString *,id> *)options
{
    NSLog(@"%s invoked with options: %@",__FUNCTION__, options);
}

- (void)appController:(TVApplicationController *)appController didFailWithError:(NSError *)error
{
    NSLog(@"%s invoked with error: %@",__FUNCTION__, error);
}

- (void)appController:(TVApplicationController *)appController didStopWithOptions:(NSDictionary<NSString *,id> *)options
{
    NSLog(@"%s invoked with options: %@",__FUNCTION__, options);
}

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
