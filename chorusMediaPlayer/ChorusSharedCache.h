//
//  ChorusSharedCache.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/22/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  MPMediaItem;

@interface ChorusSharedCache : NSObject

+ (ChorusSharedCache*)sharedInstance;

- (UIImage*)coverImageForMediaItem:(MPMediaItem*)mediaItem;
- (void)preloadAlbumCovers;

@end

