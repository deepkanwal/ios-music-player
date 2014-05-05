//
//  ChorusArtistsCell.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusArtistsCell.h"
#import "ChorusUIUtility.h"
#import "UIView+Frames.h"
#import "UIView+Effects.h"
#import <MediaPlayer/MediaPlayer.h>

const CGFloat kChorusArtistsCellHeight = 75.0f;

@interface ChorusArtistsCell ()

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *artistImageView;
@property (weak, nonatomic) IBOutlet UIView *imageContainerView;

@end

@implementation ChorusArtistsCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}


- (void)updateWithMediaItem:(MPMediaItem*)mediaItem mediaItemCollection:(MPMediaItemCollection*)mediaItemCollection
{
    
    [self.artistLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkText]];
    [self.detailsLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkAccentText]];

    
    NSString *artistTitle = [mediaItem valueForProperty:MPMediaItemPropertyAlbumArtist];
    [self.artistLabel setText:artistTitle ?: @"Unknown Artist"];
    
    NSString *detailString = [NSString stringWithFormat:@"%lu tracks", (unsigned long)mediaItemCollection.items.count];
    [self.detailsLabel setText:detailString];
    
    MPMediaItemArtwork *coverArt = [mediaItem valueForProperty:MPMediaItemPropertyArtwork];
    
    if (coverArt) {
        UIImage *image = [coverArt imageWithSize:self.artistImageView.size];
        [self.artistImageView setImage:image];
    }
}

@end
