//
//  UINavigationController+ViewControllers.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "UINavigationController+ViewControllers.h"

@implementation UINavigationController (ViewControllers)

- (BOOL)containsViewControllerOfClass:(Class)class
{
    for (UIViewController* viewController in self.viewControllers) {
        if ([viewController isKindOfClass:class]) {
            return YES;
        }
    }
    return NO;
}

@end
