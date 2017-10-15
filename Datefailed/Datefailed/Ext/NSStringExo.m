//
//  NSStringEx
//  TKit
//
//  Created by bill on 12-12-21.
//  Copyright (c) 2012年 _Mac. All rights reserved.
//

#import "NSStringExo.h"

@implementation NSString (Ext)

#pragma mark - -------- delete ----------

/// 删除字符 删除开头和结尾空格
- (NSString *)deleteTriSpace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/// 删除字符 删除空格
- (NSString *)deleteSpace
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/// 替换 nbsp 空格
- (NSString *)delete_nbsp
{
    return [self stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
}

/// 删除字符 删除空格和换行
- (NSString *)deleteSpaceAndLine
{
    return [[[[self deleteTriSpace] deleteSpace] stringByReplacingOccurrencesOfString:@"\r" withString:@""] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}

/// 删除字符 删除标点符号
- (NSString *)deleteSpecialChar
{
    NSString        *spChar = @"`~!@#$%^&*()-=_+[]{}\\|;':\",.<>?  ～！@#￥%……&*（）—-=——+｛｝【】|、；‘：“，。《》、？／";
    NSCharacterSet  *set = [NSCharacterSet characterSetWithCharactersInString:spChar];
    return [self stringByTrimmingCharactersInSet:set];
}

/// 删除指定字符串 regex:正则表达式
- (NSString *)deleteByRegex:(NSString *)regex
{
    NSRange all = NSMakeRange(0, self.length);

    return [self stringByReplacingOccurrencesOfString:regex withString:@"" options:NSRegularExpressionSearch range:all];
}

/// 删除指定字符串 target:指定字符串
- (NSString *)deleteStr:(NSString *)target
{
    NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:target];

    return [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
}

/// 删除不匹配的字符串 target:指定字符串
- (NSString *)deleteUnMatchStr:(NSString *)target
{
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:target] invertedSet];

    return [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
}

#pragma mark - -------- new string by sub ----------

/// 截取字符串 指定结尾下标
- (NSString *)subTo:(NSUInteger)to
{
    if (self.length <= to) {
        return self;
    }

    return [self substringToIndex:to];
}

/// 截取字符串 指定开始下标
- (NSString *)subFrom:(NSUInteger)from
{
    if (self.length <= from) {
        return self;
    }

    return [self substringFromIndex:from];
}

/// 截取字符串 截取为日期 (yyyy-MM-dd )
- (NSString *)subToDate
{
    if ([self isContain:@"1970-01-01"]) {
#if DEBUG
            return @"----/--/--";

#else
            return @"";
#endif
    }

    return [self subTo:10];
}

/// 截取字符串 截取为数组
- (NSArray *)subToArrBy:(NSString *)sub
{
    if (!sub || [sub isEqualToString:@""]) {
        return nil;
    }

    // [self deleteSpaceAndLine]
    return [self componentsSeparatedByString:sub];
}

#pragma mark - -------- new string by init ----------

/// int 初始化字符串
+ (NSString *)stringByInt:(int)t
{
    return [NSString stringWithFormat:@"%d", t];
}

/// float 初始化字符串
+ (NSString *)stringByFloat:(float)f
{
    return [NSString stringWithFormat:@"%f", f];
}

/// id 初始化字符串
+ (NSString *)stringById:(id)param
{
    return [NSString stringWithFormat:@"%@", param ? param:@""];
}

- (NSNumber *)numberValue
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];

    return [numberFormatter numberFromString:self];
}

- (NSString *)appendFmt:(NSString *)format, ...
    {
    va_list args;
    va_start(args, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    return [self appendStr:str];
}

/// 拼接字符串 追加字符串
- (NSString *)appendStr:(NSString *)str
{
    if (str) {
        return [self stringByAppendingString:[str description]];
    }

    return self;
}

/// 拼接字符串 追加路径
- (NSString *)appendPath:(NSString *)str
{
    if (str && ![str isEqualToString:@""]) {
        return [self stringByAppendingString:[NSString stringWithFormat:@"/%@", str]];
    }

    return self;
}

/// 获取指定位置的 字符
- (NSString *)strAtIndex:(NSInteger)index
{
    if ((index >= self.length) || (index < 0)) {
        return @"";
    }

    NSRange range = NSMakeRange(index, 1);
    return [self substringWithRange:range];
    //    return [NSString stringWithFormat:@"%c", [self characterAtIndex:index]];
}

/// 生成uuid
+ (NSString *)uuidWithPrefix:(NSString *)prefix
{
    NSString    *result = nil;
    CFUUIDRef   uuid = CFUUIDCreate(NULL);
    CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);

    if (prefix && ![prefix isEqualToString:@""]) {
        result = [NSString stringWithFormat:@"%@-%@", prefix, uuidStr];
    } else {
        result = [NSString stringWithFormat:@"%@", uuidStr];
    }

    CFRelease(uuidStr);
    CFRelease(uuid);

    return result;
}

/// URL 标准转码
- (NSString *)encodeURL
{
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
}

#pragma mark - -------- is xxx string ----------

/// 是否有效的日期字符串
- (BOOL)isValidDate
{
    if ([self isEqualToString:@""]) {
        return NO;
    }

    if ([self isContain:s_Null_Date]) {
        return NO;
    }

    return YES;
}

/// 是否包含特殊字符
- (BOOL)isContainSpecialChar
{
    NSString    *regex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

    return ![pred evaluateWithObject:self];
}

/// 是否包含数字
- (BOOL)isContainNumber
{
    NSCharacterSet  *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    NSString        *filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];

    return ![filtered isEqualToString:self];
}

/// 是否纯数字
- (BOOL)isNumber
{
    return ![self isByRegex:@"-?\\d+"];
    //    NSCharacterSet  *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    //    NSString        *filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    //
    //    return !filtered || [filtered isEqualToString:@""];
}

/// 判断是否为整形：
- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/// 判断是否为浮点形：
- (BOOL)isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}


/// 是否包含指定字符串
- (BOOL)isContain:(NSString *)str
{
    return [self rangeOfString:str].location != NSNotFound;
}

/// 是否包含指定字符串 regex:正则表达式
- (BOOL)isByRegex:(NSString *)regex
{
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

    return ![regexTest evaluateWithObject:self];
}

/// 是否有效手机号码 [大陆手机]
- (BOOL)isMobileNumber
{
    /**
     * 手机号码
     * 移动：134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     * 联通：130,131,132,145,152,155,156,1709,171,176,185,186
     * 电信：133,134,153,1700,177,180,181,189
     */
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     */
    NSString * CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[0]|7[8]|8[2-478])\\d{8}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,152,155,156,1709,171,176,185,186
     */
    NSString * CU = @"^1(3[0-2]|4[5]|5[56]|709|7[1]|7[6]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,134,153,1700,177,180,181,189
     */
    NSString * CT = @"^1(3[34]|53|77|700|8[019])\\d{8}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


-(NSString*) encryMobile
{
    if (self.length == 11) {
        return [[[self subTo:3] appendStr:@"****"] appendStr:[self subFrom:7]];
    }
    return self;
}


+(NSString *)getNowTimes;
{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",a];
    return timeString;
}

@end

#pragma mark - -------- NSMutableString ----------

@implementation NSMutableString (add)

/// 拼接字符串 追加字符串
- (void)addStr:(NSString *)str
{
    if (str) {
        [self appendString:str];
    }
}

/// 拼接字符串 追加CDATA字符串
- (void)addCDATA:(NSString *)str
{
    if (str && ![str isEqualToString:@""]) {
        [self appendFormat:@"<![CDATA[%@]]>", str];
    }
}

@end
