//
//  ViewController.m
//  LGAudioLrcParserDemo
//
//  Created by citex on 2019/8/21.
//  Copyright © 2019 citex. All rights reserved.
//

#import "ViewController.h"
#import "LGLrcParser.h"
#import "LGLrcCell.h"
#import "LGLrcParserModel.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *lrcTableView;
@property (nonatomic,strong) LGLrcParser *lrcContent;
@property (nonatomic,strong) AVAudioPlayer *player;
@property (assign) NSInteger currentRow;
@end

@implementation ViewController
-(void) initPlayer{
    AVAudioSession *session=[AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    self.player=[[AVAudioPlayer alloc] initWithContentsOfURL:[[NSBundle mainBundle]  URLForResource:@"Dont" withExtension:@"mp3"] error:nil];//@"那就这样吧"
    self.player.numberOfLoops=10;
    [self.player prepareToPlay];
    [self.player play];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.lrcContent = [[LGLrcParser alloc] initWithFileName:@"Dont" ofType:@"lrc"];
    [self.lrcTableView reloadData];
    [self initPlayer];
    [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    
    UIImage *img=[UIImage imageNamed:@"wall1.jpg"];
    
    UIImageView *bgView=[[UIImageView alloc] initWithImage:img];
    //bgView.alpha=0.8;
    self.lrcTableView.backgroundView=bgView;
    [bgView setImage:[self getBlurredImage:img]];
    [self.lrcTableView registerClass:[LGLrcCell class] forCellReuseIdentifier:@"LGLrcCell"];

}

-(void) updateTime{
    float currentTime=self.player.currentTime;
    NSLog(@"%d:%d",(int)currentTime / 60, (int)currentTime % 60);
    for (int i=0; i<self.lrcContent.lrcArrayTime.count; i++) {
        
        // 下一句歌词
        CGFloat lrcTime = [self.lrcContent.lrcArrayTime[i] floatValue];
        //        float lrcTime=[timeArray[0] intValue]*60+[timeArray[1] floatValue];
        if(currentTime>=lrcTime){
            _currentRow=i;
            if (_currentRow < self.lrcContent.lrcArrayEachLrcProgress.count) {
                CGFloat percent = currentTime - lrcTime;
                LGLrcParserModel *model = self.lrcContent.lrcArrayEachLrcProgress[_currentRow];
                CGFloat totalTime = model.eachLrcTime;
                model.progress = percent/totalTime;
            }
        }else{
            break;
        }
    }
    
    [self.lrcTableView reloadData];
    [self.lrcTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_currentRow inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}


//实现高斯模糊
-(UIImage *)getBlurredImage:(UIImage *)image{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *ciImage=[CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter=[CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:@5.0f forKey:@"inputRadius"];
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef ref=[context createCGImage:result fromRect:[result extent]];
    return [UIImage imageWithCGImage:ref];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lrcContent.lrcArrayStr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LGLrcCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LGLrcCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.refreshLrcLabel.text = self.lrcContent.lrcArrayStr[indexPath.row];
    NSLog(@"=====%@===长度%ld",cell.refreshLrcLabel.text,cell.refreshLrcLabel.text.length);
    [cell.refreshLrcLabel sizeToFit];
    if(indexPath.row==_currentRow){
        cell.refreshLrcLabel.font = [UIFont systemFontOfSize:16];
        CGFloat progress = 0;
        if (indexPath.row<self.lrcContent.lrcArrayEachLrcProgress.count) {
            LGLrcParserModel *model = self.lrcContent.lrcArrayEachLrcProgress[indexPath.row];
            cell.refreshLrcLabel.model = model;
            progress = model.progress;
        }
        cell.refreshLrcLabel.fillColor = [UIColor greenColor];
        cell.refreshLrcLabel.progress = progress;
    }else{
        cell.refreshLrcLabel.font = [UIFont systemFontOfSize:13];
        cell.refreshLrcLabel.progress = 0;
        cell.refreshLrcLabel.fillColor = [UIColor clearColor];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    return UITableViewAutomaticDimension;
    return 60;
}
@end
