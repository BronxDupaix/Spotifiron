//
//  FirstViewController.h
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Artist.h" 
#import "Theme.h"
#import "DataStore.h" 

@protocol fetchArtist <NSObject> 

@end


@interface FirstViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate> 

@property (weak, nonatomic) IBOutlet UICollectionView *artistCollectionView;
    


@end

