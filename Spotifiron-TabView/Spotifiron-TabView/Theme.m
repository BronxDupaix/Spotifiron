//
//  Theme.m
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "Theme.h"

@implementation Theme

+ (id)sharedManger {
    Theme *sharedTheme = nil;
    @synchronized(self) {
        if (sharedTheme == nil)
            sharedTheme = [[self alloc] init];
    }
    return sharedTheme;
}


@end
