//
//  APIController.h
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIController : NSObject
@property (nonatomic, strong) NSMutableArray *artists;
@property (nonatomic, strong) NSMutableArray *albums;
@property (nonatomic, strong) NSMutableArray *tracks;
@property (nonatomic, strong) NSMutableArray *topTracks;
@property (nonatomic, strong) NSMutableArray *relatedArtists;

-(void) getArtistApi;
-(void) getAlbumApi;
-(void) getTrackApi;
-(void) getTopTracksApi;
-(void) getRelatedArtistsApi;

+ (id)sharedInstance;

@end



