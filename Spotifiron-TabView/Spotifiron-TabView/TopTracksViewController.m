//
//  TopTracksViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "TopTracksViewController.h"
#import "DataStore.h"
#import "TrackTableViewCell.h" 
#import "Artist.h" 
#import "Track.h" 
#import "ThemeManager.h" 
#import "Constants.h"
#import "APIController.h"


@interface TopTracksViewController ()

@property (strong, nonatomic) NSMutableArray *tracksArray;
@property (weak, nonatomic) IBOutlet UITextField *artistSearchTextField;
@property (strong, nonatomic) Artist * currentArtist; 

@end

@implementation TopTracksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationThemeChanged
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationGetNewApi
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationTracksLoaded
                                               object:nil];

    
    self.tracksArray = [[NSMutableArray alloc] init];
    
    [self updateUI];
}

-(void) updateUI {
    
    self.view.backgroundColor = [[ThemeManager sharedManager] currentViewColor];

    self.tracksArray = [[[[DataStore sharedInstance] artists] firstObject] topTracks];

    self.trackTableView.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];
    
    [self.trackTableView reloadData];
    
}

- (IBAction)searchTapped:(UIButton *)sender {
    NSLog(@"search tapped");
    
    if (![self.artistSearchTextField.text isEqual: @""]) {
        
        NSString *str = self.artistSearchTextField.text;
        
        [[APIController sharedInstance] getArtistApi:str];
        
        self.artistSearchTextField.text = @"";
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Track *track = [self.tracksArray objectAtIndex:indexPath.row];
    
    TrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrackCell" forIndexPath: indexPath];
    
    
    cell.trackName.text = track.name;
    
    cell.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor]; 
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tracksArray.count;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}


@end
