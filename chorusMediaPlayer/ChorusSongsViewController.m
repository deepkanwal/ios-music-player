//
//  ChorusSongsViewController.m
//  chorusTest
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusSongsViewController.h"
#import "ChorusSongsCell.h"

#import <MediaPlayer/MediaPlayer.h>

NSString *SongCellClassName = @"ChorusSongsCell";

@interface ChorusSongsViewController ()
@property (strong, nonatomic) NSCache *imagesCache;
@end

@implementation ChorusSongsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:SongCellClassName bundle:nil] forCellReuseIdentifier:SongCellClassName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateDataSource
{
    MPMediaQuery *songsQuery = [MPMediaQuery songsQuery];
    
    self.sectionsArray = [songsQuery itemSections];
    self.itemsArray = [songsQuery items];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChorusSongsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:SongCellClassName forIndexPath:indexPath];
    
    MPMediaQuerySection *mediaSection = [self.sectionsArray objectAtIndex:indexPath.section];
    NSInteger index = mediaSection.range.location + indexPath.row;
    
    if (index < self.itemsArray.count) {
        MPMediaItem *mediaItem = [self.itemsArray objectAtIndex:index];
        [cell updateWithMediaItem:mediaItem];
        [cell updateForIndex:indexPath.row];
    } else {
        DDLogError(@"Section not consistent with collection");
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kChorusSongsCellHeight;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
