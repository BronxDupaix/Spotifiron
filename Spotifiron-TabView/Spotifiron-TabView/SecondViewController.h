//
//  SecondViewController.h
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/8/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

