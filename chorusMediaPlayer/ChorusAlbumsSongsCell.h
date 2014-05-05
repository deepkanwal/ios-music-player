//
//  ChorusAlbumsSongsCell.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChorusBaseTableViewCell.h"

@class MPMediaItem;

extern const CGFloat kChorusAlbumsSongsCellHeight;

@interface ChorusAlbumsSongsCell : ChorusBaseTableViewCell

- (void)updateWithMediaItem:(MPMediaItem*)mediaItem;

@end
