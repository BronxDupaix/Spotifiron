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

@interface SecondViewController () <UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray *albumArray;
@property (weak, nonatomic) IBOutlet UITextField *artistSearchTextField;
@property (strong , nonatomic) Artist *currentArtist;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.artistSearchTextField.delegate = self;
    
        // Theme Changed Notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationThemeChanged
                                               object:nil];
    // Api Changed Notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationTracksLoaded
                                               object:nil];
    
    self.albumArray = [[NSMutableArray alloc] init];
 
    if ([[[DataStore sharedInstance] artists] firstObject] != nil) {
        self.albumArray = [[[[DataStore sharedInstance] artists] firstObject] albums];
        [[self collectionView] reloadData];
    }
}

-(void) updateUI {
    
    self.view.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];
    
    self.albumArray = [[[[DataStore sharedInstance] artists] firstObject] albums];
    
    [self.collectionView reloadData];
}

- (IBAction)searchTapped:(UIButton *)sender {
    NSLog(@"search tapped");
    
    if (![self.artistSearchTextField.text isEqual: @""]) {
        
        NSString *str = self.artistSearchTextField.text;
        
        [[APIController sharedInstance] getArtistApi:str];
        
        self.artistSearchTextField.text = @"";

    }
    [self.artistSearchTextField resignFirstResponder];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.artistSearchTextField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.artistSearchTextField resignFirstResponder];
    return NO;
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
