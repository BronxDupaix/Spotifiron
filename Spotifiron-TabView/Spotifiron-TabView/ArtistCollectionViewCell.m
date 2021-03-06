//
//  ArtistCollectionViewCell.m
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/11/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "ArtistCollectionViewCell.h"
#import "ThemeManager.h" 
#import "Constants.h"
#import "ThemeManager.h"
#import <QuartzCore/QuartzCore.h>

@implementation ArtistCollectionViewCell

- (void)awakeFromNib {
    
    self.ArtistLabel.textColor = [[ThemeManager sharedManager] defaultFontColor];
    
}

-(void)loadImageFromURLString:(NSString *)urlString
{
    
    //1
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
                                                   downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                       
                                                       
                                                       // 3
                                                       UIImage *downloadedImage = [UIImage imageWithData:
                                                                                   [NSData dataWithContentsOfURL:location]];
                                                       
                                                       if (downloadedImage != nil) {
                                                           
                                                           dispatch_sync(dispatch_get_main_queue(), ^{
                                                               self.artistImage.image = downloadedImage;
                                                           });
                                                           
                                                       }
                                                   }];
    
    // 4	
    [downloadPhotoTask resume];
    
}

-(void)layoutSubviews {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(layoutSubviews)
                                                 name:kNotificationThemeChanged
                                               object:nil];
    
    self.ArtistLabel.font = [[ThemeManager sharedManager] currentFontNameString];
    
    self.ArtistLabel.textColor = [[ThemeManager sharedManager] currentFontColor];
    
    self.ArtistLabel.layer.masksToBounds = YES;
    
    self.ArtistLabel.layer.cornerRadius = 25.0; 
    
    self.artistImage.layer.masksToBounds = YES;
    
    self.artistImage.layer.cornerRadius = 25.0;
}


@end
