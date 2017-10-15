//
//  TitleBar.h
//  BCare
//
//  Created by bill on 13-7-4.
//  Copyright (c) 2013年 _Gear. All rights reserved.
//

#define f_Title_h          F_NAV_BAR_H
//#define f_Title_h2          40
//#define f_Title_h3          40

#define f_Title_Left_W      f_Title_h
#define f_Title_Right_W     f_Title_h
#define f_Title_Center_W    120

#define i_Title_Btn_Left    151
#define i_Title_Btn_Right   152
#define i_Title_Btn_Center  153

#import <UIKit/UIKit.h>

@protocol TitleBarProtocol <NSObject>
@required

- (void)titleBtnClick:(UIButton*)button;

@end

@interface TitleBar : UIView <TitleBarProtocol>

@property (nonatomic, strong) UIImageView   *_backView;
@property (nonatomic, strong) UIImageView   *_leftImg;
@property (nonatomic, strong) UIImageView   *_rightImg;
@property (nonatomic, strong) UIImageView   *_centerImg;

@property (nonatomic, strong) UIButton  *_leftBtn;
@property (nonatomic, strong) UIButton  *_rightBtn;
@property (nonatomic, strong) UIButton  *_centerBtn;

@property (nonatomic, strong) UILabel *_titleLabel;

@property (nonatomic, weak)  id <TitleBarProtocol> _target;

// --- 类工厂方法 默认位置在屏幕顶部  delegate： 标题栏 按钮响应对象
+ (id)titleBarWithHeight:(float)h delegate:(id <TitleBarProtocol>)delegate;

// 设置 左、中、右、位置 的图片和按钮背景图 传入nil 则隐藏对应的imgView 和 btn
- (void)left:(NSString *)img btnImg:(NSString *)btnImg;
- (void)right:(NSString *)img btnImg:(NSString *)btnImg;
- (void)center:(NSString *)img btnImg:(NSString *)btnImg;
- (void)label:(NSString *)title;

-(UIView*) getLine;

- (void)leftTitle:(NSString *)leftTitle;
- (void)rightTitle:(NSString *)rightTitle;

/// 设置透明度
-(void) setTitleAlpha:(float)alpha;

@end

//@interface UIButton (images)
//
//- (void)setBgImages:(NSString *)imgName;
//- (void)setImages:(NSString *)imgName;
//
//@end