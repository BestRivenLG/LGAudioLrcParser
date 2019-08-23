//
//  UIImage+LrcParser.m
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/23.
//  Copyright © 2019 citex. All rights reserved.
//

#import "UIImage+LrcParser.h"
#import "NSBundle+LrcParser.h"

@implementation UIImage (LrcParser)
+ (UIImage *)my_bundleImageNamed:(NSString *)name {
    return [self my_imageNamed:name inBundle:[NSBundle lrcBundle]];
}

+ (UIImage *)my_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    return [self imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
#else
    if ([self respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    } else {
        return [self imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
    }
#endif
}

@end
