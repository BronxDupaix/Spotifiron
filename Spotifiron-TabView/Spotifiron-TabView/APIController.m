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
#import "DataStore.h"
#import "Constants.h"

@interface APIController ()
@property(nonatomic, strong) Artist *currentArtist;
@end

@implementation APIController


+ (id)sharedInstance {
    static APIController *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
        
    }
    
    return sharedInstance;
}


-(instancetype)init {
    
    if ( self = [super init] ) {
        self.artists = [[NSMutableArray alloc] init];
    }
    
    return self;
}



//[[NSNotificationCenter defaultCenter] addObserver:self
//                                          selector:@selector(getArtistApi:)
//                                             name:@"fetchDidComplete"
//                                           object:nil];



-(void) getArtistApi:(NSString *)artistName {
    
    NSString *escapedSearchTerm = [artistName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSString *urlString =[NSString stringWithFormat:@"https://api.spotify.com/v1/search?q=%@&type=artist", escapedSearchTerm];
    
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
                            //NSLog(@"%@",dict);
                            Artist *a = [Artist artistWithDictionary:dict];
                            //NSLog(@"%@", a.name);
                            [[APIController sharedInstance] getAlbumApi:a.idString];
                            [[APIController sharedInstance] getTopTracksApi:a.idString];
                            [[APIController sharedInstance] getRelatedArtistsApi:a.idString];
                            // NSLog(@"%@", a.idString);
                            self.currentArtist = a;
                            //                            [[[DataStore sharedInstance] artists] addObject:currentArtist];
                            //                            NSLog(@"%lu", [[[DataStore sharedInstance] artists] count]);
                            
                        } else {
                            NSLog(@"I couldnt parse the items array");
                        }
                    } else {
                        NSLog(@"Could not parse json");
                    }
                    [self passArtistToDataStore];
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
                //  NSLog(@"artist api done");
            }] resume];
    
}

-(void) getAlbumApi:(NSString *)artistIdString {
    
    NSString *urlString =[NSString stringWithFormat:@"https://api.spotify.com/v1/artists/%@/albums?market=US&album_type=album", artistIdString];
    
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
                            // NSLog(@"%@", a.name);
                            [[self.currentArtist albums] addObject:a];
                            // NSLog(@"%lu",[[currentArtist albums] count]);
                        }
                        for (Album *a in self.currentArtist.albums) {
                            // NSLog(@"%@", a.idString);
                            [[APIController sharedInstance] getTrackApi:a.idString];
                        }
                    } else {
                        NSLog(@"Could not parse json");
                    }
                    [self passArtistToDataStore];
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
                //   NSLog(@"album api done");
            }] resume];
    
}

-(void) getTrackApi:(NSString *)albumIdString {
    
    NSString *urlString =[NSString stringWithFormat:@"https://api.spotify.com/v1/albums/%@/tracks", albumIdString];
    
    
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
                            //NSLog(@"%@", t.name);
                            for (Album *album in [self.currentArtist albums]) {
                                if ([album idString] == albumIdString) {
                                    [[album tracks] addObject:t];
                                }
                            }
                        }
                        [self passArtistToDataStore];
                    } else {
                        NSLog(@"Could not parse json");
                    }
                    [self passArtistToDataStore];
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
                //  NSLog(@"tracks api done");
            }] resume];
    
}

-(void) getTopTracksApi:(NSString *)artistIdString {
    
    NSString *urlString =[NSString stringWithFormat:@"https://api.spotify.com/v1/artists/%@/top-tracks?country=US", artistIdString];
    
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
                            // NSLog(@"%@", t.name);
                            [[self.currentArtist topTracks] addObject:t];
                        }
                    } else {
                        NSLog(@"Could not parse json");
                    }
                    [self passArtistToDataStore];
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
                //  NSLog(@"top tracks api done");
            }] resume];
}


-(void) getRelatedArtistsApi:(NSString *)artistIdString {
    
    NSString *urlString =[NSString stringWithFormat:@"https://api.spotify.com/v1/artists/%@/related-artists", artistIdString];
    
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
                            // NSLog(@"%@", a.name);
                            [[self.currentArtist relatedArtists] addObject:a];
                            
                        }
                    }
                    [self passArtistToDataStore];
                } else {
                    NSLog(@"I couldnt part the first json dictionary");
                }
                //  NSLog(@"related artist api done");
            }] resume];
    
    
}

-(void) passArtistToDataStore {
    BOOL allAlbumsLoaded = YES;
    
    for (Album *album in self.currentArtist.albums) {
        if (album.tracks.count == 0) {
            allAlbumsLoaded = NO;
        }
        
    }
    if (allAlbumsLoaded == YES) {
        [[[DataStore sharedInstance] artists] removeAllObjects];
        [[[DataStore sharedInstance] artists] addObject:self.currentArtist];
        NSArray *sharedArtists = [[[[DataStore sharedInstance] artists] firstObject] relatedArtists];
        NSLog(@"%lu", sharedArtists.count);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationTracksLoaded
                                                            object:nil
                                                          userInfo:nil];
        
    }
}

-(void) checkIfAllDataIsLoaded {
    
    BOOL allAlbumsLoaded = YES;
    
    for (Album *album in self.currentArtist.albums) {
        if (album.tracks.count == 0) {
            allAlbumsLoaded = NO;
        }
        
    }
}


@end
