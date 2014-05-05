//
//  ChorusIndexSectionHeader.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusIndexSectionHeader.h"
#import "ChorusUIUtility.h"
#import "UIView+Effects.h"

const CGFloat kChorusIndexSectionHeader = 32.0f;

@interface ChorusIndexSectionHeader ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ChorusIndexSectionHeader

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)updateWithText:(NSString*)text
{
    [self setBackgroundColor:[[ChorusUIUtility sharedInstance] colorForSectionHeaders]];
    [self.titleLabel setTextColor:[[ChorusUIUtility sharedInstance] colorForDarkAccentText]];
    [self.titleLabel setText:text];
}

@end
