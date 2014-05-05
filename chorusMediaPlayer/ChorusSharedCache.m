//
//  ChorusSharedCache.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/22/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusSharedCache.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ChorusSharedCache ()
@property (strong, nonatomic) NSMutableDictionary *dict;
@end

@implementation ChorusSharedCache

+ (ChorusSharedCache*)sharedInstance
{
    static ChorusSharedCache *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ChorusSharedCache alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)preloadAlbumCovers
{
    MPMediaQuery *albumsQuery = [MPMediaQuery albumsQuery];
    for (MPMediaItemCollection *album in [albumsQuery collections]) {
        MPMediaItem *representativeItem = [album representativeItem];
        MPMediaItemArtwork *coverArt = [representativeItem valueForProperty:MPMediaItemPropertyArtwork];
        NSString *key = [representativeItem valueForProperty:MPMediaItemPropertyAlbumPersistentID];
        if (coverArt) {
            UIImage *image = [coverArt imageWithSize:CGSizeMake(100.0f, 100.0f)];
            if (image && key) {
                [self.dict setObject:image forKey:key];
            }
        }
    }
}

- (UIImage*)coverImageForMediaItem:(MPMediaItem*)mediaItem
{
    NSString *albumKey =  [mediaItem valueForProperty:MPMediaItemPropertyAlbumPersistentID];
    return [self.dict objectForKey:albumKey];
}

@end
