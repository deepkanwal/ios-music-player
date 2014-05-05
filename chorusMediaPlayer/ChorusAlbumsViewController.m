//
//  ChorusAlbumsViewController.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusAlbumsViewController.h"
#import "ChorusAlbumsSongsViewController.h"
#import "ChorusAlbumsCell.h"
#import "ChorusMediaUtility.h"
#import <MediaPlayer/MediaPlayer.h>

NSString *const kSegueAlbumsToSongs = @"kSegueAlbumsToSongs";

NSString *AlbumCellClassName = @"ChorusAlbumsCell";

@interface ChorusAlbumsViewController ()
@property (strong, nonatomic) NSArray *collectionsArray;
@end

@implementation ChorusAlbumsViewController

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
    
    [self.tableView registerNib:[UINib nibWithNibName:AlbumCellClassName bundle:nil] forCellReuseIdentifier:AlbumCellClassName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MediaQuery

- (void)populateDataSource
{
    MPMediaQuery *albumsQuery = [MPMediaQuery albumsQuery];
    
    if (self.artistName) {
        MPMediaPropertyPredicate *artistPredicate = [ChorusMediaUtility artistPredicateForName:self.artistName];
        [albumsQuery setFilterPredicates:[NSSet setWithObject:artistPredicate]];
    }
    
    self.sectionsArray = [albumsQuery collectionSections];
    
    self.collectionsArray = [albumsQuery collections];
    
    NSMutableArray *albumsArray = [[NSMutableArray alloc] init];
    for (MPMediaItemCollection *album in self.collectionsArray) {
        MPMediaItem *representativeItem = [album representativeItem];
        [albumsArray addObject:representativeItem];
    }
    
    self.itemsArray = [albumsArray copy];

}

#pragma mark - UITableViewDataSource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChorusAlbumsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:AlbumCellClassName forIndexPath:indexPath];
    
    MPMediaQuerySection *mediaSection = [self.sectionsArray objectAtIndex:indexPath.section];
    NSInteger index = mediaSection.range.location + indexPath.row;
    
    if (index < self.itemsArray.count) {
        MPMediaItem *mediaItem = [self.itemsArray objectAtIndex:index];
        MPMediaItemCollection *collectionItem = [self.collectionsArray objectAtIndex:index];
        [cell updateWithMediaItem:mediaItem mediaItemCollection:collectionItem];
        [cell updateForIndex:index];
    } else {
        DDLogError(@"Section not consistent with collection");
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kChorusAlbumsCellHeight;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueAlbumsToSongs sender:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSegueAlbumsToSongs]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MPMediaQuerySection *mediaSection = [self.sectionsArray objectAtIndex:indexPath.section];
        NSInteger selectedIndex = mediaSection.range.location + indexPath.row;
        
        if (selectedIndex < self.itemsArray.count) {
            MPMediaItem *mediaItem = [self.itemsArray objectAtIndex:selectedIndex];
            [segue.destinationViewController setArtistName:[mediaItem valueForProperty:MPMediaItemPropertyAlbumArtist]];
            [segue.destinationViewController setAlbumName:[mediaItem valueForProperty:MPMediaItemPropertyAlbumTitle]];
        }
    }
}


@end


