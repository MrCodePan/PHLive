//
//  HJCollectionViewDemoCell.m
//  HJPhotoBrowser
//
//  Created by PandaHao on 16/2/14.
//  Copyright © 2016年 PandaHao. All rights reserved.
//

#import "HJCollectionViewDemoCell.h"
#import "UIImageView+WebCache.h"

@implementation HJCollectionViewDemoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    UIImageView *imageView = [UIImageView new];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    
    self.backgroundColor = [UIColor clearColor];
}



- (void)setItem:(HJPhotoItem *)item
{
    _item = item;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"b_default_webimg_goods"]];
    
    
//    //[SVProgressHUD showWithStatus:@"图片加载中..."];
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"b_default_webimg_goods"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        //NSLog(@"图片加载完成后做的事情");
//        //[SVProgressHUD dismiss];
//    
//    }];

    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

@end
