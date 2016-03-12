//
//  Artist.h
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *idString;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSMutableArray *albums;
@property (nonatomic, strong) NSMutableArray *topTracks;
@property (nonatomic, strong) NSMutableArray *relatedArtists;

+ (Artist *)artistWithDictionary:(NSDictionary *)artistDictionary;

@end
