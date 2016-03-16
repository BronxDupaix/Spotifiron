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
    
    self.currentBackgroundColor = [UIColor cyanColor];
    
    self.currentFontNameString = [UIFont fontWithName: @"Avenir Next" size: 25];
    
    self.currentFontColor = [UIColor yellowColor];
    
    self.currentViewColor = [UIColor grayColor];
}

-(void)chooseTheme3 {
    
    self.currentBackgroundColor = [UIColor redColor];
    self.currentFontNameString = [UIFont fontWithName: @"Futura" size: 25];
    self.currentFontColor = [UIColor blackColor];
    
    self.currentViewColor = [UIColor purpleColor]; 

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
