//
//  ChorusSongsCell.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChorusBaseTableViewCell.h"

@class MPMediaItem;

extern const CGFloat kChorusSongsCellHeight;

@interface ChorusSongsCell : ChorusBaseTableViewCell

- (void)updateWithMediaItem:(MPMediaItem*)mediaItem;

@end
