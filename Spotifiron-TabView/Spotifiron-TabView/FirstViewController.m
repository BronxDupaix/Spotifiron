//
//  FirstViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "FirstViewController.h"
#import "APIController.h"
#import "ThemeManager.h"
#import "ArtistCollectionViewCell.h"
#import "DataStore.h"
#import "Constants.h"

@interface FirstViewController () {
    
}

@property (strong, nonatomic) NSMutableArray *relatedArtists;

@end


@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataLoaded)
                                                 name:kNotificationTracksLoaded
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationThemeChanged
                                               object:nil];
    
    [[APIController sharedInstance] getArtistApi:@"slayer"];
    
    self.relatedArtists = [[NSMutableArray alloc] init];
    
    [self updateUI];
    
    
}

-(void)updateUI
{
    
    NSLog(@"\n\nUpdateUI\n\n");
    
    self.view.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];
    
    [[self artistCollectionView] reloadData];
}

- (void)dataLoaded {
    
    self.relatedArtists = [[[[DataStore sharedInstance] artists] firstObject] relatedArtists];
    [[self artistCollectionView] reloadData];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)

collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ArtistCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    cell.artistImage.image = nil;
    cell.ArtistLabel.text = @"";
    
    
    Artist *artist = [self.relatedArtists objectAtIndex:indexPath.row];
    
    cell.ArtistLabel.text = artist.name;
    
    [cell loadImageFromURLString:artist.imageUrl];
    
    return cell;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.relatedArtists.count;
}



@end
