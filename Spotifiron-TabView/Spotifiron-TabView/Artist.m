//
//  Artist.m
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "Artist.h"

@implementation Artist


+ (Artist *)artistWithDictionary:(NSDictionary *)artistDictionary
{
    Artist *artist = nil;
    
    if (artistDictionary) {
        
        artist = [[Artist alloc] init];
        artist.name = [artistDictionary objectForKey:@"name"];
        artist.idString = [artistDictionary objectForKey:@"id"];
        NSArray *items = [artistDictionary objectForKey:@"images"];
        NSDictionary *item = [items objectAtIndex:2];
        NSString *imageUrl = [item objectForKey:@"url"];
        artist.imageUrl = imageUrl;
    } else {
         NSLog(@"issue with parsing artist image urls");
    }
    
    
    return artist;
}
-(instancetype)init {
    
    if ( self = [super init] ) {
        
        self.albums = [[NSMutableArray alloc] init];
        self.topTracks = [[NSMutableArray alloc] init];
        self.relatedArtists = [[NSMutableArray alloc] init];
        
    }
    return self;
}


@end
