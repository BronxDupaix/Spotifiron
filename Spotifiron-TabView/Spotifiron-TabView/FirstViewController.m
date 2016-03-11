//
//  FirstViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "FirstViewController.h"
#import "APIController.h"

@interface FirstViewController () {

}

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
   [[APIController sharedInstance] getArtistApi:@"slayer"];
    
}


@end
