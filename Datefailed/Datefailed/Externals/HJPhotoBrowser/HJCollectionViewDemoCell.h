//
//  HJCollectionViewDemoCell.h
//  SDPhotoBrowser
//
//  Created by PandaHao on 16/2/14.
//  Copyright © 2016年 PandaHao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HJPhotoItem.h"

@interface HJCollectionViewDemoCell : UICollectionViewCell

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, strong) HJPhotoItem *item;

@end
