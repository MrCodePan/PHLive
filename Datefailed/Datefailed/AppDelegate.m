//
//  AppDelegate.m
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "AppDelegate.h"
#import "LiveController.h"
#import "HomeController.h"
#import "AttentionController.h"
#import "MeController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    [self loadRootViewController];
//    
//    self.window.rootViewController = self.tabBarController;
    
    // Override point for customization after application launch.
    return YES;
}
-(void)loadRootViewController{
    //home
    HomeController *homePage = [[HomeController alloc] init];
    UIImage *home_Image = [UIImage imageNamed:@"btn_home_normal"];
    UIImage *home_secImage = [UIImage imageNamed:@"btn_home_selected"];
    home_secImage = [home_secImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *home_Item = [[UITabBarItem alloc] initWithTitle:@"首页" image:home_Image selectedImage:home_secImage];
    [home_Item setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:[ZXPublic getColor:@"6c7a81"],
                                       NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [home_Item setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:COLOR_RED,
                                       NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    homePage.tabBarItem = home_Item;
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homePage];
    homeNav.navigationBar.hidden = YES;
    homeNav.view.tag = 0;
    [home_Item setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    
    
    //直播
    LiveController *livePage = [[LiveController alloc] init];
    UIImage *live_Image = [UIImage imageNamed:@"btn_column_normal"];
    UIImage *live_secImage = [UIImage imageNamed:@"btn_column_selected"];
    home_secImage = [live_secImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *live_Item = [[UITabBarItem alloc] initWithTitle:@"直播" image:live_Image selectedImage:live_secImage];
    [home_Item setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:[ZXPublic getColor:@"6c7a81"],
                                       NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [home_Item setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:COLOR_RED,
                                       NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    livePage.tabBarItem = live_Item;
    UINavigationController *liveNav = [[UINavigationController alloc] initWithRootViewController:livePage];
    liveNav.navigationBar.hidden = YES;
    liveNav.view.tag = 0;
    [home_Item setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    
    
    //关注
    AttentionController *attentionPage = [[AttentionController alloc]init];
    UIImage *attention_Image = [UIImage imageNamed:@"btn_live_normal"];
    UIImage *attention_secImage = [UIImage imageNamed:@"btn_live_selected"];
    home_secImage = [attention_secImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *attention_Item = [[UITabBarItem alloc] initWithTitle:@"关注" image:attention_Image selectedImage:attention_secImage];
    [home_Item setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:[ZXPublic getColor:@"6c7a81"],
                                       NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [home_Item setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:COLOR_RED,
                                       NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    attentionPage.tabBarItem = attention_Item;
    UINavigationController *attentionNav = [[UINavigationController alloc] initWithRootViewController:attentionPage];
    attentionNav.navigationBar.hidden = YES;
    attentionNav.view.tag = 0;
    [attention_Item setTitlePositionAdjustment:UIOffsetMake(0, -5)];

    //我的
    AttentionController *mePage = [[AttentionController alloc]init];
    UIImage *me_Image = [UIImage imageNamed:@"btn_user_normal"];
    UIImage *me_secImage = [UIImage imageNamed:@"btn_user_selected"];
    me_secImage = [me_secImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *me_Item = [[UITabBarItem alloc] initWithTitle:@"关注" image:me_Image selectedImage:me_secImage];
    [me_Item setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:[ZXPublic getColor:@"6c7a81"],
                                       NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [me_Item setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:COLOR_RED,
                                       NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    mePage.tabBarItem = me_Item;
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:mePage];
    meNav.navigationBar.hidden = YES;
    meNav.view.tag = 0;
    [me_Item setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    
    
    
    
    
    
    
    
    self.tabBarController = [[UITabBarController alloc] init];
//    self.tabBarController.delegate = self;
    self.tabBarController.tabBar.barTintColor = [ZXPublic getColor:@"f6f6f6"];
    [self.tabBarController.tabBar setShadowImage:[UIImage imageNamed:@"tabbar_clearline"]];
    [self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_clearline"]];
    [self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_grayline"]];
    //背景色
    //self.mainTabBarController.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"红块"];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
                                                  homeNav,
                                             liveNav,
                                             attentionNav,
                                             meNav,
                                                  nil];

    

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
