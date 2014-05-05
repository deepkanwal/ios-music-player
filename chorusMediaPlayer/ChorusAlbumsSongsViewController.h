//
//  ChorusAlbumsSongsViewController.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/15/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusBaseViewController.h"

@interface ChorusAlbumsSongsViewController : ChorusBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *artistName;
@property (strong, nonatomic) NSString *albumName;

@end
