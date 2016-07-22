//
//  AppDelegate.m
//  TestEveryProject
//
//  Created by shawnfeng on 16/6/27.
//  Copyright © 2016年 shawnfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "ThirdViewController.h"
#import "OpenglTwoViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    /*
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    ThirdViewController *root = [[ThirdViewController alloc]init];
    //    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:root];//先将root添加在navigation上
    [_window setRootViewController:root];//navigation加在window上
    [self.window makeKeyAndVisible];
    */
    

    
   
    
    OpenglTwoViewController *controller = [[OpenglTwoViewController alloc] init];
//    controller.delegate = self;

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
    
    
    
    return YES;
}
//- (void)glkViewControllerUpdate:(GLKViewController *)controller {
//    //  NSLog(@"in glkViewControllerUpdate");
//}
//
//- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
//    //  NSLog(@"in glkView:drawInRect:");
//    glClearColor(0.5, 1, 1, 0.5);
//    glClear(GL_COLOR_BUFFER_BIT);
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
