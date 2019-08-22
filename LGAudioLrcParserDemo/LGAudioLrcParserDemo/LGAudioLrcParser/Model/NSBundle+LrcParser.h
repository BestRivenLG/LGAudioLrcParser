//
//  NSBundle+LrcParser.h
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/22.
//  Copyright © 2019 citex. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (LrcParser)
+ (instancetype)lrcBundle;

+ (NSString *)bundleWithFileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
