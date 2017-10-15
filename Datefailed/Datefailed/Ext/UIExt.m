//
//  UIExt.m
//  app
//
//  Created by bill on 16/7/15.
//  Copyright © 2016年 _Gear. All rights reserved.
//

#import "UIExt.h"

@implementation UIButton (image_title)

- (void) setImageVertical:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType
{
    
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    [self.imageView setContentMode:UIViewContentModeCenter];
    [self setImageEdgeInsets:UIEdgeInsetsMake(-self.height*0.1,
                                              0.0,
                                              0.0,
                                              -titleSize.width)];
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(image.size.height+self.height*0.15,
                                              -image.size.width,
                                              -self.height*0.15,
                                              0.0)];
    [self setTitle:title forState:stateType];
}


@end
