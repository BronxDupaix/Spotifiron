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
#import "ThemeManager.h"
#import "Constants.h"

@interface SecondViewController ()

@property (strong, nonatomic) NSMutableArray *albumArray;

@property (strong , nonatomic) Artist *currentArtist;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Theme Changed Notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationThemeChanged
                                               object:nil];
    // Api Changed Notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationGetNewApi
                                               object:nil];
   
    
    self.albumArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *artists = [[DataStore sharedInstance]artists];
    for (Artist *a in artists){
        self.currentArtist = a;
    }
    
    if (self.currentArtist !=nil) {
        NSMutableArray *albumsArray = self.currentArtist.albums;
        for (Album *album in albumsArray){
             NSLog(@"%@" , album.name);
            [self.albumArray addObject:album];
        }
    }
    
    [[self collectionView] reloadData]; 
}

-(void) updateUI {
    
    self.view.backgroundColor = [[ThemeManager sharedManager] secondViewColor];
    
    NSMutableArray *artists = [[DataStore sharedInstance]artists];
    for (Artist *a in artists){
        self.currentArtist = a;
    }
    
    if (self.currentArtist !=nil) {
        [self.albumArray removeAllObjects]; 
        
        NSMutableArray *albumsArray = self.currentArtist.albums;
        for (Album *album in albumsArray){
           // NSLog(@"%@" , album.name);
            [self.albumArray addObject:album];
        }
    }

    
    [self.collectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView

    cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AlbumCollectionViewCell *cell = [collectionView   dequeueReusableCellWithReuseIdentifier:@"AlbumCell" forIndexPath:indexPath];
    
    Album* album = [self.albumArray objectAtIndex:indexPath.row];
    
    cell.albumImage.image = nil;
    
    cell.albumName.text = @""; 
    
    cell.albumName.text = album.name;
    
    [cell loadImageFromURLString: album.imageUrl];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.albumArray.count;
}

@end
