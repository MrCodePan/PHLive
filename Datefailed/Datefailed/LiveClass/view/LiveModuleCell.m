//
//  LiveModuleCell.m
//  Datefailed
//
//  Created by Code on 17/3/8.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "LiveModuleCell.h"

@implementation LiveModuleCell
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat itemWidth = (F_DEVICE_W-3*gap10)/2;
    
    self.userIamgeView.frame = CGRectMake(0, 0, itemWidth, itemWidth-20);
    self.sureImage.frame = CGRectMake(0, self.userIamgeView.bottom, 20, 20);
    self.roomName.frame = CGRectMake(self.sureImage.right, self.userIamgeView.bottom, self.userIamgeView.width-20, 20);
    self.userMainName.frame = CGRectMake(gap10, self.userIamgeView.height-20, itemWidth/2, 20);
    self.userName.frame = CGRectMake(self.userIamgeView.width-itemWidth/2, self.userIamgeView.height-20, itemWidth/2, 20);
    // Initialization code
}
-(void)assignValue:(LiveData *)data{
    NSLog(@"%@",data.avatarSmall);
    NSLog(@"%@",data.cateId);
    NSLog(@"%@",data.url);
    NSLog(@"%@",data.nickname);//昵称
    NSLog(@"%@",data.roomSrc);//房间相片
    NSLog(@"%@",data.roomName);//房间名字
    NSLog(@"%@",data.gameUrl);
    NSLog(@"%@",data.jumpUrl);
    NSLog(@"%f",data.online);
    [self.userIamgeView sd_setImageWithURL:[NSURL URLWithString:data.roomSrc]];
    self.roomName.text = data.roomName;
    self.userMainName.text = data.nickname;
    self.userName.text = [NSString stringWithFormat:@"%.0f",data.online];
    
}

@end
