//
//  UIView+FindView.h
//  PZShoppingPro
//
//  Created by PZ_Chen on 16/4/13.
//  Copyright © 2016年 PZ_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FindView)

/**
 *  计算相对父视图的尺寸
 *
 *  @param view 父视图
 *
 *  @return 父视图的尺寸
 */
-(CGRect)rectInView:(UIView *)view;

@end
