//
//  UIColor+Extensions.h
//  chorusMediaPlayer
//
//  Created by Deepkanwal Plaha on 2/16/2014.
//  Copyright (c) 2014 Deepkanwal Plaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extensions)

+ (UIColor*)colorForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end
