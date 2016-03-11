//
//  Track.m
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "Track.h"

@implementation Track
+ (Track *)trackWithDictionary:(NSDictionary *)trackDictionary;
{
    
    
    Track *track = nil;
    if (trackDictionary) {
     
        track = [[Track alloc] init];
        track.name = [trackDictionary objectForKey:@"name"];
        
    }
    return track;
}
@end
