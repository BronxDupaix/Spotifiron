//
//  SecondViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "SecondViewController.h"
#import "Album.h"
#import "AlbumCollectionViewCell.h"

@interface SecondViewController ()

@property (strong, nonatomic) NSMutableArray *albumArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.albumArray = [[NSMutableArray alloc] init];
    
    // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"AlbumCell"];
    
    [self.albumArray addObject:@"Meteora"];
    
    [self.albumArray addObject:@"Relapse"];
    
    [self.albumArray addObject:@"Eminem Show"];
    
    [self.albumArray addObject:@"Hybrid Theory"];
    
    [self.albumArray addObject:@"Meteora"];
    
    [self.albumArray addObject:@"Relapse"];
    
    [self.albumArray addObject:@"Eminem Show"];
    
    [self.albumArray addObject:@"Hybrid Theory"];
    
    [self.albumArray addObject:@"Meteora"];
    
    [self.albumArray addObject:@"Relapse"];
    
    [self.albumArray addObject:@"Eminem Show"];
    
    [self.albumArray addObject:@"Hybrid Theory"];
    
    [self.albumArray addObject:@"Meteora"];
    
    [self.albumArray addObject:@"Relapse"];
    
    [self.albumArray addObject:@"Eminem Show"];
    
    [self.albumArray addObject:@"Hybrid Theory"];

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView

    cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* album = [self.albumArray objectAtIndex:indexPath.row];
    
    
    AlbumCollectionViewCell *cell = [collectionView   dequeueReusableCellWithReuseIdentifier:@"AlbumCell" forIndexPath:indexPath];
    
    cell.albumName.text = album;
    
    cell.albumImage.image = [UIImage imageNamed:@"PinkFloyd"];
    
    return cell;
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.albumArray.count;
}






@end
