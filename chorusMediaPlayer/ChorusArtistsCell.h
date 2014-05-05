//
//  ChorusArtistsCell.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChorusBaseTableViewCell.h"

@class MPMediaItem, MPMediaItemCollection;

extern const CGFloat kChorusArtistsCellHeight;

@interface ChorusArtistsCell : ChorusBaseTableViewCell

- (void)updateWithMediaItem:(MPMediaItem*)mediaItem mediaItemCollection:(MPMediaItemCollection*)mediaItemCollection;

@end
