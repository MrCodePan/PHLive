//
//  UIExt.h
//  app
//
//  Created by bill on 16/7/15.
//  Copyright © 2016年 _Gear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (image_title)

/// 竖直
- (void) setImageVertical:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType;

@end