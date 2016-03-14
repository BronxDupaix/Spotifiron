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


-(void) getArtistApi:(NSString *)artistName;
-(void) getAlbumApi:(NSString *)artistIdString;
-(void) getTrackApi:(NSString *)albumIdString;
-(void) getTopTracksApi:(NSString *)artistIdString;
-(void) getRelatedArtistsApi:(NSString *)artistIdString;
-(void) passArtistToDataStore;

+ (id)sharedInstance;

@end



