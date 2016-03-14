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

@interface FirstViewController () {
    
}

@property (strong, nonatomic) NSMutableArray *artistArray;

@property (weak, nonatomic) DataStore *dataStore;


@end


@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[APIController sharedInstance] getArtistApi:@"slayer"];
    
    // NSArray *artists = [[DataStore sharedInstance] relatedArtists];
    
    // NSLog(@"ArtistArray %@", artists);
    
    self.artistArray = [[NSMutableArray alloc] init];
    
    // [self.artistArray  addObjectsFromArray:artists];
    
    [self.artistArray addObject:@"Slayer"];
    
    [self.artistArray addObject:@"Megadeth"];
    
    [self.artistArray addObject:@"Eminem"];
    
    [self.artistArray addObject:@"Lil Wayne"];
    
    [self.artistArray addObject:@"Megadeth"];
    
    [self.artistArray addObject:@"Eminem"];
    
    [self.artistArray addObject:@"Lil Wayne"];
    
    [self.artistArray addObject:@"Slayer"];
    
    [self.artistArray addObject:@"Megadeth"];
    
    [self.artistArray addObject:@"Eminem"];
    
    [self.artistArray addObject:@"Lil Wayne"];
    
    [self.artistArray addObject:@"Megadeth"];
    
    [self.artistArray addObject:@"Eminem"];
    
    [self.artistArray addObject:@"Lil Wayne"];
    
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)

collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ArtistCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArtistCell" forIndexPath:indexPath] ; 
    
    NSString* artist = [self.artistArray objectAtIndex:indexPath.row];
    
    cell.ArtistLabel.text = artist;
    
    cell.artistImage.image = [UIImage imageNamed:@"Slayer"];
    
    return cell;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.artistArray.count;
}



@end
