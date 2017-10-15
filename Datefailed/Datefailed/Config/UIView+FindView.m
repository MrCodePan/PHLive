//
//  UIView+FindView.m
//  PZShoppingPro
//
//  Created by PZ_Chen on 16/4/13.
//  Copyright © 2016年 PZ_Chen. All rights reserved.
//

#import "UIView+FindView.h"

@implementation UIView (FindView)

/**
 *  计算相对父视图的尺寸
 *
 *  @param view 父视图
 *
 *  @return 父视图的尺寸
 */
-(CGRect)rectInView:(UIView *)view{
    CGRect rect = CGRectZero;
    UIView * view_Super = self;
    do {
        //当前相对于下一级父视图的坐标
        CGRect rect_Temp = view_Super.frame;
        //如果父视图是View则
        if ([view_Super isKindOfClass:[UIScrollView class]] || [view_Super isKindOfClass:[UIScrollView class]] || [view_Super isKindOfClass:[UICollectionView class]]){
            //带有偏移量的视图
            //偏移量
            CGPoint point_Temp = ((UIScrollView *)view_Super).contentOffset;
            rect = (CGRect){rect.origin.x + rect_Temp.origin.x - point_Temp.x ,rect.origin.y + rect_Temp.origin.y - point_Temp.y , self.bounds.size.width , self.bounds.size.height};
        }else{
            //常规视图
            rect = (CGRect){rect.origin.x + rect_Temp.origin.x ,rect.origin.y + rect_Temp.origin.y , self.bounds.size.width , self.bounds.size.height};
        }
        if ([[view_Super superview] isKindOfClass:[UIViewController class]]) {
            view_Super = ((UIViewController *)[view_Super superview]).view;
        }else{
            view_Super = [view_Super superview];
        }
    } while (view_Super != view);
    
    return rect;
}

@end
