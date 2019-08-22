//
//  NSBundle+LrcParser.m
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/22.
//  Copyright © 2019 citex. All rights reserved.
//

#import "NSBundle+LrcParser.h"

@implementation NSBundle (LrcParser)
+ (NSURL *)lrcBundleURL {
    //先获取framework 的 bundle
    NSBundle *bundle = [NSBundle bundleForClass:[NSClassFromString(@"LGAudioLrcParser") class]];
    return [bundle URLForResource:@"LGLrcBundle" withExtension:@"bundle"];
}

+ (instancetype)lrcBundle{
    return [NSBundle bundleWithURL:[self lrcBundleURL]];
}

+ (NSString *)bundleWithFileName:(NSString *)fileName {
    return [[self lrcBundle] pathForResource:fileName ofType:nil];
}
@end
