//
//  ChorusBaseTableViewController.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/15/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusBaseViewController.h"
#import "GDIIndexBar.h"

@interface ChorusBaseTableViewController : ChorusBaseViewController <UITableViewDataSource, UITableViewDelegate, GDIIndexBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet GDIIndexBar *indexBar;

@property (strong, nonatomic) NSArray *sectionsArray;
@property (strong, nonatomic) NSArray *itemsArray;

- (void)populateDataSource;

@end
