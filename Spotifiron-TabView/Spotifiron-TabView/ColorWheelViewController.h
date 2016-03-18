//
//  ColorWheelViewController.h
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/17/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISColorWheel.h"

@interface ColorWheelViewController : UIViewController

@property (strong, nonatomic) ISColorWheel *colorWheel;
@property (strong, nonatomic) UISlider *brightnessSlider;
@property (strong, nonatomic) UIView *wellView;

- (void)colorWheelDidChangeColor:(ISColorWheel *)colorWheel;

@end
