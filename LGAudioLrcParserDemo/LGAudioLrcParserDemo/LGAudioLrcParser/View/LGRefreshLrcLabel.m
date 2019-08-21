//
//  LGRefreshLrcLabel.m
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/21.
//  Copyright © 2019 citex. All rights reserved.
//

#import "LGRefreshLrcLabel.h"

@implementation LGRefreshLrcLabel
//滑动进度
- (void)setProgress:(CGFloat)progress {
    _progress= progress;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [_fillColor set];
    CGRect newRect = rect;
    CGSize size = self.model.lrcSize;
    CGFloat textWidth = size.width+2;
    CGFloat x = (rect.size.width - textWidth)/2.0;
    newRect.origin.x = x;
    
    if (self.model.isOtherLines) {
        
        CGFloat height = rect.size.height*(1.0/self.model.count);
        newRect.size.height = height;
        float num = 0.0;
        for (int i = 0; i<self.model.count; i++) {
            newRect.origin.y =  i*height-3;
            //            newRect.size.width= newRect.size.width*(self.progress - (num/self.model.count))*self.model.count;
            newRect.size.width= textWidth*(self.progress - (num/self.model.count))*self.model.count;
            
            UIRectFillUsingBlendMode(newRect,kCGBlendModeSourceIn);
            num+=1.0;
        }
    }else {
        newRect.size.width= textWidth*(self.progress);
        UIRectFillUsingBlendMode(newRect,kCGBlendModeSourceIn);
    }
    
}
@end
