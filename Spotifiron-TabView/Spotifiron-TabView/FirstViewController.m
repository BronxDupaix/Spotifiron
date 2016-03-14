//
//  FirstViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "FirstViewController.h"
#import "APIController.h"
#import "Theme.h"
#import "ArtistCollectionViewCell.h"
#import "DataStore.h"

@interface FirstViewController () {

}

@property (strong, nonatomic) NSMutableArray *relatedArtists;

//@property (weak, nonatomic) DataStore *dataStore;


@end


@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
   [[APIController sharedInstance] getArtistApi:@"slayer"];
    
    self.relatedArtists = [[[[DataStore sharedInstance] artists] firstObject] relatedArtists];
    [[self artistCollectionView] reloadData];
   
    
   // [self.artistArray  addObjectsFromArray:artists];
//    
 //   [self.relatedArtists addObject:@"Slayer"];
//    
//    [self.artistArray addObject:@"Megadeth"];
//    
//    [self.artistArray addObject:@"Eminem"];
//    
//    [self.artistArray addObject:@"Lil Wayne"];
//    
//    [self.artistArray addObject:@"Megadeth"];
//    
//    [self.artistArray addObject:@"Eminem"];
//    
//    [self.artistArray addObject:@"Lil Wayne"];
//    
//    [self.artistArray addObject:@"Slayer"];
//    
//    [self.artistArray addObject:@"Megadeth"];
//    
//    [self.artistArray addObject:@"Eminem"];
//    
//    [self.artistArray addObject:@"Lil Wayne"];
//    
//    [self.artistArray addObject:@"Megadeth"];
//    
//    [self.artistArray addObject:@"Eminem"];
//    
//    [self.artistArray addObject:@"Lil Wayne"];
    
    }

-(UICollectionViewCell *) collectionView:(UICollectionView *)

    collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     ArtistCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.relatedArtists objectAtIndex:indexPath.row];
    
    cell.ArtistLabel.text = artist.name;
    
    cell.artistImage.image = [UIImage imageNamed:@"Slayer"];

    return cell;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.relatedArtists.count;
}



@end
