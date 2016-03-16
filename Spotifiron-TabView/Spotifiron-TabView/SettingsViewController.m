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
#import "Constants.h" 

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    
}

- (IBAction)firstThemeButton:(UIButton *)sender {
    
    
    //NSString *str = self.artistSearchTextField.text;

    [[ThemeManager sharedManager] chooseDefaultTheme];
    [[ThemeManager sharedManager] postNotification];
    
    //[[APIController sharedInstance] getArtistApi:str];

}

- (IBAction)secondThemeButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] chooseTheme2];
    [[ThemeManager sharedManager] postNotification];
}

- (IBAction)thirdThemeButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] chooseTheme3];
    [[ThemeManager sharedManager] postNotification];
    
}

- (IBAction)customThemeButton:(UIButton *)sender {
    
    
    
}


@end
