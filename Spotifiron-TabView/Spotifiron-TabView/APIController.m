//
//  APIController.m
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "APIController.h"
#import "Artist.h"
#import "Album.h"
#import "Track.h"

@implementation APIController

NSMutableArray *artists;
NSMutableArray *albums;
NSMutableArray *tracks;
NSMutableArray *topTracks;
NSMutableArray *relatedArtists;




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
                            NSDictionary *dict = jsonArray.firstObject;
                            //                                NSLog(@"%@",dict);
                            Artist *a = [Artist artistWithDictionary:dict];
                            NSLog(@"%@", a.name);
                            [artists addObject:a];
                            NSLog(@"%lu",[artists count]);
                            
                        } else {
                            NSLog(@"I couldnt parse the items array");
                        }
                    } else {
                        NSLog(@"Could not parse json");
                    }
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
            }] resume];
    
}

-(void) getAlbumApi {
    
    NSString *urlString =@"https://api.spotify.com/v1/artists/1IQ2e1buppatiN1bxUVkrk/albums";
    
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
                    NSArray *jsonArray = [jsonDict objectForKey:@"items"];
                    if(jsonArray && jsonArray.count>0) {
                        for (NSDictionary *album in jsonArray) {
                            Album *a = [Album albumWithDictionary:album];
                            NSLog(@"%@", a.name);
                            [albums addObject:a];
                            NSLog(@"%lu",[albums count]);
                        }
                    } else {
                        NSLog(@"Could not parse json");
                    }
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
            }] resume];
    
}
-(void) getTrackApi {
    
    NSString *urlString =@"https://api.spotify.com/v1/albums/5pf1PjeTAMWmXVQjcn3Jc8/tracks";
    
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
                    NSArray *jsonArray = [jsonDict objectForKey:@"items"];
                    if(jsonArray && jsonArray.count>0) {
                        for (NSDictionary *track in jsonArray) {
                            Track *t = [Track trackWithDictionary:track];
                            NSLog(@"%@", t.name);
                            [tracks addObject:t];
                            NSLog(@"%lu",[tracks count]);
                        }
                    } else {
                        NSLog(@"Could not parse json");
                    }
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
            }] resume];
    
}

-(void) getTopTracksApi {
    
    NSString *urlString =@"https://api.spotify.com/v1/artists/1IQ2e1buppatiN1bxUVkrk/top-tracks?country=US";
    
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
                    NSArray *jsonArray = [jsonDict objectForKey:@"tracks"];
                    if(jsonArray && jsonArray.count>0) {
                        for (NSDictionary *track in jsonArray) {
                            Track *t = [Track trackWithDictionary:track];
                            NSLog(@"%@", t.name);
                            [topTracks addObject:t];
                            NSLog(@"%lu",[topTracks count]);
                        }
                    } else {
                        NSLog(@"Could not parse json");
                    }
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
            }] resume];
    
}


-(void) getRelatedArtistsApi {
    
    NSString *urlString =@"https://api.spotify.com/v1/artists/1IQ2e1buppatiN1bxUVkrk/related-artists";
    
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
                    NSArray *artistsArray = [jsonDict objectForKey:@"artists"];
                    
                    if(artistsArray != nil) {
                        // array items
                        for (NSDictionary *artistDict in artistsArray) {
                            
                            Artist *a = [Artist artistWithDictionary:artistDict];
                            NSLog(@"%@", a.name);
                            [relatedArtists addObject:a];
                            NSLog(@"%lu",[relatedArtists count]);
                        }
                    }
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
            }] resume];
    
}


@end
