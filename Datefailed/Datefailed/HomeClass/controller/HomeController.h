//
//  HomeController.h
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdView.h"

@interface HomeController : BaseClassController

@end
@interface UIViewController (adview)

/// 创建
-(AdView*) bannerView;

/// 刷新
-(void) refreshBanner:(AdView*)adv;

///// 点击
//-(void) adClick:(id)item;


@end
