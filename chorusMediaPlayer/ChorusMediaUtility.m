//
//  ChorusMediaUtility.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusMediaUtility.h"

#import <MediaPlayer/MediaPlayer.h>

@implementation ChorusMediaUtility


+ (MPMediaPropertyPredicate*)artistPredicateForName:(NSString*)artistName
{
    return [MPMediaPropertyPredicate predicateWithValue:artistName forProperty:MPMediaItemPropertyAlbumArtist comparisonType:MPMediaPredicateComparisonEqualTo];
}

+ (MPMediaPropertyPredicate*)albumPredicateForName:(NSString*)albumName
{
    return [MPMediaPropertyPredicate predicateWithValue:albumName forProperty:MPMediaItemPropertyAlbumTitle comparisonType:MPMediaPredicateComparisonEqualTo];
}

@end
