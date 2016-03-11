//
//  Track.h
//  Spotifiron-TabView
//
//  Created by Sean Calkins on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject
@property (nonatomic, strong) NSString *name;

+ (Track *)trackWithDictionary:(NSDictionary *)trackDictionary;

@end
