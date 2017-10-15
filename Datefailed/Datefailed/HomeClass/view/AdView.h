//
//  AdtView.h
//  app
//
//  Created by bill on 14-4-14.
//  Copyright (c) 2014年 _Gear. All rights reserved.
//

#import <UIKit/UIKit.h>

#define f_Ad_Content_W F_DEVICE_W
#define f_Ad_Content_H (F_DEVICE_W/2)//F_I5_SIZE(120)


@interface AdView : UIView

/// 自动滚动: start  YES:开 NO:关
-(void) startAutoScroll:(BOOL)start;

-(void) refreshWithItem:(id)item callBack:(TBlock)callBack;

@end

