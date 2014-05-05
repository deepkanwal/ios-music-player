//
//  UIView+Frames.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frames)

- (CGFloat)leftEdge;
- (CGFloat)rightEdge;
- (CGFloat)topEdge;
- (CGFloat)bottomEdge;
- (CGFloat)width;
- (CGFloat)height;
- (CGSize)size;

- (void)setLeftEdge:(CGFloat)leftEdge;
- (void)setRightEdge:(CGFloat)rightEdge;
- (void)setTopEdge:(CGFloat)topEdge;
- (void)setBottomEdge:(CGFloat)bottomEdge;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setSize:(CGSize)size;

@end
