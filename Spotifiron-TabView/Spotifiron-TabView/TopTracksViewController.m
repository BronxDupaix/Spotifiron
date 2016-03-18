//
//  TopTracksViewController.m
//  Spotifiron-TabView
//
//  Created by Bronson Dupaix on 3/10/16.
//  Copyright © 2016 Bronson Dupaix. All rights reserved.
//

#import "TopTracksViewController.h"
#import "DataStore.h"
#import "TrackTableViewCell.h" 
#import "Artist.h" 
#import "Track.h" 
#import "ThemeManager.h" 
#import "Constants.h"
#import "APIController.h"
@import WebKit;

@interface TopTracksViewController ()

@property (strong, nonatomic) NSMutableArray *tracksArray;
@property (weak, nonatomic) IBOutlet UITextField *artistSearchTextField;
@property (strong, nonatomic) Artist * currentArtist;
@property (nonatomic, strong) WKWebView* webView;

@end

@implementation TopTracksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationThemeChanged
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationGetNewApi
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:kNotificationTracksLoaded
                                               object:nil];

    
    self.tracksArray = [[NSMutableArray alloc] init];
    
    [self updateUI];
}

-(void) updateUI {
    
    self.view.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];

    self.tracksArray = [[[[DataStore sharedInstance] artists] firstObject] topTracks];

    self.trackTableView.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor];
    
    [self.trackTableView reloadData];
    
}

- (IBAction)searchTapped:(UIButton *)sender {
    NSLog(@"search tapped");
    
    if (![self.artistSearchTextField.text isEqual: @""]) {
        
        NSString *str = self.artistSearchTextField.text;
        
        [[APIController sharedInstance] getArtistApi:str];
        
        self.artistSearchTextField.text = @"";
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Track *track = [self.tracksArray objectAtIndex:indexPath.row];
    
    TrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrackCell" forIndexPath: indexPath];
    
    
    cell.trackName.text = track.name;
    
    // [cell playButton:track.previewURL];
    
    
    
    NSLog(@" %@" , track.previewURL);
    
    cell.backgroundColor = [[ThemeManager sharedManager] currentBackgroundColor]; 
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tracksArray.count;
} 


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}


- (IBAction)playButton:(UIButton *)sender {
    
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    
    NSLog(@"play button pressed@");
    
    [self.view addSubview:self.webView]; 
    
    self.webView.backgroundColor = [UIColor blueColor];
    
    NSURL * url = [NSURL URLWithString:@"https://p.scdn.co/mp3-preview/0e079625cc7c025cb38895d8a9f339ae2fcd9d2f"];
    
    [self.webView loadRequest: [[NSURLRequest alloc] initWithURL:url]];
    
    // self.webView.allowsBackForwardNavigationGestures = YES;
}

@end
