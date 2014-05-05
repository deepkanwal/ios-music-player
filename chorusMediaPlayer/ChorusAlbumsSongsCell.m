//
//  ChorusAlbumsSongsCell.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusAlbumsSongsCell.h"
#import "ChorusUIUtility.h"
#import <MediaPlayer/MediaPlayer.h>

const CGFloat kChorusAlbumsSongsCellHeight = 44.0f;

@interface ChorusAlbumsSongsCell ()

@property (weak, nonatomic) IBOutlet UILabel *trackNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackDurationLabel;

@end

@implementation ChorusAlbumsSongsCell

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

- (void)updateWithMediaItem:(MPMediaItem*)mediaItem
{
    
    [self.trackTitleLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkText]];
    [self.trackNumberLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkAccentText]];
    [self.trackDurationLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkAccentText]];
    
    [self.trackTitleLabel setText:[mediaItem valueForProperty:MPMediaItemPropertyTitle]];
    
    NSNumber *trackNumber = [mediaItem valueForProperty:MPMediaItemPropertyAlbumTrackNumber];
    NSNumber *trackDuration = [mediaItem valueForProperty:MPMediaItemPropertyPlaybackDuration];

    
    NSString *detailString = @"";
    if (trackNumber) {
     detailString = [NSString stringWithFormat:@"%zd", trackNumber.integerValue];
    }
    [self.trackNumberLabel setText:detailString];
    
    NSInteger minutes = (NSInteger)floor(trackDuration.floatValue / 60);
    NSInteger seconds = round(trackDuration.floatValue - (minutes * 60));
    NSString *durationString = [NSString stringWithFormat:@"%zd:%02zd", minutes, seconds];
    [self.trackDurationLabel setText:durationString];
}


@end
