//
//  LiveBottomView.m
//  Datefailed
//
//  Created by Code on 17/3/7.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "LiveBottomView.h"

@implementation LiveBottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupBasic];
    }
    return self;
}

- (NSArray *)tools
{
    return @[@"talk_public_40x40", @"talk_private_40x40", @"talk_sendgift_40x40", @"talk_rank_40x40", @"talk_share_40x40", @"talk_close_40x40"];
}

- (void)setupBasic
{
    CGFloat wh = 40;
    CGFloat margin = (F_DEVICE_W - wh * self.tools.count) / (self.tools.count + 1.0);
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i = 0; i<self.tools.count; i++) {
        x = margin + (margin + wh) * i;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, wh, wh)];
        btn.userInteractionEnabled = YES;
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:self.tools[i]] forState:(UIControlStateNormal)];
        
        
        [btn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:btn];
    }
}

- (void)click:(UIButton *)btn
{
    if (self.clickToolBlock) {
        self.clickToolBlock(btn.tag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
