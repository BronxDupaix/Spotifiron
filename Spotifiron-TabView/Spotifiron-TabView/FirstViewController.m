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
    
    self.artistArray = [[NSMutableArray alloc] init];
    
    NSArray *array = @[ @""]; 
    
    [self.artistArray addObjectsFromArray:array];
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
                    
                    if([object isKindOfClass:[NSArray class]])
                    {
                        NSDictionary *results = [object firstObject];
                            Artist *artist = [Artist artistWithDictionary:results];
                        NSLog(@"%@", artist.name);
                            [artists addObject:artist];
                            for (Artist *a in artists) {
                                NSLog(@"%@", a.name);
                                NSLog(@"%lu", artists.count);
                            }
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
