//
//  ChorusNowPlayingViewController.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusBaseViewController.h"

@interface ChorusNowPlayingViewController : ChorusBaseViewController

@property (strong, nonatomic) NSArray *nowPlayingList;
@property (assign, nonatomic) NSInteger currentSongIndex;

@end
