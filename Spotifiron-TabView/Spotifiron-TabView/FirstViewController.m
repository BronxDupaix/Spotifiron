//
//  FirstViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "FirstViewController.h"
#import "Artist.h"

@interface FirstViewController () {
    NSMutableArray *artists;
}

@property (strong, nonatomic) NSMutableArray *artistArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self getArtistApi];
    
}

-(void) getArtistApi {
    
    NSString *urlString =@"https://api.spotify.com/v1/search?q=slayer&type=artist";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:[NSURL URLWithString:urlString]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                if (error != nil) {
                    NSLog(@"An error occurred: %@", error.localizedDescription);
                    return;
                }
                
                // first dictionary
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                if (jsonDict != nil) {
                    // artists dictionary
                    NSDictionary *artistsDict = [jsonDict objectForKey:@"artists"];
                
                    if(artistsDict != nil) {
                        // array items
                        NSArray *jsonArray = [artistsDict objectForKey:@"items"];
                    
                        if(jsonArray && jsonArray.count>0) {
                            for(NSDictionary *dict in jsonArray) {
                                NSLog(@"%@",dict);
                            }
                        } else {
                            NSLog(@"I couldnt part the items array");
                        }
                    } else {
                        NSLog(@"Could not parse json");
                    }
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
            }] resume];
    
}
@end
