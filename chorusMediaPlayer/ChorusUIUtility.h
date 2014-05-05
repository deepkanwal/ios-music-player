//
//  ChorusUIUtility.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const CGFloat kUI_AnimationDuration;

typedef enum {
    ChorusThemeLight,
    ChorusThemeDark
} ChorusTheme;

@interface ChorusUIUtility : NSObject

@property (assign, nonatomic) ChorusTheme currentTheme;

+ (ChorusUIUtility*)sharedInstance;

- (UIFont*)lightFontOfSize:(CGFloat)size;
- (UIFont*)fontOfSize:(CGFloat)size;

- (UIColor*)colorForNavBar;
- (UIColor*)colorForNavBarTint;
- (UIColor*)colorForTabBar;

- (UIColor*)colorForTableViewBackgrounds;

- (UIColor*)colorForSectionHeaders;
- (UIColor*)colorForSelectedCell;
- (UIColor*)colorForEvenCells;
- (UIColor*)colorForOddCells;

- (UIColor*)colorForDarkText;
- (UIColor*)colorForDarkAccentText;

- (UIColor*)colorForDropShadows;

+ (UIImage *)imageWithColor:(UIColor *)color;

- (void)updateApp;
- (void)updateStatusBar;

@end
