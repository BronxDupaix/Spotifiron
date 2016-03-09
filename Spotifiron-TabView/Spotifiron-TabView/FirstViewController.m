//
//  FirstViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "FirstViewController.h"
#import "Artist.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getArtistApi];
}





-(void) getArtistApi {
    NSString *urlString = @"https://api.spotify.com/v1/search?q=slayer&type=artist";
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlString]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSLog(@"%@", data);
                
                NSData *returnedData = data;
                if (returnedData == nil) {
                    NSLog(@"Bad data bro");
                }
                if(NSClassFromString(@"NSJSONSerialization"))
                {
                    NSError *error = nil;
                    id object = [NSJSONSerialization
                                 JSONObjectWithData:returnedData
                                 options:0
                                 error:&error];
                    NSLog(@"%@", object);
                    
                    if(error) {
                        NSLog(@"the json was bad");
                    }
                    
                    if([object isKindOfClass:[NSDictionary class]])
                    {
                        NSDictionary *results = object;
                        NSLog(@"%@", results);
                       // [(Artist)initWithDictionary:(NSDictionary *)results];
                    }
                    else
                    {
                    
                    }
                }
                else
                    NSLog(@"bad things happened");
            }] resume];
    
}
@end
