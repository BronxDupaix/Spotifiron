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


@interface TopTracksViewController ()

@property (strong, nonatomic) NSMutableArray *tracksArray;

@property (strong, nonatomic) Artist * currentArtist; 

@end

@implementation TopTracksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationThemeChanged
                                               object:nil];
    
    self.tracksArray = [[NSMutableArray alloc] init];
    
    NSMutableArray* artists = [[DataStore sharedInstance]artists]; 

    for (Artist *a in artists){
        
        self.currentArtist = a;
    }
    
    if (self.currentArtist !=nil) {
        
        NSMutableArray *tracks = self.currentArtist.topTracks;
        
        for (Track *track in tracks){ 
            
            // NSLog(@"%@" , track.name);
            
            [self.tracksArray addObject:track];
        }
    }

}

-(void) updateUI {
    
    self.view.backgroundColor = [[ThemeManager sharedManager] currentViewColor];
    
    self.trackTableView.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor]; 
    
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
    
    return 100; 
}


@end
