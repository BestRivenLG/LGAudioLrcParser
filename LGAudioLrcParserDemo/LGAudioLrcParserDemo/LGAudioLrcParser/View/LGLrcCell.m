//
//  LGLrcCell.m
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/21.
//  Copyright © 2019 citex. All rights reserved.
//

#import "LGLrcCell.h"
#import <Masonry/Masonry.h>

@implementation LGLrcCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = nil;
    
    LGRefreshLrcLabel *refreshLrcLabel = [[LGRefreshLrcLabel alloc] initWithFrame:self.bounds];
    refreshLrcLabel.textColor = [UIColor whiteColor];
    refreshLrcLabel.fillColor = [UIColor greenColor];
    refreshLrcLabel.font = [UIFont systemFontOfSize:13.0f];
    refreshLrcLabel.numberOfLines = 0;
    refreshLrcLabel.textAlignment = NSTextAlignmentCenter;
    self.refreshLrcLabel = refreshLrcLabel;
    [self.contentView addSubview:refreshLrcLabel];
    [refreshLrcLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.centerY.equalTo(self.contentView);
        //        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
