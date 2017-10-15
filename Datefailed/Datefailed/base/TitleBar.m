//
//  TitleBar.m
//  BCare
//
//  Created by bill on 13-7-4.
//  Copyright (c) 2013年 _Gear. All rights reserved.
//

#import "TitleBar.h"
#import "BaseClassController.h"

@interface TitleBar ()

@end
@implementation TitleBar

+ (id)titleBarWithHeight:(float)h delegate:(id <TitleBarProtocol>)delegate
{
    CGRect      frame = CGRectMake(0, F_STATUS_BAR_H, F_DEVICE_W, h+1);
    TitleBar    *tTitleView = [[TitleBar alloc] initWithFrame:frame];

    tTitleView._target = !delegate ? tTitleView : delegate;
    [tTitleView createTitleView];
//    tTitleView.height -= 2;

    return tTitleView;
}

- (void)createTitleView
{
//    UIImage *tImage = [UIImage getImage:s_Title_bg];
    // ---- 标题栏背景
    UIImageView *tImgView = nil;

    tImgView = [[UIImageView alloc] init];
//    if (Is_up_Ios_7) {
    tImgView.frame = CGRectMake(0, 0-F_STATUS_BAR_H, F_DEVICE_W, self.height+F_STATUS_BAR_H);
//    }else{
//        tImgView.frame = CGRectMake(0, 0, F_DEVICE_W, self.height);
//    }
    [self addSubview:tImgView];
    self._backView = tImgView;
    self._backView.backgroundColor = [ZXPublic getColor:@"ffffff"];//c_color_imei;//000000//ff9d9a
//    self._backView.backgroundColor = [ZXPublic getColor:@"ff9d9a"];//c_color_imei;//000000//ff9d9a
//    self._backView.image = tImage;//[tImage resizableImage:0 left:50 bottom:0 right:50];
//    self._backView.autoresizingMask = UIViewAutoresizingFlexibleWidth & Autoresizing_Local;
//    [self._backView setShadowCoror:[ZXPublic getColor:@"000000" alpha:0.45f] offset:CGSizeZero radius:0.5];
    
    // ------------------- 左边
    //按钮
    UIButton *tButton = nil;
    tButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tButton.frame = CGRectMake(0, 0, f_Title_Left_W, self.height);
    tButton.tag = i_Title_Btn_Left;
    tButton.backgroundColor = [UIColor clearColor];
    [tButton addTarget:self._target action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tButton];
    self._leftBtn = tButton;
//    self._leftBtn.autoresizingMask = Autoresizing_All;
    self._leftBtn.hidden = YES;

    // 左边图片
    tImgView = [[UIImageView alloc] init];
    tImgView.frame = CGRectMake(0, 0, f_Title_Left_W, self.height);
    //    [tImgView setImage:[UIImage getImage:@"<#s#>"]];
    [self addSubview:tImgView];
    self._leftImg = tImgView;
//    self._leftImg.autoresizingMask = Autoresizing_All;
    self._leftImg.hidden = YES;
    
    // ------------------- 中间
    // 按钮
    tButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tButton.frame = CGRectMake((self.width - f_Title_Center_W) / 2.f, 0, f_Title_Center_W, self.height);
    tButton.tag = i_Title_Btn_Center;
    tButton.backgroundColor = [UIColor clearColor];
    [tButton addTarget:self._target action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tButton];
    self._centerBtn = tButton;
//    self._centerBtn.autoresizingMask = Autoresizing_All;
    self._centerBtn.hidden = YES;

    //  中间图片
    tImgView = [[UIImageView alloc] init];
    tImgView.frame = CGRectMake((self.width - f_Title_Center_W) / 2.f, 0, f_Title_Center_W, self.height);
    //    [tImgView setImage:[UIImage getImage:@"<#s#>"]];
    self._centerImg.backgroundColor = [UIColor clearColor];
    [self addSubview:tImgView];
    self._centerImg = tImgView;
//    self._centerImg.autoresizingMask = Autoresizing_All;
    self._centerImg.hidden = YES;

    // ------------------- 右边
    //按钮
    tButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tButton.frame = CGRectMake((self.width - f_Title_Right_W), 0, f_Title_Right_W, f_Title_Right_W);
    tButton.tag = i_Title_Btn_Right;
    [tButton addTarget:self._target action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tButton];
    self._rightBtn = tButton;
//    self._rightBtn.autoresizingMask = Autoresizing_All;
    self._rightBtn.hidden = YES;

    // 右边图片
    tImgView = [[UIImageView alloc] init];
    tImgView.frame = CGRectMake((self.width - f_Title_Right_W), 0, F_DEVICE_W, self.height);
    //    [tImgView setImage:[UIImage getImage:@"<#s#>"]];
    [self addSubview:tImgView];
    self._rightImg = tImgView;
//    self._rightImg.autoresizingMask = Autoresizing_All;
    self._rightImg.hidden = YES;
    
    // ------------------- 标题
    UILabel *tLabel = nil;
    tLabel = [[UILabel alloc] init];
    tLabel.frame = CGRectMake(50, 0, F_DEVICE_W-100, self.height);
    tLabel.backgroundColor = [UIColor clearColor];
    [tLabel setFont:[UIFont systemFontOfSize:16.f]];
    [tLabel setTextColor:COLOR_BLACK];
//    [tLabel setShadowColor:[UIColor blackColor]];
//    [tLabel setShadowOffset:_ShadowSize];
    [tLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:tLabel];
    self._titleLabel = tLabel;
    
    UIView* tLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-0.5, F_DEVICE_W, 0.5)];
    tLine.backgroundColor = COLOR_BORDER;
    tLine.tag = 9698;
    [self addSubview:tLine];
}

-(UIView*) getLine;
{
    return [self viewWithTag:9698];
}

- (void)titleBtnClick:(UIButton*)button
{
//    DLog(" ----- 点击： %ld", [button tag]);

    if ([self._target respondsToSelector:@selector(titleBtnClick:)]) {
        [self._target titleBtnClick:button];
    }
}

#pragma mark - -------- settting ----------

- (void)left:(NSString *)img btnImg:(NSString *)btnImg
{
    [self._leftImg setHidden:k_Is_Empty(img)];
    [self._leftBtn setHidden:k_Is_Empty(btnImg)];

    UIImage *tImage = [UIImage imageNamed:img];

    if (tImage) {
//        self._leftImg.size = [self scaleImgSize:tImage];
        [self._leftImg setImage:tImage];
    }

    tImage = [UIImage imageNamed:btnImg];

    if (tImage) {
//        self._leftBtn.size = [self scaleImgSize:tImage];
//        [self._leftBtn dosetImg:btnImg selectImg:nil highlightedImg:nil];
        [self._leftBtn setImage:tImage forState:UIControlStateNormal];
    }
}

- (void)right:(NSString *)img btnImg:(NSString *)btnImg
{
    [self._rightImg setHidden:k_Is_Empty(img)];
    [self._rightBtn setHidden:k_Is_Empty(btnImg)];

    UIImage *tImage = [UIImage imageNamed:img];

    if (tImage) {
//        self._rightImg.size = [self scaleImgSize:tImage];
        self._rightImg.right = F_DEVICE_W;
        [self._rightImg setImage:tImage];
    }

    tImage = [UIImage imageNamed:btnImg];

    if (tImage) {
        [self._rightBtn setImage:tImage forState:UIControlStateNormal];

//        self._rightBtn.size = tImage.size;
        self._rightBtn.right = F_DEVICE_W;
    }
}

- (void)center:(NSString *)img btnImg:(NSString *)btnImg
{
    [self._centerImg setHidden:k_Is_Empty(btnImg)];
    [self._centerBtn setHidden:k_Is_Empty(btnImg)];

    if (k_Is_Empty(btnImg)) {
        return;
    }

    UIImage *tImage = [UIImage imageNamed:btnImg];

    if (tImage) {
        [self._centerBtn setImage:tImage forState:UIControlStateNormal];

//        [self._centerBtn dosetBgImg:btnImg selectImg:nil highlightedImg:nil];
        self._centerBtn.size = CGSizeMake(self._centerBtn.width, self._centerBtn.height);
        self._centerBtn.center = CGPointMake(self.width/2, self.height/2);
        
//        CGSize  size = k_Text_Size(self._titleLabel.text, [UIFont systemFontOfSize:18.f], 500);
//        float   sX = size.width + (F_DEVICE_W - size.width) / 2.f + 5;
//        CGRect  frame = CGRectMake(sX, (f_Title_h - tImage.size.height / 2.f) / 2.f, tImage.size.width / 2.f, tImage.size.height / 2.f);
//        [self._centerImg setImage:tImage];
//        [self._centerImg setFrame:frame];
    }
}

- (void)label:(NSString *)title
{
    [self._titleLabel setText:title];
    [self._titleLabel setHidden:k_Is_Empty(title)];
    
//    if (!self._centerImg.hidden) {
//        CGSize  size = k_Text_Size(self._titleLabel.text, self._titleLabel.font, 500);
//        float   sX = size.width + (F_DEVICE_W - size.width) / 2.f;
//        [self._centerImg setLeft:sX];
//    }
}


- (void)leftTitle:(NSString *)leftTitle;
{
    [self._leftBtn setHidden:k_Is_Empty(leftTitle)];
    [self._leftBtn setTitle:leftTitle forState:UIControlStateNormal];
    [self._leftBtn setTitleColor:COLOR_DRAK forState:UIControlStateNormal];
    [self._leftBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    self._leftBtn.width = self._leftBtn.titleLabel.realSize.width+5;
    self._leftBtn.left = 10;
}
- (void)rightTitle:(NSString *)rightTitle;
{
    [self._rightBtn setHidden:k_Is_Empty(rightTitle)];
    [self._rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    [self._rightBtn setTitleColor:COLOR_DRAK forState:UIControlStateNormal];
    [self._rightBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    self._rightBtn.width = self._rightBtn.titleLabel.realSize.width+5;
    self._rightBtn.right = F_DEVICE_W-10;

}

/// 设置透明度
-(void) setTitleAlpha:(float)alpha;
{
    if (alpha > 0) {
        alpha += 0.4;
    }
    
    self._backView.alpha = alpha;
    self._titleLabel.alpha = alpha;
    [self getLine].alpha = alpha;
}

//-(CGSize) scaleImgSize:(UIImage*)image
//{
//    if (image.height<self.height) {
//        return CGSizeMake(image.width, image.height);
//    }
//    float tSub = (self.height)/image.height;
//    
//    return CGSizeMake(image.width*tSub, image.height*tSub);
//}

@end

//@implementation UIButton (images)
//
//- (void)setBgImages:(NSString *)imgName
//{
//    [self setBackgroundImage:[UIImage getImage:imgName] forState:UIControlStateNormal];
//    [self setBackgroundImage:[UIImage getImage:[imgName stringByReplacingOccurrencesOfString:@".png" withString:@"_h.png"]] forState:UIControlStateHighlighted];
//}
//
//- (void)setImages:(NSString *)imgName
//{
//    [self setImage:[UIImage getImage:imgName] forState:UIControlStateNormal];
//    [self setImage:[UIImage getImage:[imgName stringByReplacingOccurrencesOfString:@".png" withString:@"_h.png"]] forState:UIControlStateHighlighted];
//}
//
//@end
