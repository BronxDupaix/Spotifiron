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

@interface TopTracksViewController () <UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray *tracksArray;
@property (weak, nonatomic) IBOutlet UITextField *artistSearchTextField;
@property (strong, nonatomic) Artist * currentArtist;
@property (nonatomic, strong) WKWebView* webView;
@property (nonatomic, strong) NSString* songPreview;
@property (nonatomic, strong) UIButton*playButton;

@end

@implementation TopTracksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.artistSearchTextField.delegate = self;
    
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

-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    
   // [self.webView];
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
    [self.artistSearchTextField resignFirstResponder];
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.artistSearchTextField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.artistSearchTextField resignFirstResponder];
    return NO;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Track *track = [self.tracksArray objectAtIndex:indexPath.row];
    
    TrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrackCell" forIndexPath: indexPath];
    
    cell.trackName.text = track.name;
    
   // [self.passPreviewUrl(track.previewURL)];
    
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

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Track *track = [self.tracksArray objectAtIndex:indexPath.row];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    
    self.playButton = [[UIButton alloc] initWithFrame:CGRectMake(8, 8, 70, 45)];
    
    [self.playButton addTarget:self action:@selector(dismissViews) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"play button pressed@");
    
    [self.view addSubview:self.webView];
    
    self.webView.backgroundColor = [UIColor clearColor];
    
    NSURL * url = [NSURL URLWithString: track.previewURL];
    
    [self.view addSubview:self.playButton];
    
    [self.view bringSubviewToFront:self.playButton];
    
    self.playButton.backgroundColor = [UIColor clearColor];
    
    [self.playButton setTitle:@"Close" forState:UIControlStateNormal];
    
    self.playButton.titleLabel.textColor = [UIColor redColor];
    
    [self.webView loadRequest: [[NSURLRequest alloc] initWithURL:url]];
    
}

-(void)dismissViews{
    
    self.webView.hidden = YES;
    
    self.playButton.hidden = YES;
}




@end
