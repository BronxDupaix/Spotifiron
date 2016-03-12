//
//  DataStore.m
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+ (id)sharedInstance {
    static DataStore *sharedInstance = nil;
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
    if ( self = [super init] ) {
        self.albums = [[NSMutableArray alloc] init];
    }
    if ( self = [super init] ) {
        self.tracks = [[NSMutableArray alloc] init];
    }
    if ( self = [super init] ) {
        self.relatedArtists = [[NSMutableArray alloc] init];
    }
    if ( self = [super init] ) {
        self.topTracks = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
