//
//  SettingsViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/13/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "SettingsViewController.h"
#import "ThemeManager.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)firstThemeButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] chooseDefaultTheme];
    [[ThemeManager sharedManager] postNotification];
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
