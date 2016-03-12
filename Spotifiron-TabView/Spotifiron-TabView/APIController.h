//
//  APIController.h
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIController : NSObject

@property (nonatomic) BOOL hasFinishedAlbumApi;
@property (nonatomic) BOOL hasFinishedRelatedArtistApi;
@property (nonatomic) BOOL hasFinishedArtistApi;
@property (nonatomic) BOOL hasFinishedTrackApi;
@property (nonatomic) BOOL hasFinishedTopTracksApi;
@property (nonatomic, strong) NSMutableArray *artists;
@property (nonatomic, strong) NSMutableArray *albums;
@property (nonatomic, strong) NSMutableArray *tracks;
@property (nonatomic, strong) NSMutableArray *topTracks;
@property (nonatomic, strong) NSMutableArray *relatedArtists;

-(void) getArtistApi:(NSString *)artistName;
-(void) getAlbumApi:(NSString *)artistIdString;
-(void) getTrackApi:(NSString *)albumIdString;
-(void) getTopTracksApi:(NSString *)artistIdString;
-(void) getRelatedArtistsApi:(NSString *)artistIdString;
-(void) passArtistToDataStore;

+ (id)sharedInstance;

@end



