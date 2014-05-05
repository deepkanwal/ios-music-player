//
//  UIView+Animations.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animations)

- (void)applyFadeTransitionWithDuration:(CGFloat)duration;
- (void)applyTransition:(NSString*)type subtype:(NSString*)subtype duration:(CGFloat)duration;

@end
