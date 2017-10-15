//
//  BaseClassController.h
//  PHReading
//
//  Created by Code on 17/2/14.
//  Copyright © 2017年 Code. All rights reserved.
//
#import "TitleBar.h"
#import <UIKit/UIKit.h>

@interface BaseClassController : UIViewController
@property (nonatomic,strong)TitleBar* titleBar;
#pragma mark - ********  推送进入详情类页面处理 ********
/// 推送过来
@property (nonatomic,assign)BOOL fromPUSH;
@end
