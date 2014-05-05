//
//  ChorusBaseTableViewCell.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/22/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChorusBaseTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *containerView;

- (void)updateForIndex:(NSUInteger)index;

@end
