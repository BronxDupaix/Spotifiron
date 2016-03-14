//
//  ThemeManager.h
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface ThemeManager : NSObject

@property (nonatomic) NSString *font;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) NSString *fontColor;

+(id)sharedManger;

@end