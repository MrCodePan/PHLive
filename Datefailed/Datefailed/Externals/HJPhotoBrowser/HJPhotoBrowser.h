//
//  HJPhotoBrowser.h
//  photobrowser
//
//  Created by PandaHao on 116/2/14.
//  Copyright (c) 2016年 PandaHao. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HJButton, HJPhotoBrowser;

@protocol HJPhotoBrowserDelegate <NSObject>

@required

- (UIImage *)photoBrowser:(HJPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index;

@optional

- (NSURL *)photoBrowser:(HJPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index;

@end


@interface HJPhotoBrowser : UIView <UIScrollViewDelegate>

@property (nonatomic, weak) UIView *sourceImagesContainerView;
@property (nonatomic, assign) NSInteger currentImageIndex;
@property (nonatomic, assign) NSInteger imageCount;

@property (nonatomic, weak) id<HJPhotoBrowserDelegate> delegate;

- (void)show;

@end
