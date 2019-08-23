//
//  NSBundle+LrcParser.m
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/22.
//  Copyright © 2019 citex. All rights reserved.
//

#import "NSBundle+LrcParser.h"
#import "LGAudioLrcParser.h"

@implementation NSBundle (LrcParser)
+ (NSURL *)lrcBundleURL {
    //先获取framework 的 bundle
    NSBundle *bundle = [NSBundle bundleForClass:[LGAudioLrcParser class]];
    return [bundle URLForResource:@"LGAudioLrcParser" withExtension:@"bundle"];
    
}

+ (instancetype)lrcBundle{
    return [self bundleWithURL:[self lrcBundleURL]];
}

+ (NSString *)bundleWithFileName:(NSString *)fileName {
    return [[self lrcBundle] pathForResource:fileName ofType:nil];
}
@end
