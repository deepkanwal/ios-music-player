//
//  ChorusAlbumSectionHeader.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusAlbumSectionHeader.h"
#import "ChorusUIUtility.h"
#import "UIView+Frames.h"
#import "UIView+Effects.h"
#import "FXBlurView.h"

#import <MediaPlayer/MediaPlayer.h>

const CGFloat kChorusAlbumSectionHeaderHeight = 83.0f;

@interface ChorusAlbumSectionHeader ()
@property (weak, nonatomic) IBOutlet UIImageView *albumArtBluredImageView;
@property (weak, nonatomic) IBOutlet UIImageView *albumArtImageView;
@property (weak, nonatomic) IBOutlet UIView *alphaView;
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;
@property (weak, nonatomic) IBOutlet UILabel *numOfTracksLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UIView *albumArtContainerView;

@end

@implementation ChorusAlbumSectionHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateDropShadow];
}

- (void)updateWithMediaItem:(MPMediaItem*)mediaItem mediaItemCollection:(MPMediaItemCollection*)mediaItemCollection
{
    MPMediaItemArtwork *coverArt = [mediaItem valueForProperty:MPMediaItemPropertyArtwork];
    
    if (coverArt) {
        UIImage *image = [coverArt imageWithSize:CGSizeMake(10.0f, 10.0f)];
        image = [image blurredImageWithRadius:10.0f iterations:2 tintColor:nil];
        [self.albumArtBluredImageView setImage:image];
    }
    
    NSString *albumTitle = [mediaItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    [self.albumLabel setText:albumTitle ?: @"Unknown Album"];
    
    NSString *detailString = [NSString stringWithFormat:@"%lu tracks", (unsigned long)mediaItemCollection.items.count];
    [self.numOfTracksLabel setText:detailString];
    
    
    NSNumber *date = [mediaItem valueForProperty:@"year"];

    if (date) {
        NSInteger year = [date integerValue];
        [self.yearLabel setText:[NSString stringWithFormat:@"%ld", (long)year]];
    } else {
        [self.yearLabel setText:@""];
    }
    
    if (coverArt) {
        UIImage *image = [coverArt imageWithSize:self.albumArtImageView.size];
        [self.albumArtImageView setImage:image];
    }
    
    if ([ChorusUIUtility sharedInstance].currentTheme == ChorusThemeDark) {
        [self.alphaView setBackgroundColor:[UIColor blackColor]];
        [self.albumArtBluredImageView setAlpha:0.8];
        [self.alphaView setAlpha:0.6];
    } else {
        [self.alphaView setBackgroundColor:[[ChorusUIUtility sharedInstance] colorForNavBar]];
        [self.alphaView setAlpha:0.3];
        [self.albumArtBluredImageView setAlpha:0.95];
    }
}

@end
