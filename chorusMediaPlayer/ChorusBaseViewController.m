//
//  ChorusBaseViewController.m
//  chorusTest
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusBaseViewController.h"
#import "UINavigationController+ViewControllers.h"
#import "ChorusNowPlayingViewController.h"
#import "ChorusUIUtility.h"

@interface ChorusBaseViewController ()
@property (assign, nonatomic) ChorusTheme currentTheme;
@end

@implementation ChorusBaseViewController

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
	// Do any additional setup after loading the view.
    
    if ([self.navigationController containsViewControllerOfClass:[ChorusNowPlayingViewController class]] == NO) {
        UIBarButtonItem *nowPlayingBarButton = [[UIBarButtonItem alloc] initWithTitle:@"^" style:UIBarButtonItemStylePlain target:self action:@selector(showNowPlayingScreen)];
        [self.navigationItem setRightBarButtonItem:nowPlayingBarButton];
    }
    
//    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view setBackgroundColor:[[ChorusUIUtility sharedInstance] colorForTableViewBackgrounds]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.currentTheme = [ChorusUIUtility sharedInstance].currentTheme;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showNowPlayingScreen
{
    ChorusNowPlayingViewController *nowPlayingViewController = (ChorusNowPlayingViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"ChorusNowPlayingViewController"];
    [self presentViewController:nowPlayingViewController animated:YES completion:nil];
    
}

- (BOOL)requiresRefreshForTheme
{
    if (self.currentTheme != [ChorusUIUtility sharedInstance].currentTheme) {
        return YES;
    }
    return NO;
}

@end
