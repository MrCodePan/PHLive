//
//  CategoryView.m
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "CategoryView.h"

@implementation CategoryView
-(id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageArray = [NSMutableArray new];
        _btnArray = [NSMutableArray new];
        _nameArray = [NSMutableArray new];
        _dataArray = [NSMutableArray new];
        CGFloat channelWidth = (F_DEVICE_W-3*gap10)/2;
        CGFloat channelHeight = channelWidth*0.8;
        for (int i=0; i<4; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(gap10+i/2*(channelWidth+gap5), 5+i%2*(channelHeight+gap5), channelWidth, channelHeight)];
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(gap10+i/2*(channelWidth+gap5), 5+i%2*(channelHeight+gap5), channelWidth, channelHeight)];
            [button addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
            
            //直播名字
            UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(gap10, imageView.height-20, imageView.width, 20)];
            nameLable.font = [UIFont systemFontOfSize:12];
            nameLable.textColor = [UIColor magentaColor];
            [self addSubview:button];
            [self addSubview:imageView];
            [imageView addSubview:nameLable];
            [_imageArray addObject:imageView];
            [_btnArray addObject:button];
            [_nameArray addObject:nameLable];
        }
    }
    return self;
}
//赋值
-(void)assignValue:(NSArray *)array myBlock:(void(^)(id userinfo))block{
    
    if (array.count!=4) {
        return;
    }
    _dataArray = array;
    self.callback=block;
    for (int i=0; i<4; i++) {
        
        HotList *list = array[i];
        UIImageView *imageView = _imageArray[i];
        UIButton *button = _btnArray[i];
        UILabel *nameLabel = _nameArray[i];

        nameLabel.text = [NSString stringWithFormat:@"主播名字:%@",list.myname];
        button.tag = 100+i;
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
