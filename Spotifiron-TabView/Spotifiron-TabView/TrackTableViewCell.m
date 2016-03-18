//
//  TrackTableViewCell.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/13/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "TrackTableViewCell.h"
#import "ThemeManager.h"
#import "Constants.h"

@implementation TrackTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
}


    
-(void)layoutSubviews {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(layoutSubviews)
                                                     name:kNotificationThemeChanged
                                                   object:nil];
        
  

    self.trackName.font = [[ThemeManager sharedManager] currentFontNameString];
    
    self.trackName.textColor = [[ThemeManager sharedManager] currentFontColor];
    
//    self.trackName.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];
    
    
    
}



- (IBAction)playButton:(UIButton *)sender {
}
@end
