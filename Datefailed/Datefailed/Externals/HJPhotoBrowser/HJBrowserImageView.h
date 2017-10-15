//
//  SDBrowserImageView.h
//  SDPhotoBrowser
//
//  Created by PandaHao on 16-2-14.
//  Copyright (c) 2016年 PandaHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJWaitingView.h"


@interface HJBrowserImageView : UIImageView <UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign, readonly) BOOL isScaled;
@property (nonatomic, assign) BOOL hasLoadedImage;

- (void)eliminateScale; // 清除缩放

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)doubleTapToZommWithScale:(CGFloat)scale;

- (void)clear;

@end
