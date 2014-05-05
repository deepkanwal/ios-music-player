//
//  ChorusAlbumSectionHeader.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MPMediaItem, MPMediaItemCollection;

extern const CGFloat kChorusAlbumSectionHeaderHeight;

@interface ChorusAlbumSectionHeader : UIView

- (void)updateWithMediaItem:(MPMediaItem*)mediaItem mediaItemCollection:(MPMediaItemCollection*)mediaItemCollection;

@end
