//
//  ArtistCollectionViewCell.h
//  Spotifiron-TabView
//
//  Created by Mitchell Phillips on 3/11/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtistCollectionViewCell : UICollectionViewCell

-(void)loadImageFromURLString:(NSString *)urlString;

@property (weak, nonatomic) IBOutlet UILabel *ArtistLabel;
@property (weak, nonatomic) IBOutlet UIImageView *artistImage;

@end
