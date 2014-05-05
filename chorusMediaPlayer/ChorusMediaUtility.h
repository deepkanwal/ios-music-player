//
//  ChorusMediaUtility.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChorusArtist, MPMediaPropertyPredicate;

@interface ChorusMediaUtility : NSObject

+ (MPMediaPropertyPredicate*)artistPredicateForName:(NSString*)artistName;
+ (MPMediaPropertyPredicate*)albumPredicateForName:(NSString*)albumName;

@end
