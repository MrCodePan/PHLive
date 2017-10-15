//
//  CategoryView.h
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CategoryView : UIView
{
    NSArray *_dataArray;
    NSMutableArray *_btnArray;
    NSMutableArray *_imageArray;
    NSMutableArray *_nameArray;
}
-(id)initWithFrame:(CGRect)frame;
-(void)assignValue:(NSArray *)array myBlock:(void(^)(id userinfo))block;
@property (nonatomic,copy)CMDBlock callback;

@end
