//
//  LGLrcParserModel.h
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/21.
//  Copyright © 2019 citex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGLrcParserModel : NSObject
@property(nonatomic,assign)BOOL isOtherLines;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,assign)CGFloat progress;
@property (nonatomic,assign)CGFloat eachLrcTime;//每行歌词总时间
@property (nonatomic,assign)CGSize lrcSize;//歌词高度宽度
@end

NS_ASSUME_NONNULL_END
