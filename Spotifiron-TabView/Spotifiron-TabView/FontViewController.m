//
//  FontViewController.m
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/17/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "FontViewController.h"
#import "ThemeManager.h"

@interface FontViewController ()

- (IBAction)chooseTypewriterButton:(UIButton *)sender;

- (IBAction)chooseRockabillyButton:(UIButton *)sender;

- (IBAction)chooseFeltButton:(UIButton *)sender;

- (IBAction)choosePapyrusButton:(UIButton *)sender;

@end

@implementation FontViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}




- (IBAction)chooseTypewriterButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] setCurrentFontNameString: [UIFont fontWithName:@"American Typewriter" size:18]];
    
}

- (IBAction)chooseRockabillyButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] setCurrentFontNameString: [UIFont fontWithName:@"Rockabilly" size:18]];
    
}

- (IBAction)chooseFeltButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] setCurrentFontNameString: [UIFont fontWithName:@"Marker Felt Thin" size:18]];
    
}

- (IBAction)choosePapyrusButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] setCurrentFontNameString: [UIFont fontWithName:@"Papyrus" size:18]];
    
}
@end
