//
//  ChorusUIUtility.m
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import "ChorusUIUtility.h"
#import "UIColor+Extensions.h"

const CGFloat kUI_AnimationDuration = (0.3f);

@implementation ChorusUIUtility

+ (ChorusUIUtility*)sharedInstance
{
    static ChorusUIUtility *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ChorusUIUtility alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - Fonts

- (UIFont*)lightFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

- (UIFont*)fontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}


#pragma mark - Colors

- (UIColor*)colorForNavBar
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [[UIColor colorFromHexString:@"#232323"] colorWithAlphaComponent:0.98f];
    } else {
        color = [[UIColor colorFromHexString:@"#121212"] colorWithAlphaComponent:0.98f];
    }
    
    return color;
}

- (UIColor*)colorForNavBarTint
{
    
    UIColor *color = nil;

    if (self.currentTheme == ChorusThemeLight) {
        color = [UIColor whiteColor];
    } else {
        color = [UIColor whiteColor];
    }
    
    return color;
}

- (UIColor*)colorForTabBar
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [[UIColor colorFromHexString:@"#F7F7F7"] colorWithAlphaComponent:0.98f];
    } else {
        color = [[UIColor colorFromHexString:@"#202020"] colorWithAlphaComponent:0.98f];
    }
    
    return color;
}

- (UIColor*)colorForTableViewBackgrounds
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [UIColor whiteColor];
    } else {
        color = [UIColor colorFromHexString:@"#191919"];
    }
    
    return color;
}

- (UIColor*)colorForSectionHeaders
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [[UIColor colorFromHexString:@"#F3F3F3"] colorWithAlphaComponent:0.95f];
    } else {
        color = [[UIColor colorFromHexString:@"#232323"] colorWithAlphaComponent:0.98f];
    }
    
    return color;
}

- (UIColor*)colorForSelectedCell
{
    return [UIColor colorFromHexString:@"#0C346A"];
}

- (UIColor*)colorForEvenCells
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [UIColor whiteColor];
    } else {
        color = [UIColor colorFromHexString:@"#1D1D1D"];
    }
    
    return color;
}

- (UIColor*)colorForOddCells
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [UIColor colorFromHexString:@"#F8F8F8"];
    } else {
        color = [UIColor colorFromHexString:@"#202020"];
    }
    
    return color;
}

- (UIColor*)colorForAccentedText
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [UIColor colorFromHexString:@"#545F6E"];
    } else {
        color = [UIColor colorFromHexString:@"#989898"];
    }
    
    return color;
}

- (UIColor*)colorForDarkText
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [UIColor darkTextColor];
    } else {
        color = [UIColor whiteColor];
    }
    
    return color;
}

- (UIColor*)colorForDarkAccentText
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [UIColor colorFromHexString:@"#787878"];
    } else {
        color = [UIColor colorFromHexString:@"#787878"];
    }
    
    return color;
}

- (UIColor*)colorForDropShadows
{
    UIColor *color = nil;
    
    if (self.currentTheme == ChorusThemeLight) {
        color = [UIColor blackColor];
    } else {
        color = [UIColor lightGrayColor];
    }
    
    return color;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)updateStatusBar
{
    if (self.currentTheme == ChorusThemeDark) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}

- (void)updateApp
{
        
    [self updateStatusBar];
    
    //General
        
    [[UINavigationBar appearance] setBarTintColor:[self colorForNavBar]];
    [[UINavigationBar appearance] setTintColor:[self colorForNavBarTint]];
    
    [[UITabBar appearance] setBarTintColor:[self colorForNavBar]];
    [[UITabBar appearance] setTintColor:[self colorForNavBarTint]];
    
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[self colorForNavBarTint],
                                                           NSFontAttributeName:[self lightFontOfSize:18.0f]}];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[self colorForNavBarTint],
                                                           NSFontAttributeName:[self lightFontOfSize:18.0f]} forState:UIControlStateNormal];
    
}

- (void)setCurrentTheme:(ChorusTheme)currentTheme
{
    _currentTheme = currentTheme;
    [self updateApp];
}

@end
