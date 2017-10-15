//
//  ZXPublic.h
//  ChinaSteel
//
//  Created by zhiyou on 14-11-7.
//  Copyright (c) 2014年 ZX. All rights reserved.
//

#import "FileHeader.h"
//#include "PinYin4Objc.h"
@interface ZXPublic : NSObject

+(NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght;//手机号替换*

+ (NSString*) numberToStr:(NSNumber *)num;			//NSNumber转NSString

+ (NSString*) getDate:(long)date;			//获取时间

+ (NSString*) getDetailDate:(long)date;      //获取详细时间

+ (NSString *)md5:(NSString *)str;           //md5加密

+ (UIColor *)getColor:(NSString *)hexColor; //16进制转UIColor

+ (BOOL) deleteFile:(NSString *)deleteStr;

+ (BOOL)isMobileNumber:(NSString *)mobileNum;//是否是正确的手机号码

+ (BOOL)isValidateCarNo:(NSString *)carNo;//是否是正确的车牌号

+ (BOOL) validateIdentityCard: (NSString *)identityCard;//是否是正确的身份证号

+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber;//是否是正确的银行卡

+ (BOOL) validateBankCardLastNumber: (NSString *)bankCardNumber;//是否是正确的银行卡后四位
+ (UIColor *) colorWithHexString: (NSString *)color;//16进制

+ (NSString *)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat;//格式化获取时间

+ (NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;//计算两个时间之间的天数
//+ (char)getFirstNSString:(NSString *)str;

+ (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize;

//+(void)payAlipay:(NSString *)orderString;
//
//+(void)sendPayByServer:(NSDictionary *)dict;
+(instancetype)shareManager; //单例
-(void) TIM_Login;
@end
