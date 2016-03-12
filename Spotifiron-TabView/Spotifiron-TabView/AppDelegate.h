//
//  AppDelegate.h
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Theme.h"

@class ArtistCollectionViewCell;
@class FirstViewController;
@class SecondViewController;
@class TopTracksViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) Theme *theme;
@property (strong, nonatomic) FirstViewController *firstViewController;
@property (strong, nonatomic) SecondViewController *secondViewController;
@property (strong, nonatomic) TopTracksViewController *topTracksController;
@property (strong, nonatomic) ArtistCollectionViewCell *artistCollectionViewCell;
@property (strong, nonatomic) UINavigationController *navController;

@end

