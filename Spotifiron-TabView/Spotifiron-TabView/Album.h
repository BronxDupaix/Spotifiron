//
//  Album.h
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *idString;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSMutableArray *tracks;

+ (Album *)albumWithDictionary:(NSDictionary *)albumDictionary;

@end
