//
//  ColorWheelViewController.m
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/17/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "ColorWheelViewController.h"
#import "ISColorWheel.h"
#import "ThemeManager.h"
#import "FirstViewController.h"

@interface ColorWheelViewController () <ISColorWheelDelegate>

@property (strong, nonatomic) UIColor *customColor;

@end

@implementation ColorWheelViewController



- (IBAction)setCustomBackgroundButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] setCurrentBackgroundColor:self.customColor];
    [[ThemeManager sharedManager] postNotification];
    
}

- (IBAction)setCustomTextColorButton:(UIButton *)sender {
    
    [[ThemeManager sharedManager] setCurrentFontColor:self.customColor];
    [[ThemeManager sharedManager] postNotification];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize size = self.view.bounds.size;
    
    CGSize wheelSize = CGSizeMake(size.width * .9, size.width * .9);
    
    
    CGRect frame = CGRectMake( (size.width / 2 - wheelSize.width / 2),
                              (size.height * .1) + 40,
                              wheelSize.width,
                              wheelSize.height);
    
    self.colorWheel = [[ISColorWheel alloc] initWithFrame:frame];
    self.colorWheel.delegate = self;
    self.colorWheel.continuous = true;
    [self.view addSubview:self.colorWheel];
    
    self.brightnessSlider = [[UISlider alloc] initWithFrame:CGRectMake(size.width * .4,
                                                                       size.height * .8,
                                                                       size.width * .5,
                                                                       size.height * .1)];
    self.brightnessSlider.minimumValue = 0.0;
    self.brightnessSlider.maximumValue = 1.0;
    self.brightnessSlider.value = 1.0;
    self.brightnessSlider.continuous = true;
    [self.brightnessSlider addTarget:self action:@selector(changeBrightness:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.brightnessSlider];
    
    self.wellView = [[UIView alloc] initWithFrame:CGRectMake(size.width * .1,
                                                             size.height * .8,
                                                             size.width * .2,
                                                             size.height * .1)];
    
    self.wellView.layer.borderColor = [UIColor blackColor].CGColor;
    self.wellView.layer.borderWidth = 2.0;
    [self.view addSubview:self.wellView];
}



- (void)changeBrightness:(UISlider*)sender
{
    [self.colorWheel setBrightness:self.brightnessSlider.value];
    [self.wellView setBackgroundColor:self.colorWheel.currentColor];
}

- (void)colorWheelDidChangeColor:(ISColorWheel *)colorWheel
{
    [self.wellView setBackgroundColor:self.colorWheel.currentColor];
    [self.view setBackgroundColor:self.colorWheel.currentColor];
    //    [self.FirstViewController.view setBackgroundColor:self.colorWheel.currentColor];
    
    UIColor *uicolor = [self.colorWheel currentColor] ;
    CGColorRef color = [uicolor CGColor];
    int numComponents = CGColorGetNumberOfComponents(color);
    
    [[ThemeManager sharedManager] setCurrentBackgroundColor:uicolor];
    
    [[ThemeManager sharedManager] postNotification];
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        CGFloat red = components[0];
        CGFloat green = components[1];
        CGFloat blue = components[2];
        
        NSLog(@"red: %.5f" ,red);
        
        NSLog(@"blue: %.5f" ,blue);
        
        NSLog(@"green: %.5f" ,green);
        
    }
    
}

// Do any additional setup after loading the view, typically from a nib.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end