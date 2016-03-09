//
//  FirstViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getArtistApi];
}

}



-(void) getArtistApi {
    NSString *urlString = @"https://api.spotify.com/v1/search?q=slayer&type=artist";
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlString]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSLog(@"%@", data);
                
            }] resume];
    
}
@end
