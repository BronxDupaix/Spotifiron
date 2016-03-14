//
//  AppDelegate.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "AppDelegate.h"
#import "ThemeManager.h"

@interface AppDelegate()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[ThemeManager sharedManager] chooseDefaultTheme];
    
    return YES;
}


@end
