//
//  ThemeManager.m
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager

+ (id)sharedManger {
    ThemeManager *sharedTheme = nil;
    @synchronized(self) {
        if (sharedTheme == nil)
            sharedTheme = [[self alloc] init];
    }
    return sharedTheme;
}


@end
