//
//  ZXPublic.m
//  ChinaSteel
//
//  Created by zhiyou on 14-11-7.
//  Copyright (c) 2014年 ZX. All rights reserved.
//

#import "ZXPublic.h"
#import <CommonCrypto/CommonDigest.h>
@implementation ZXPublic

+(instancetype)shareManager{
    static ZXPublic *shareManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager =[[ZXPublic alloc]init];
    });
    return shareManager;
}


+(NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght

{
    
    NSString *newStr = originalStr;
    
    for (int i = 0; i < lenght; i++) {
        
        NSRange range = NSMakeRange(startLocation, 1);
        
        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];
        
        startLocation ++;
        
    }
    
    return newStr;
    
}

+ (NSString*) numberToStr:(NSNumber *)num
{
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    NSString *str = [numberFormatter stringFromNumber:num];
    return str;
}

+ (NSString*) getDate:(long)date
{
    NSDate *dateTime = [[NSDate alloc] initWithTimeIntervalSince1970:date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    NSLocale *formatterLocal = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
    [formatter setLocale:formatterLocal];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:dateTime];
    return dateString;
}

+ (NSString*) getDetailDate:(long)date
{
    NSDate *dateTime = [[NSDate alloc] initWithTimeIntervalSince1970:date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    NSLocale *formatterLocal = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
    [formatter setLocale:formatterLocal];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm"];
    NSString *dateString = [formatter stringFromDate:dateTime];
    return dateString;
}

+(NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (UIColor *)getColor:(NSString *)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}
//16进制转
+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}



// 删除沙盒里的文件
+ (BOOL) deleteFile:(NSString *)deleteStr {
    NSFileManager* fileManager=[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    //文件名
    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:deleteStr];
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
    if (!blHave) {
        NSLog(@"no  have");
        return NO;
    }else {
        NSLog(@" have");
        BOOL blDele= [fileManager removeItemAtPath:uniquePath error:nil];
        if (blDele) {
            NSLog(@"dele success");
            return blDele;
        }else {
            NSLog(@"dele fail");
            return blDele;
        }
        
    }
}

+ (BOOL) validateIdentityCard: (NSString *)identityCard

{
    
    BOOL flag;
    
    if (identityCard.length <= 0) {
        
        flag = NO;
        
        return flag;
        
    }
    
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:identityCard];
    
}


+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestphs evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 * @brief 判断车牌号
 */
+ (BOOL)isValidateCarNo:(NSString *)carNo
{
//    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
//    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
//    NSLog(@"carTest is %@",carTest);
//    return [carTest evaluateWithObject:carNo];
    
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", carRegex];
    NSLog(@"carTest is %@", carTest);
    return [carTest evaluateWithObject:carNo];
}

//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber
{
    BOOL flag;
    if (bankCardNumber.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{15,30})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}
//银行卡后四位
+ (BOOL) validateBankCardLastNumber: (NSString *)bankCardNumber
{
    BOOL flag;
    if (bankCardNumber.length != 4) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{4})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}

/**
 * @brief 判断当前时间是否在fromHour和toHour之间。如，fromHour=8，toHour=23时，即为判断当前时间是否在8:00-23:00之间
 */
- (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour
{
    NSDate *date8 = [self getCustomDateWithHour:8];
    NSDate *date23 = [self getCustomDateWithHour:23];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:date8]==NSOrderedDescending && [currentDate compare:date23]==NSOrderedAscending)
    {
        NSLog(@"该时间在 %d:00-%d:00 之间！", (int)fromHour, (int)toHour);
        return YES;
    }
    return NO;
}

/**
* @method
*
* @brief 获取两个日期之间的天数
* @param fromDate       起始日期
* @param toDate         终止日期
* @return    总天数
*/
+ (NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate{
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents * comp = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:NSCalendarWrapComponents];
        NSLog(@" -- >>  comp : %@  << --",comp);
        return comp.day;
}

+ (NSString *)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSString *str = [dateFormatter stringFromDate:date];
    NSLog(@">>>>%@",str);
    
    return str ? str : @"";
}
/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
- (NSDate *)getCustomDateWithHour:(NSInteger)hour
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [resultCalendar dateFromComponents:resultComps];
}

//+ (char)getFirstNSString:(NSString *)str {
//    HanyuPinyinOutputFormat *outputFormat=[[HanyuPinyinOutputFormat alloc] init];
//    [outputFormat setToneType:ToneTypeWithoutTone];
//    [outputFormat setVCharType:VCharTypeWithV];
//    [outputFormat setCaseType:CaseTypeLowercase];
//    
//    NSString * strOutPut = [PinyinHelper toHanyuPinyinStringWithNSString:str withHanyuPinyinOutputFormat:outputFormat withNSString:@" "];
//    [outputFormat release];
//    return [[strOutPut uppercaseString] characterAtIndex:0];
//}

/**
 *  图片缩放
 *
 *  @param image   原图片
 *  @param newSize 图片尺寸
 *
 *  @return 返回缩放后的图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

///// TIM - 登录
//-(void) TIM_Login
//{
//    if (!self.login_param) {
//        self.login_param = [[IMALoginParam alloc]init];
//    }
//    
//    // accountType 和 sdkAppId 通讯云管理平台分配
//    // identifier为用户名，userSig 为用户登录凭证
//    // appidAt3rd 在私有帐号情况下，填写与sdkAppId 一样
//    
//    
//    
//    _login_param.accountType = TIM_TYPE;
//    _login_param.identifier = [USER_INFO timIdentifier];
//    _login_param.userSig = [USER_INFO timSignature];
//    _login_param.appidAt3rd = TIM_APPID;
//    _login_param.sdkAppId = [TIM_APPID intValue];
//    //封装系统后登录
//    [[IMAPlatform sharedInstance] login:_login_param succ:^{
//        [_login_param saveToLocal];
//        [IMAPlatform setAutoLogin:YES];
//        NSString * nick = nil;
//        if ([[USER_INFO authState] intValue] == 2) {
//            nick = [USER_INFO storeName];
//        }
//        else {
//            nick = [USER_INFO phone];
//        }
//        [[TIMFriendshipManager sharedInstance] SetNickname:nick succ:^() {
//            NSLog(@"SetNickname Succ");
//        } fail:^(int code, NSString * err) {
//            NSLog(@"SetNickname fail: code=%d err=%@", code, err);
//        }];
//        NSString * ava_url = nil;
//        if ([[USER_INFO authState] intValue] == 2) {
//            //如果用户认证过商铺,就用店铺logo
//            ava_url = [USER_INFO logo];
//            if (ava_url == nil) {
//                //如果用户没有上传店铺logo 就用用户头像
//                ava_url = [USER_INFO userAvatar];
//            }
//        }
//        else {
//            ava_url = [USER_INFO userAvatar];
//        }
//        //推送
//        [[TIMFriendshipManager sharedInstance] SetFaceURL:[PicHeader appendStr:ava_url] succ:^{
//            NSLog(@"SetFaceURL Succ url = %@",[NSString stringWithFormat:@"%@",[PicHeader appendStr:ava_url]]);
//        } fail:^(int code, NSString *msg) {
//            NSLog(@"SetNickname fail: code=%d err=%@", code, msg);
//        }];
//        NSLog(@"Login Succ");
//        
//        TIMAPNSConfig *APNS = [[TIMAPNSConfig alloc]init];
//        APNS.openPush=1;
//        
//        [[TIMManager sharedInstance]getAPNSConfig:^(TIMAPNSConfig *config) {
//            [[TIMManager sharedInstance] setAPNS:APNS succ:^{
//                
//            } fail:^(int code, NSString *msg) {
//            }];
//        } fail:^(int code, NSString *msg) {
//        }];
//        [[TIMManager sharedInstance]doForeground];
//
//        
//        
//    } fail:^(int code, NSString *msg) {
//        NSLog(@"Login Failed: %d->%@", code, msg);
//    }];
//    //系统级登录
////    [[TIMManager sharedInstance] login: login_param succ:^(){
////        [login_param saveToLocal];
////        [IMAPlatform setAutoLogin:YES];
////        NSString * nick = nil;
////        if ([[USER_INFO authState] intValue] == 2) {
////            nick = [USER_INFO storeName];
////        }
////        else {
////            nick = [USER_INFO phone];
////        }
////        [[TIMFriendshipManager sharedInstance] SetNickname:nick succ:^() {
////            NSLog(@"SetNickname Succ");
////        } fail:^(int code, NSString * err) {
////            NSLog(@"SetNickname fail: code=%d err=%@", code, err);
////        }];
////        NSString * ava_url = nil;
////        if ([[USER_INFO authState] intValue] == 2) {
////            ava_url = [USER_INFO logo];
////        }
////        else {
////            ava_url = [USER_INFO userAvatar];
////        }
////        [[TIMFriendshipManager sharedInstance] SetFaceURL:[PicHeader appendStr:ava_url] succ:^{
////            NSLog(@"SetFaceURL Succ");
////        } fail:^(int code, NSString *msg) {
////            NSLog(@"SetNickname fail: code=%d err=%@", code, msg);
////        }];
////        NSLog(@"Login Succ");
////    } fail:^(int code, NSString * err) {
////        NSLog(@"Login Failed: %d->%@", code, err);
////    }];
//}
//
/////**
//// *  alipay支付
//// *
//// *  @param orderString 订单标识
//// */
////+(void)payAlipay:(NSString *)orderString{
////    //[orderString stringByReplacingOccurrencesOfString:@"\\" withString:@""]
////    NSString *appScheme = @"ZXShoppingPro";
////    [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
////        NSLog(@"payAlipay - reslut = %@",resultDic);
////        NSArray* views = [[UIApplication sharedApplication] windows];
////        UIWindow* windowtemp = views[0];
////        windowtemp.hidden = YES;
////        if ([resultDic[@"resultStatus"] intValue]==9000) {
////            //支付成功
////            [SVProgressHUD showSuccessWithStatus:@"支付成功"];
////            //发送支付成功通知
////            [[NSNotificationCenter defaultCenter] postNotificationName:kStr_NotifactionPaySuccess object:nil];
////        }else if ([resultDic[@"resultStatus"] intValue]==6001){
////            //支付取消
////            [SVProgressHUD showErrorWithStatus:@"支付取消"];
//////            AlertView_Show_TIP(kStrTips_Z_Common_TipsTitle, kStrTips_Z_PayCancleContent);
////        }else{
////            //支付失败
////            [SVProgressHUD showErrorWithStatus:@"支付失败"];
//////            AlertView_Show_TIP(kStrTips_Z_Common_TipsTitle, kStrTips_Z_PayFaildContent);
////        }
////    }];
////}
////
/////**
//// *  微信支付
//// *
//// *  @param dict 微信支付参数
//// */
////+(void)sendPayByServer:(NSDictionary *)dict{
////    NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
////    //调起微信支付
////    PayReq* req             = [[PayReq alloc] init];
////    req.openID              = [dict objectForKey:@"appid"];
////    req.partnerId           = [dict objectForKey:@"partnerid"];
////    req.prepayId            = [dict objectForKey:@"prepayid"];
////    req.nonceStr            = [dict objectForKey:@"noncestr"];
////    req.timeStamp           = stamp.intValue;
////    req.package             = [dict objectForKey:@"package"];
////    req.sign                = [dict objectForKey:@"sign"];
////    [WXApi sendReq:req];
////    
////    //日志输出
////    NSLog(@"sendReq------>appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",req.openID,req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign);
////}

@end
