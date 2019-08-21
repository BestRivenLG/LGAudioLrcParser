//
//  LGRefreshLrcLabel.h
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/21.
//  Copyright © 2019 citex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGLrcParserModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LGRefreshLrcLabel : UILabel
/**填充色，从左开始*/
@property(nonatomic,strong)UIColor *fillColor;
/**滑动进度*/
@property(nonatomic,assign)CGFloat progress;
@property(nonatomic,assign)BOOL isSecondLine;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,strong)LGLrcParserModel *model;

@end

NS_ASSUME_NONNULL_END
