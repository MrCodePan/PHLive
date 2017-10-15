//
//  LiveBottomView.h
//  Datefailed
//
//  Created by Code on 17/3/7.
//  Copyright © 2017年 Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveBottomView : UIView
@property (nonatomic, copy) void (^clickToolBlock)(NSInteger tag);

@end
