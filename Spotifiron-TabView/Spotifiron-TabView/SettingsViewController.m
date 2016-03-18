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

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.view.backgroundColor = [[[ThemeManager sharedManager] colorValueArray] firstObject];
}

- (IBAction)firstThemeButton:(UIButton *)sender {
    
    
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
