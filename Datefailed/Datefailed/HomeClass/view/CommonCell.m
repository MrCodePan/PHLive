//
//  CommonCell.m
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "CommonCell.h"

@implementation CommonCell
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {

        self.channleView = [[ChannleView alloc]init];
        [self.contentView addSubview:self.channleView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    //约束控件的frame  上面3个控件的高度都是20 加上gap一共是30
    self.bottomView.frame = CGRectMake(0, gap10, F_DEVICE_W, F_DEVICE_W);
    self.myImageView.frame = CGRectMake(gap10,gap5 , 15, 20);
    self.titleLabel.frame = CGRectMake(self.myImageView.right+10, gap5, 40, 20);
    self.moreBtn.frame = CGRectMake(F_DEVICE_W-70, gap5, 60, 20);
    
    [self.moreBtn setTitle:@"更多" forState:(UIControlStateNormal)];
    [self.moreBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0,0)];
    [self.moreBtn setImage:[UIImage imageNamed:@"common_icon_arrow"] forState:(UIControlStateNormal)];
    [self.moreBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
    
    CGFloat channelWidth = (F_DEVICE_W-3*gap10)/2;
    self.channleView.frame = CGRectMake(0, 30, F_DEVICE_W, channelWidth*2+gap5);

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
