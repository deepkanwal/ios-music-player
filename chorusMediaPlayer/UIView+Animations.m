//
//  UIView+Animations.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "UIView+Animations.h"
#import "Constants.h"

@implementation UIView (Animations)

- (void)applyFadeTransitionWithDuration:(CGFloat)duration
{
    CATransition *fadeTransition = [CATransition animation];
    [fadeTransition setType:kCATransitionFade];
    [fadeTransition setDuration:duration];
    [self.layer addAnimation:fadeTransition forKey:nil];
}

- (void)applyTransition:(NSString*)type subtype:(NSString*)subtype duration:(CGFloat)duration
{
    CATransition *transition = [CATransition animation];
    [transition setType:type];
    [transition setSubtype:subtype];
    [transition setDuration:duration];
    [self.layer addAnimation:transition forKey:nil];
}

@end
