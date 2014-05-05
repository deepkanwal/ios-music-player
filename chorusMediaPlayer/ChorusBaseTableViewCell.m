//
//  ChorusBaseTableViewCell.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/22/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusBaseTableViewCell.h"
#import "ChorusUIUtility.h"
#import "UIColor+Extensions.h"

@implementation ChorusBaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if (selected) {
        [self setAlpha:0.5f];
    } else {
        [self setAlpha:1];
    }
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        [self setAlpha:0.5f];
    } else {
        [self setAlpha:1];
    }
    
}

- (void)updateForIndex:(NSUInteger)index
{
//    switch (index % 6) {
//        case 5:
//            [self.containerView setBackgroundColor:[UIColor colorFromHexString:@"#EEEEEE"]];
//            break;
//        case 4:
//            [self.containerView setBackgroundColor:[UIColor colorFromHexString:@"#DDDDDD"]];
//            break;
//        case 3:
//            [self.containerView setBackgroundColor:[UIColor colorFromHexString:@"#CCCCCC"]];
//            break;
//        case 2:
//            [self.containerView setBackgroundColor:[UIColor colorFromHexString:@"#DDDDDD"]];
//            break;
//        case 1:
//            [self.containerView setBackgroundColor:[UIColor colorFromHexString:@"#EEEEEE"]];
//            break;
//        default:
//            [self.containerView setBackgroundColor:[UIColor colorFromHexString:@"#FFFFFF"]];
//            break;
//    }
    
    if (index % 2 == 1) {
        [self.containerView setBackgroundColor:[[ChorusUIUtility sharedInstance] colorForOddCells]];
    } else {
        [self.containerView setBackgroundColor:[[ChorusUIUtility sharedInstance] colorForEvenCells]];
    }
}

@end
