//
//  SecondViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "SecondViewController.h"

#import "Album.h"

@interface SecondViewController ()

@property (strong, nonatomic) NSMutableArray *albumArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.albumArray = [[NSMutableArray alloc] init];
    
    NSArray *array = @[ @""];
    
    [self.albumArray addObjectsFromArray:array]; 

}



@end
