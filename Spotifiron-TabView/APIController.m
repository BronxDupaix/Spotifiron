//
//  APIController.m
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "APIController.h"

@implementation APIController
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
