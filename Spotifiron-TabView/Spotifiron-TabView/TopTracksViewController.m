//
//  TopTracksViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "TopTracksViewController.h"

#import "TrackTableViewCell.h" 

@interface TopTracksViewController ()

@property (strong, nonatomic) NSMutableArray *tracksArray;

@end

@implementation TopTracksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tracksArray = [[NSMutableArray alloc] init];
    
    [self.tracksArray addObject:@"Hello"];
    
    [self.tracksArray addObject:@"Cold world"];
    
    [self.tracksArray addObject:@"Wizard"];
    
    [self.tracksArray addObject:@"Bloodlust"];
    
    [self.tracksArray addObject:@"Drugs"];
    
    [self.tracksArray addObject:@"Green Arrow"];
    
    [self.tracksArray addObject:@"Hello"];
    
    [self.tracksArray addObject:@"Cold world"];
    
    [self.tracksArray addObject:@"Wizard"];
    
    [self.tracksArray addObject:@"Bloodlust"];
    
    [self.tracksArray addObject:@"Drugs"];
    
    [self.tracksArray addObject:@"Green Arrow"];
    
    [self.tracksArray addObject:@"Hello"];
    
    [self.tracksArray addObject:@"Cold world"];
    
    [self.tracksArray addObject:@"Wizard"];
    
    [self.tracksArray addObject:@"Bloodlust"];
    
    [self.tracksArray addObject:@"Drugs"];
    
    [self.tracksArray addObject:@"Green Arrow"];
    
    [self.tracksArray addObject:@"Hello"];
    
    [self.tracksArray addObject:@"Cold world"];
    
    [self.tracksArray addObject:@"Wizard"];
    
    [self.tracksArray addObject:@"Bloodlust"];
    
    [self.tracksArray addObject:@"Drugs"];
    
    [self.tracksArray addObject:@"Green Arrow"];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *track = [self.tracksArray objectAtIndex:indexPath.row];
    
    TrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrackCell" forIndexPath: indexPath];
    
    cell.trackName.text = track;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tracksArray.count;
}





@end
