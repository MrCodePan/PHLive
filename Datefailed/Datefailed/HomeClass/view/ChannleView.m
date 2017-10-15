//
//  ChannleView.m
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "ChannleView.h"
#import "DataModels.h"

@implementation ChannleView
-(id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageArray = [NSMutableArray new];
        _btnArray = [NSMutableArray new];
        _dataArray = [NSMutableArray new];

        CGFloat channelWidth = (F_DEVICE_W-3*gap10)/2;
        for (int i=0; i<4; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(gap10+i/2*(channelWidth+gap5), 5+i%2*(channelWidth+gap5), channelWidth, channelWidth)];
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(gap10+i/2*(channelWidth+gap5), 5+i%2*(channelWidth+gap5), channelWidth, channelWidth)];
            [button addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
            button.tag=100+i;
            [self addSubview:button];
            [self addSubview:imageView];
            [_imageArray addObject:imageView];
            [_btnArray addObject:button];
        }
    }
    return self;
}
//赋值
-(void)assignValue:(NSArray *)array myBlock:(void(^)(id userinfo))block{

    NSLog(@">>>>%ld",array.count);
    if (array.count!=4) {
        return;
    }
    self.callback = block;
    _dataArray = array;
    for (int i=0; i<4; i++) {
        HotList *list = array[i];
        UIImageView *imageView = _imageArray[i];
        UIButton *button = _btnArray[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:list.bigpic]];
        
        
    }
    
}


-(void)btnClick:(UIButton *)sender{
    HotList *list = _dataArray[sender.tag-100];
    self.callback(list.flv);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
