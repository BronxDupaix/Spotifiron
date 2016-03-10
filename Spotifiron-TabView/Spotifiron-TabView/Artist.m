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
        NSDictionary *item = items.lastObject;
        NSString *imageUrl = [item objectForKey:@"url"];
        artist.imageUrl = imageUrl;
        NSLog(@"%@", artist.imageUrl);
        
    }
    
    return artist;
}


@end
