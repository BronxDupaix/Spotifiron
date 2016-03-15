//
//  SecondViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "SecondViewController.h"
#import "Artist.h" 
#import "Album.h"
#import "AlbumCollectionViewCell.h"
#import "DataStore.h"
#import "APIController.h"

@interface SecondViewController ()

@property (strong, nonatomic) NSMutableArray *albumArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.albumArray = [[NSMutableArray alloc] init];
    
    [self.albumArray addObject:@"Meteora"];
    
    [self.albumArray addObject:@"Relapse"];

     self.albumArray = [[[[DataStore sharedInstance] albums] firstObject] albumArray];
    
    NSArray *albums =[[DataStore sharedInstance] albums];
    
    NSLog(@"Number of items in album array is: %lu", (unsigned long)[self.albumArray count]); 

    [self.albumArray addObjectsFromArray:albums];

    
    [[self collectionView] reloadData]; 
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView

    cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AlbumCollectionViewCell *cell = [collectionView   dequeueReusableCellWithReuseIdentifier:@"AlbumCell" forIndexPath:indexPath];
    
    Album* album = [self.albumArray objectAtIndex:indexPath.row];
    
    //  cell.albumImage.image = nil;
   //  cell.albumName.text = @"";
    
    cell.albumName.text = album.name;
    
   // [cell loadImageFromURLString: album.imageUrl];
    
    return cell;
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.albumArray.count;
}






@end
