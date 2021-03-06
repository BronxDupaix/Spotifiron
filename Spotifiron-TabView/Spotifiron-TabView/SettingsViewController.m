//
//  SettingsViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/13/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "SettingsViewController.h"
#import "ThemeManager.h"
#import "APIController.h" 

@interface SettingsViewController ()
@property (assign) BOOL hasPickedCustomTheme;

- (IBAction)firstThemeButton:(UIButton *)sender;

- (IBAction)secondThemeButton:(UIButton *)sender;

- (IBAction)thirdThemeButton:(UIButton *)sender;

- (IBAction)customThemeButton:(UIButton *)sender;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hasPickedCustomTheme = NO;
    
    self.view.backgroundColor = [[ThemeManager sharedManager]defaultBackgroundColor];
    
    [[ThemeManager sharedManager] defaultFontColor];
    
    [self.defaultThemeOutlet.titleLabel setTextColor:[[ThemeManager sharedManager] defaultFontColor]];
    
}

- (IBAction)firstThemeButton:(UIButton *)sender {
    
    
    
    self.hasPickedCustomTheme = NO;
    [[ThemeManager sharedManager] chooseDefaultTheme];
    [[ThemeManager sharedManager] postNotification];
    
    self.view.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];

}

- (IBAction)secondThemeButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] chooseTheme2];
    [[ThemeManager sharedManager] postNotification];
    
    self.view.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];
    
}

- (IBAction)thirdThemeButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] chooseTheme3];
    [[ThemeManager sharedManager] postNotification];
    
    self.view.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];
}

- (IBAction)customThemeButton:(UIButton *)sender {
    
    
}





@end
