//
//  UIView+Effects.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/17/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Effects)

- (void)applyDropShadowOfRadius:(CGFloat)radius alpha:(CGFloat)alpha;
- (void)applyDropShadowOfRadius:(CGFloat)radius alpha:(CGFloat)alpha offset:(CGSize)offset;
- (void)updateDropShadow;
- (void)applyRoundedCorners:(CGFloat)radius;

@end
