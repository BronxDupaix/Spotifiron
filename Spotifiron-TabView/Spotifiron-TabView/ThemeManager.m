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
    
    self.currentBackgroundColor = [UIColor orangeColor];
    self.currentFontNameString =@"Helvetica";
    self.currentFontColor = [UIColor blueColor];
}

-(void)chooseTheme2 {
    
    
}



-(void)chooseTheme3 {
    
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



@end
