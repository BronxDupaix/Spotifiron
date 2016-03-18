//
//  ThemeManager.m
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "ThemeManager.h"
#import "Constants.h" 
#import "ColorWheelViewController.h"

@implementation ThemeManager

+ (id)sharedManager {
    static ThemeManager *sharedManager = nil;
    @synchronized(self) {
        if (sharedManager == nil)
            sharedManager = [[self alloc] init];
    }
    return sharedManager;
}


-(instancetype)init {
    
    if ( self = [super init]) {
        
        self.defaults = [NSUserDefaults standardUserDefaults];
        
    }
    
    return self;
}


//currentFontNameString;
//currentBackgroundColor;
//currentFontColor;

-(void)chooseDefaultTheme {
    
    self.currentBackgroundColor = [UIColor orangeColor];
    
    self.currentFontNameString = [UIFont fontWithName: @"Helvetica" size:18];
    
    self.currentFontColor = [UIColor blueColor];
    
    self.currentViewColor = [UIColor blackColor];
    
    self.secondFontNameString = [UIFont fontWithName: @"Helvetica" size: 18];
    
    self.secondBackgroundColor = [UIColor cyanColor];
    
    self.secondFontColor = [UIColor purpleColor];
    
    self.secondViewColor = [UIColor lightGrayColor]; 
    
}

-(void)chooseTheme2 {
    
    self.currentBackgroundColor = [UIColor grayColor];
    self.currentFontColor = [UIColor cyanColor];
    self.currentFontNameString = [UIFont fontWithName: @"Avenir Next" size: 18];
    self.secondFontNameString = [UIFont fontWithName: @"Avenir Next" size: 18];
    self.currentViewColor = [UIColor redColor];
    self.secondBackgroundColor = [UIColor redColor];
    self.secondFontColor = [UIColor blackColor];
    self.secondViewColor = [UIColor magentaColor];
}

-(void)chooseTheme3 { 
    
    self.currentBackgroundColor = [UIColor redColor];
    self.currentFontNameString = [UIFont fontWithName: @"Futura" size: 18];
    
    self.currentFontColor = [UIColor blackColor];
    
    self.currentViewColor = [UIColor redColor];
    
    

}

-(void)chooseCustomTheme {
    
    self.currentFontColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.currentFontNameString = [UIFont fontWithName:@"" size:18];

}



-(void)postNotification
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationThemeChanged
                                                        object:nil];
}

-(void)changeAPI {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationGetNewApi
                                                        object:nil];
    
}


@end
