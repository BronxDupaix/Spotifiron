//
//  CustomThemeViewController.m
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/17/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "CustomThemeViewController.h"

@interface CustomThemeViewController ()

@end

@implementation CustomThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)backgroundButton:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"colorWheelSegue" sender:self];
    
}

- (IBAction)textColorButton:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"colorWheelSegue" sender:self];
    
}


@end
