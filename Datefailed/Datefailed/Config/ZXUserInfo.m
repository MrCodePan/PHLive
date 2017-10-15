//
//  ZXUserInfo.m
//  ChinaSteel
//
//  Created by zhiyou on 14-11-14.
//  Copyright (c) 2014年 ZX. All rights reserved.
//

#import "ZXUserInfo.h"

@implementation ZXUserInfo
@synthesize isLogin,isPush,lat,lng,city,phoneNumber,nickName,avaURL,uId,addressId,finishCount,evaluation,memPoint,userLevel,avaCarURL,plateNum,carType,carLength,weight,clientId;

static ZXUserInfo *userInfo=nil;

+(void)cancleUserInfo
{
    userInfo = nil;
}

+(ZXUserInfo *)shareUserInfo;
{
    if (userInfo==nil){
        userInfo=[[ZXUserInfo alloc] init];
    }
    return userInfo;
}

-(void)setLoginStatus:(BOOL)login
{
    self.isLogin=login;
}

@end
