//
//  ChorusArtistsViewController.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusArtistsViewController.h"
#import "ChorusAlbumsSongsViewController.h"
#import "ChorusArtistsCell.h"
#import <MediaPlayer/MediaPlayer.h>

NSString *ArtistsCellClassName = @"ChorusArtistsCell";

NSString *const kSegueArtistsToAlbums = @"kSegueArtistsToAlbums";

@interface ChorusArtistsViewController ()
@property (strong, nonatomic) NSArray *collectionsArray;
@end

@implementation ChorusArtistsViewController

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
    
    [self.tableView registerNib:[UINib nibWithNibName:ArtistsCellClassName bundle:nil] forCellReuseIdentifier:ArtistsCellClassName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateDataSource
{
    MPMediaQuery *artistsQuery = [MPMediaQuery artistsQuery];
    [artistsQuery setGroupingType:MPMediaGroupingAlbumArtist];
    
    self.sectionsArray = [artistsQuery collectionSections];
    self.collectionsArray = [artistsQuery collections];
    
    NSMutableArray *artistArray = [[NSMutableArray alloc] init];
    for (MPMediaItemCollection *artist in self.collectionsArray ) {
        MPMediaItem *representativeItem = [artist representativeItem];
        [artistArray addObject:representativeItem];
    }
    
    self.itemsArray = [artistArray copy];
    
}


#pragma mark - UITableViewDataSource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChorusArtistsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ArtistsCellClassName forIndexPath:indexPath];
    
    MPMediaQuerySection *mediaSection = [self.sectionsArray objectAtIndex:indexPath.section];
    NSInteger index = mediaSection.range.location + indexPath.row;
    
    if (index < self.itemsArray.count) {
        MPMediaItem *mediaItem = [self.itemsArray objectAtIndex:index];
        MPMediaItemCollection *mediaItemCollection = [self.collectionsArray objectAtIndex:index];
        [cell updateWithMediaItem:mediaItem mediaItemCollection:mediaItemCollection];
        [cell updateForIndex:index];
    } else {
        DDLogError(@"Section not consistent with collection");
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kChorusArtistsCellHeight;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueArtistsToAlbums sender:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSegueArtistsToAlbums]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MPMediaQuerySection *mediaSection = [self.sectionsArray objectAtIndex:indexPath.section];
        NSInteger selectedIndex = mediaSection.range.location + indexPath.row;
        
        if (selectedIndex < self.itemsArray.count) {
            MPMediaItem *mediaItem = [self.itemsArray objectAtIndex:selectedIndex];
            [segue.destinationViewController setArtistName:[mediaItem valueForProperty:MPMediaItemPropertyAlbumArtist]];
        }
    }
}

@end
