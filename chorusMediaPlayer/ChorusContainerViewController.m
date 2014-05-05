//
//  ChorusContainerViewController.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/23/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusContainerViewController.h"
#import "ChorusArtistsViewController.h"

@interface ChorusContainerViewController ()
@property (strong, nonatomic) ChorusArtistsViewController* artistsVC;
@end

@implementation ChorusContainerViewController

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
    
    [self performSegueWithIdentifier:@"second" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"second"]) {
        self.artistsVC = segue.destinationViewController;
        UIView *dest = (UIView*)[segue.destinationViewController view];
        dest.frame = self.view.bounds;
        [self.view addSubview:dest];
        [segue.destinationViewController didMoveToParentViewController:self];

    }
}


@end
