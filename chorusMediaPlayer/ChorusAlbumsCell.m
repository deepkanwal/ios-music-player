//
//  ChorusAlbumsCell.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusAlbumsCell.h"
#import "ChorusUIUtility.h"
#import "UIView+Frames.h"
#import "UIView+Effects.h"
#import <MediaPlayer/MediaPlayer.h>

const CGFloat kChorusAlbumsCellHeight = 90.0f;

@interface ChorusAlbumsCell ()

@property (weak, nonatomic) IBOutlet UIView *albumArtContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *albumArtImageView;
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@end

@implementation ChorusAlbumsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

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
    
    [self.albumTitleLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkText]];
    [self.artistTitleLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkAccentText]];
    [self.detailsLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkAccentText]];
    
    NSString *albumTitle = [mediaItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    [self.albumTitleLabel setText:albumTitle ?: @"Unknown Album"];
    
    NSString *artistTitle = [mediaItem valueForProperty:MPMediaItemPropertyAlbumArtist];
    [self.artistTitleLabel setText:artistTitle ?: @"Unknown Artist"];
    
    NSString *detailString = [NSString stringWithFormat:@"%lu tracks", (unsigned long)mediaItemCollection.items.count];
    
    [self.detailsLabel setText:detailString];
    

    MPMediaItemArtwork *coverArt = [mediaItem valueForProperty:MPMediaItemPropertyArtwork];
    UIImage *image;
    if (coverArt) {
        image = [coverArt imageWithSize:self.albumArtImageView.size];
    }

    [self.albumArtImageView setImage:image];
}

@end
