//
//  FirstView.m
//  Datefailed
//
//  Created by 潘恒 on 2017/6/13.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView


-(void)creatView:(NSInteger)count{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, F_DEVICE_W, 50)];
    
    
    
    [self addSubview:view];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
