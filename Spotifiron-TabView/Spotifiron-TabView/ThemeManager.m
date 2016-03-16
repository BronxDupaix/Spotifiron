//
//  ThemeManager.m
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "ThemeManager.h"
#import "Constants.h"

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
    
    self.currentBackgroundColor = [UIColor greenColor];
    
    self.currentFontNameString = [UIFont fontWithName: @"Helvetica" size: 25];
    
    self.currentFontColor = [UIColor blueColor];
    
    self.currentViewColor = [UIColor blackColor]; 
}

-(void)chooseTheme2 {
    
    self.currentBackgroundColor = [UIColor grayColor];
    self.currentFontNameString = @"Avenir Next";
    self.currentFontColor = [UIColor cyanColor];
    
    self.currentViewColor = [UIColor grayColor];
}

-(void)chooseTheme3 {
    
    self.currentBackgroundColor = [UIColor redColor];
    self.currentFontNameString = [UIFont fontWithName: @"Futura" size: 25];
    self.currentFontColor = [UIColor blackColor];
    
    self.currentViewColor = [UIColor purpleColor]; 

}

-(void)chooseCustomTheme {
    
    self.currentBackgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.currentFontColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
//    self.currentFontNameString = @"@%", selectedFont;

}

-(BOOL)loadCustomTheme {
    
    return NO;
    
}

-(BOOL)saveCustomTheme {
    
    
    
    return NO;
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
