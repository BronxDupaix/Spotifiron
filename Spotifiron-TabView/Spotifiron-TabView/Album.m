//
//  Album.m
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "Album.h"

@implementation Album

+ (Album *)albumWithDictionary:(NSDictionary *)albumDictionary
{
    Album *album = nil;
    
    if (albumDictionary) {
        
        album = [[Album alloc] init];
        album.name = [albumDictionary objectForKey:@"name"];
        album.idString = [albumDictionary objectForKey:@"id"];
        NSArray *items = [albumDictionary objectForKey:@"images"];
        NSDictionary *item = items.lastObject;
        NSString *imageUrl = [item objectForKey:@"url"];
        album.imageUrl = imageUrl;
        NSLog(@"%@", album.imageUrl);
        
    }
    
   return album;
}

@end
