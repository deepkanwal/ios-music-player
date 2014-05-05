//
//  UIView+Frames.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/8/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "UIView+Frames.h"

@implementation UIView (Frames)


- (CGFloat)leftEdge {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)rightEdge {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)topEdge {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)bottomEdge {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (CGSize)size {
    return self.bounds.size;
}

- (void)setLeftEdge:(CGFloat)leftEdge {
    CGRect frame = self.frame;
    frame.origin.x = leftEdge;
    self.frame = frame;
}

- (void)setRightEdge:(CGFloat)rightEdge {
    CGRect frame = self.frame;
    frame.origin.x = self.width + rightEdge;
    self.frame = frame;
}

- (void)setTopEdge:(CGFloat)topEdge {
    CGRect frame = self.frame;
    frame.origin.y = topEdge;
    self.frame = frame;
}

- (void)setBottomEdge:(CGFloat)bottomEdge {
    CGRect frame = self.frame;
    frame.origin.y = self.height + bottomEdge;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size.height = size.height;
    frame.size.width = size.width;
    self.frame = frame;
}

@end
