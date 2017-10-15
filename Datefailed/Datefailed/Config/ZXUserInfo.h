//
//  ZXUserInfo.h
//  ChinaSteel
//
//  Created by zhiyou on 14-11-14.
//  Copyright (c) 2014年 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXUserInfo : NSObject{
    
    BOOL      isLogin; //登陆判断
    BOOL      isPush; //是否为推送
    double    lat;//纬度
    double    lng;//经度
    NSString *city;//城市
    NSString *uId;//uid
    NSString *addressId;//收货地址ID
    NSString *phoneNumber;//手机
    NSString *nickName;//姓名
    NSString *avaURL;//头像地址
    NSNumber *finishCount;//成交笔数
    NSString *evaluation;//好评率
    NSNumber *memPoint;//积分
    NSNumber *userLevel;//等级
    NSString *avaCarURL;//车头照
    NSString *plateNum;//车牌号
    NSString *carType;//车型
    NSString *carLength;//车长
    NSString *weight;//载重
    NSString *clientId;//推送Id
    


}

@property (nonatomic,assign)BOOL      isLogin;
@property (nonatomic,assign)BOOL      isPush;
@property (nonatomic,assign)double    lat;
@property (nonatomic,assign)double    lng;
@property (nonatomic,retain)NSString *city;
@property (nonatomic,retain)NSString *uId;
@property (nonatomic,retain)NSString *addressId;
@property (nonatomic,retain)NSString *phoneNumber;
@property (nonatomic,retain)NSString *nickName;
@property (nonatomic,retain)NSString *avaURL;
@property (nonatomic,retain)NSNumber *finishCount;
@property (nonatomic,retain)NSString *evaluation;
@property (nonatomic,retain)NSNumber *memPoint;
@property (nonatomic,retain)NSNumber *userLevel;
@property (nonatomic,retain)NSString *avaCarURL;
@property (nonatomic,retain)NSString *plateNum;
@property (nonatomic,retain)NSString *carType;
@property (nonatomic,retain)NSString *carLength;
@property (nonatomic,retain)NSString *weight;
@property (nonatomic,retain)NSString *clientId;


+(ZXUserInfo *)shareUserInfo;
-(void)setLoginStatus:(BOOL)login;
+(void)cancleUserInfo;
@end
