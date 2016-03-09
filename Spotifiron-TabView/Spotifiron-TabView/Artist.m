//
//  Artist.m
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "Artist.h"

@implementation Artist
-(instancetype)initWithDictionary:(NSDictionary *)dict {
    
    if(self = [super init] ) {
        self.name = [dict valueForKey:@"name"];
    }
    if(self = [super init] ) {
        self.idString = [dict valueForKey:@"id"];
    }
//    if(self = [super init] ) {
//        self.imageUrls = [dict ]
//    }
    return self;
    
    
}
@end
