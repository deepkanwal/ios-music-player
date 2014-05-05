//
//  ChorusBaseTableViewController.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/15/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusBaseTableViewController.h"
#import "ChorusIndexSectionHeader.h"
#import "ChorusUIUtility.h"
#import "Constants.h"
#import "UIView+Animations.h"
#import <MediaPlayer/MediaPlayer.h>


const CGFloat kIndexBarAlpha = (0.4f);

@interface ChorusBaseTableViewController ()

@end

@implementation ChorusBaseTableViewController

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
    
    [self populateDataSource];
    
    if (self.itemsArray.count < 20) {
        [self.indexBar setHidden:YES];
    }
    
    [self.indexBar setBarBackgroundColor:[UIColor clearColor]];
    [self.indexBar setTextOffset:UIOffsetMake(10.0f, 0)];
    [self.indexBar setTextFont:[[ChorusUIUtility sharedInstance] lightFontOfSize:10.0f]];
    [self.indexBar setAlpha:kIndexBarAlpha];

    [self.indexBar reload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView setBackgroundColor:[[ChorusUIUtility sharedInstance] colorForTableViewBackgrounds]];
    [self.indexBar setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkAccentText]];
    
    if ([self requiresRefreshForTheme]) {
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Virtual

- (void)populateDataSource
{
    DDLogError(@"Should be implemented by subclass");
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MPMediaQuerySection *mediaSection = [self.sectionsArray objectAtIndex:section];
    return mediaSection.range.length;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ChorusIndexSectionHeader *sectionHeader = [[[NSBundle mainBundle] loadNibNamed:@"ChorusIndexSectionHeader" owner:nil options:nil] lastObject];
    MPMediaQuerySection *mediaSection = [self.sectionsArray objectAtIndex:section];
    [sectionHeader updateWithText:mediaSection.title];
    
    return sectionHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kChorusIndexSectionHeader;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDLogError(@"Should be implemented by subclass");
    return nil;
}

#pragma mark - GDIIndexBarDelegate

- (NSUInteger)numberOfIndexesForIndexBar:(GDIIndexBar *)indexBar
{
    return self.sectionsArray.count;
}

- (NSString*)stringForIndex:(NSUInteger)index
{
    MPMediaQuerySection *mediaSection = [self.sectionsArray objectAtIndex:index];
    return mediaSection.title;
}

- (void)indexBar:(GDIIndexBar *)indexBar didSelectIndex:(NSUInteger)index
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:NO];
}

- (void)showIndexBar
{
    [UIView animateWithDuration:kUI_AnimationDuration animations:^{
        [self.indexBar setAlpha:kIndexBarAlpha];
    }];
}

- (void)hideIndexBar
{
    [UIView animateWithDuration:kUI_AnimationDuration animations:^{
        [self.indexBar setAlpha:0];
    }];
}

@end
