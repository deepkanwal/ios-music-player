//
//  ChorusAlbumsSongsViewController.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/15/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusAlbumsSongsViewController.h"
#import "ChorusNowPlayingViewController.h"
#import "ChorusAlbumsSongsCell.h"
#import "ChorusAlbumSectionHeader.h"
#import "ChorusMediaUtility.h"
#import "ChorusUIUtility.h"
#import <MediaPlayer/MediaPlayer.h>

NSString *AlbumsSongsCellClassName = @"ChorusAlbumsSongsCell";

@interface ChorusAlbumsSongsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *albumsArray;

@end

@implementation ChorusAlbumsSongsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self populateAlbums];
    
    if (self.artistName && self.albumName) {
        self.navigationItem.title = self.albumName;
    } else if (self.artistName) {
        self.navigationItem.title = self.artistName;
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:AlbumsSongsCellClassName bundle:nil] forCellReuseIdentifier:AlbumsSongsCellClassName];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self requiresRefreshForTheme]) {
        [self.tableView reloadData];
    }
    
    [self.tableView setBackgroundColor:[[ChorusUIUtility sharedInstance] colorForTableViewBackgrounds]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateAlbums
{
    
    MPMediaQuery *albumsQuery = [MPMediaQuery albumsQuery];

    if (self.artistName && self.albumName) {
        MPMediaPropertyPredicate *artistPredicate = [ChorusMediaUtility artistPredicateForName:self.artistName];
        MPMediaPropertyPredicate *albumPredicate = [ChorusMediaUtility albumPredicateForName:self.albumName];
        [albumsQuery setFilterPredicates:[NSSet setWithObjects:artistPredicate, albumPredicate, nil]];
        
    } else if (self.artistName) {
        MPMediaPropertyPredicate *artistPredicate = [ChorusMediaUtility artistPredicateForName:self.artistName];
        [albumsQuery setFilterPredicates:[NSSet setWithObject:artistPredicate]];
    }
    
    self.albumsArray = [albumsQuery collections];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.albumsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MPMediaItemCollection *collection = [self.albumsArray objectAtIndex:section];
    return collection.items.count;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ChorusAlbumSectionHeader *sectionHeader = [[[NSBundle mainBundle] loadNibNamed:@"ChorusAlbumSectionHeader" owner:nil options:nil] lastObject];
    MPMediaItemCollection *mediaItemCollection = [self.albumsArray objectAtIndex:section];
    [sectionHeader updateWithMediaItem:mediaItemCollection.representativeItem mediaItemCollection:mediaItemCollection];
    
    return sectionHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kChorusAlbumSectionHeaderHeight;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChorusAlbumsSongsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:AlbumsSongsCellClassName forIndexPath:indexPath];
    
    MPMediaItemCollection *collection = [self.albumsArray objectAtIndex:indexPath.section];
    MPMediaItem *item = [collection.items objectAtIndex:indexPath.row];
    
    [cell updateWithMediaItem:item];
    [cell updateForIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kChorusAlbumsSongsCellHeight;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self performSegueWithIdentifier:@"kSegueAlbumsToNowPlaying" sender:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    MPMediaItemCollection *album = [self.albumsArray objectAtIndex:indexPath.section];
    NSArray *songList = album.items;
    
    [segue.destinationViewController setNowPlayingList:songList];
    [segue.destinationViewController setCurrentSongIndex:indexPath.row];
}

@end
