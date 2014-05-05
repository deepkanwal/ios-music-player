//
//  UIView+Effects.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "UIView+Effects.h"

@implementation UIView (Effects)

- (void)applyDropShadowOfRadius:(CGFloat)radius alpha:(CGFloat)alpha
{
    [self applyDropShadowOfRadius:radius alpha:alpha offset:CGSizeZero];
}

- (void)applyDropShadowOfRadius:(CGFloat)radius alpha:(CGFloat)alpha offset:(CGSize)offset
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = alpha;
    self.layer.shadowRadius = radius;
    self.layer.shadowPath = shadowPath.CGPath;
}

- (void)updateDropShadow
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.shadowPath = shadowPath.CGPath;
}

- (void)applyRoundedCorners:(CGFloat)radius
{
    [self.layer setCornerRadius:radius];
}

@end
