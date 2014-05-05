//
//  ChorusNowPlayingViewController.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusNowPlayingViewController.h"
#import "ChorusUIUtility.h"
#import "UIView+Frames.h"
#import "UIView+Effects.h"
#import "UIView+Animations.h"
#import "FXBlurView.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ChorusNowPlayingViewController ()

@property (strong, nonatomic) MPMusicPlayerController *audioPlayer;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *albumArtImageView;

@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property (weak, nonatomic) IBOutlet UILabel *trackTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@end

@implementation ChorusNowPlayingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.audioPlayer = [MPMusicPlayerController iPodMusicPlayer];
    
    if (self.currentSongIndex < self.nowPlayingList.count) {
        MPMediaItem *song = [self.nowPlayingList objectAtIndex:self.currentSongIndex];
        MPMediaItemCollection *queue = [MPMediaItemCollection collectionWithItems:self.nowPlayingList];
        
        [self.audioPlayer setQueueWithItemCollection:queue];
        [self.audioPlayer setNowPlayingItem:song];
        [self.audioPlayer play];
        
    } else {
        
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNowPlayingScreen) name:MPMusicPlayerControllerPlaybackStateDidChangeNotification object:self.audioPlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNowPlayingScreen) name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:self.audioPlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNowPlayingScreen) name:MPMusicPlayerControllerVolumeDidChangeNotification object:self.audioPlayer];
    
    [self.audioPlayer beginGeneratingPlaybackNotifications];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    
    [self updateNowPlayingScreen];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMusicPlayerControllerVolumeDidChangeNotification object:self.audioPlayer];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:self.audioPlayer];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMusicPlayerControllerPlaybackStateDidChangeNotification object:self.audioPlayer];
    
    [self.audioPlayer endGeneratingPlaybackNotifications];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    
    [[ChorusUIUtility sharedInstance] updateStatusBar];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions


- (IBAction)actionPlayPauseButtonPressed:(id)sender {
    if (self.audioPlayer.playbackState != MPMusicPlaybackStatePlaying) {
        [self.audioPlayer play];
    } else {
        [self.audioPlayer pause];
    }
}

- (IBAction)actionNextButtonPressed:(id)sender {
    [self.audioPlayer skipToNextItem];
    [ChorusUIUtility sharedInstance].currentTheme = ChorusThemeLight;
}

- (IBAction)actionPreviousButtonPressed:(id)sender {
    [self.audioPlayer skipToPreviousItem];
    [ChorusUIUtility sharedInstance].currentTheme = ChorusThemeDark;
}

- (IBAction)actionDismissButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)updateNowPlayingScreen
{
    MPMediaItem *mediaItem = self.audioPlayer.nowPlayingItem;
    
    [self.trackTitleLabel setText:[mediaItem valueForProperty:MPMediaItemPropertyTitle]];
    
    NSString *albumName = [mediaItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    NSString *artistName = [mediaItem valueForProperty:MPMediaItemPropertyAlbumArtist];
    NSString *detailsString = [NSString stringWithFormat:@"%@ - %@", albumName, artistName ?: @"Unknown Artist"];
    
    [self.detailsLabel setText:detailsString];
    
    if (self.audioPlayer.playbackState != MPMusicPlaybackStatePlaying) {
        [self.playPauseButton setTitle:@"play" forState:UIControlStateNormal];
    } else {
        [self.playPauseButton setTitle:@"pause" forState:UIControlStateNormal];
    }
    
    MPMediaItemArtwork *coverArt = [mediaItem valueForProperty:MPMediaItemPropertyArtwork];
    if (coverArt) {
        UIImage *image = [coverArt imageWithSize:self.albumArtImageView.size];
        
        UIImage *smallImage = [coverArt imageWithSize:CGSizeMake(15.0f, 15.0f)];

        UIImage *bluredImage = [smallImage blurredImageWithRadius:15.0f iterations:2 tintColor:nil];
        
        [self.albumArtImageView setImage:image];
        [self.backgroundImageView setImage:bluredImage];
    }

}

#pragma mark - Orientation

- (void)orientationChanged:(NSNotification*)notification
{
    UIDevice *device = notification.object;
    switch (device.orientation) {
        case UIDeviceOrientationPortrait:
            break;
        case UIDeviceOrientationLandscapeLeft:
            break;
        case UIDeviceOrientationLandscapeRight:
        default:
            break;
    }
}

- (void)layoutForLandscape
{
    
}

@end
