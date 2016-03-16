//
//  ThemeManager.h
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface ThemeManager : NSObject

+(id)sharedManager;


@property (nonatomic, weak)   NSUserDefaults *defaults;

@property (nonatomic, strong) UIFont *currentFontNameString; 

@property (nonatomic, strong) UIColor *currentBackgroundColor;
@property (nonatomic, strong) UIColor *currentFontColor;

@property (nonatomic, strong) UIColor *currentViewColor; 

-(void)chooseDefaultTheme;
-(void)chooseTheme2;
-(void)chooseTheme3;
-(void)postNotification;
-(BOOL)loadCustomTheme;
-(BOOL)saveCustomTheme;
-(void)changeAPI; 


@end
