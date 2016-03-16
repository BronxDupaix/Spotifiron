//
//  AlbumCollectionViewCell.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/13/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "AlbumCollectionViewCell.h"
#import "ThemeManager.h" 
#import "Album.h"
#import "Constants.h"

@implementation AlbumCollectionViewCell

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
                                                               self.albumImage.image = downloadedImage;
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
    
    self.albumName.backgroundColor = [[ThemeManager sharedManager] secondBackgroundColor];
    
    self.albumName.textColor = [[ThemeManager sharedManager] secondFontColor]; 
    
    self.albumName.font = [[ThemeManager sharedManager] currentFontNameString]; 
    
}




@end
