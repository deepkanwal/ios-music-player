//
//  ChorusSongsCell.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusSongsCell.h"
#import "ChorusUIUtility.h"
#import "UIView+Frames.h"
#import "UIView+Effects.h"
#import <MediaPlayer/MediaPlayer.h>

const CGFloat kChorusSongsCellHeight = 75.0f;

@interface ChorusSongsCell ()
@property (weak, nonatomic) IBOutlet UIView *imageViewContainer;

@property (weak, nonatomic) IBOutlet UIImageView *albumArtImageView;
@property (weak, nonatomic) IBOutlet UILabel *trackLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@end

@implementation ChorusSongsCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)updateWithMediaItem:(MPMediaItem*)mediaItem
{
    
    [self.trackLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkText]];
    [self.detailsLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkAccentText]];
    
    [self.trackLabel setText:[mediaItem valueForProperty:MPMediaItemPropertyTitle]];
    
    NSString *albumTitle = [mediaItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    NSString *albumArtist = [mediaItem valueForProperty:MPMediaItemPropertyAlbumArtist];
    
    NSString *detailString = [NSString stringWithFormat:@"%@ - %@", albumArtist, albumTitle];
    
    [self.detailsLabel setText:detailString];
    
    MPMediaItemArtwork *coverArt = [mediaItem valueForProperty:MPMediaItemPropertyArtwork];
    
    if (coverArt) {
        UIImage *image = [coverArt imageWithSize:self.albumArtImageView.size];
        [self.albumArtImageView setImage:image];
    }
}

@end
