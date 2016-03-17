//
//  SettingsViewController.h
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/13/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *artistSearchTextField; 

- (IBAction)firstThemeButton:(UIButton *)sender;

- (IBAction)secondThemeButton:(UIButton *)sender;

- (IBAction)thirdThemeButton:(UIButton *)sender;

- (IBAction)customThemeButton:(UIButton *)sender;

- (IBAction)artistSearchButton:(UIButton *)sender;

@end
