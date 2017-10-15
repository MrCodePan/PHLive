
//
//  Header.h
//  Demo
//
//  Created by LiuTao on 16/7/3.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#ifndef Header_h
#define Header_h


#ifdef DEBUG
#define DLog(fmt, ...) NSLog( (@"%s [Line %d] " fmt), __func__, __LINE__, ## __VA_ARGS__ );
#define LOG_DEALLOC     -(void)dealloc {     NSLog(@"%s",__func__); }
#else
#define DLog(...)
#define LOG_DEALLOC
#endif

// ****************************************** 数据常量 ******************************************



#ifdef DEBUG

#define S_HOST  [ConfigData hostCfg]

#else
#define S_HOST  [ConfigData hostCfg]

#endif

#define S_IMG_URL(path)   [S_HOST stringByAppendingString:path]

/// 客服号码
#define S_PHONE_NUM     @"400-822-0036"
// ****************************************** UI常量 ******************************************

/// 屏幕宽度
#define F_DEVICE_BOUNDS     [UIScreen mainScreen].bounds
/// 屏幕宽度
#define F_DEVICE_W          [UIScreen mainScreen].bounds.size.width
/// 屏幕高度
#define F_DEVICE_H          [UIScreen mainScreen].bounds.size.height
/// 状态栏高
#define F_STATUS_BAR_H      20
/// 导航栏高
#define F_NAV_BAR_H         44
/// 导航页面Y
#define F_NAV_Y             (F_STATUS_BAR_H + F_NAV_BAR_H)
/// 导航页面高
#define F_NAV_H             (F_DEVICE_H - F_NAV_Y)
/// Tabbar
#define F_TAB_BAR_H         49
/// 根据iphone6 效果图的尺寸 算出实际设备中尺寸
#define F_I6_SIZE(f)        ( ( (int)( ( F_DEVICE_W * ( (f) / 375.f ) ) * 2 ) ) / 2.f )
/// 根据iphone5 效果图的尺寸 算出实际设备中尺寸
#define F_I5_SIZE(f)        ( ( (int)( ( F_DEVICE_W * ( (f) / 320.f ) ) * 2 ) ) / 2.f )


//奶油往内部存东西
#define N_SAVE_THING(obj,key)     [[NSUserDefaults standardUserDefaults]setObject:obj forKey:key];

//奶油 从内部取东西
#define N_TAKE_THING(obj)  [[NSUserDefaults standardUserDefaults]objectForKey:obj]


// ****************************************** 目录常量 ******************************************

/// --- 文件目录
#define kPathTemp                   NSTemporaryDirectory()
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathLibrary                [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathBundle                 [[NSBundle mainBundle] bundlePath]
/// 路径是否存在
#define kPathExists(path)           [[NSFileManager defaultManager] fileExistsAtPath : path]


#define kPathInDirctory(n, dir)     [dir stringByAppendingPathComponent : n]
#define kPathInNSBundle(n, dir)     [[kPathBundle stringByAppendingPathComponent:(dir.length>0) ? (dir) : (n)] stringByAppendingPathComponent : (dir.length>0) ? (n) : nil]

#define kPathInBundle(n)     [kPathBundle stringByAppendingPathComponent:(n)]

/// 自动创建目录(多级目录)
#define kPathCreate(subPath, inDirectory) \
{ \
id directory = inDirectory; \
if (!directory) {directory = kPathDocument; } \
if (subPath) { \
if (![[NSFileManager defaultManager] fileExistsAtPath : [directory stringByAppendingPathComponent:subPath]]) { \
__autoreleasing NSError *error = nil; \
[[NSFileManager defaultManager] createDirectoryAtPath:[directory stringByAppendingPathComponent:subPath] withIntermediateDirectories:YES attributes:nil error:&error]; \
if (error) {NSLog(@"创建目录失败 %@", error); } \
else {NSLog(@"创建目录成功 %@", [directory stringByAppendingPathComponent:subPath])} \
} \
} \
}

// ****************************************** BLOCK常量 ******************************************

//// block
#define RELEASE_BLOCK(__x)              if (__x != NULL) {Block_release(__x); } \
__x = NULL
#define COPY_BLOCK(__dest, __src)       if (__src != NULL && __dest != __src) __dest = Block_copy(__src)
#define EXECUTE_BLOCK(A, ...)            if (A != NULL) {A(__VA_ARGS__); }
#define _bself                          __weak typeof(self) bSelf = self;
//奶油
#define removeImage     [[SDImageCache sharedImageCache] removeImageForKey:[PicHeader appendStr:[USER_INFO logo]]]



/// 无参数
typedef void (^VBlock)();
/// 一个参数(id)
typedef void (^TBlock)(id item);
/// 一个参数(int)
typedef void (^IBlock)(NSInteger index);
/// 一个参数(float)
typedef void (^FBlock)(float item);
/// 一个参数(bool)
typedef void (^BBlock)(BOOL isSuccess);
/// 一个参数(id) 返回(id)
typedef id (^RTBlock)(id item);
/// 一个参数(bool) 返回(bool)
typedef BOOL (^RBBlock)();

// ****************************************** 工具常量 ******************************************

/// System version utils
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/// 获取RGB颜色
#define kRGBA(r, g, b, a)       [UIColor colorWithRed : r / 255.0f green : g / 255.0f blue : b / 255.0f alpha : a]
#define kRGB(r, g, b) RGBA(r, g, b, 1.0f)

/// 竖屏
#define IsPortrait              ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)

/// nil 或者 NSNull
#define IsNilOrNull(_ref)       ( ( (_ref) == nil ) || ([(_ref) isEqual:[NSNull null]]) )

///大于等于7.0的ios版本
#define iOS7_OR_LATER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")

///大于等于8.0的ios版本
#define iOS8_OR_LATER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

///iOS6时，导航VC中view的起始高度
#define YH_HEIGHT           (iOS7_OR_LATER ? 64 : 0)

///获取系统时间戳
#define getCurentTime       [NSString stringWithFormat : @"%ld", (long)[[NSDate date] timeIntervalSince1970]]

/// 属性字符串
#define k_AttributedString(f, c, t)     [[NSAttributedString alloc] initWithString : t attributes : @{NSFontAttributeName :[UIFont systemFontOfSize:f], NSForegroundColorAttributeName :c}]

/// 可变属性字符串
#define k_MuAttriText(texts)            NSMutableAttributedString * muAttrStr = [NSMutableAttributedString new]; \
if (texts && [texts isKindOfClass:[NSArray class]]) { \
for (id attrStr in texts) { \
[muAttrStr appendAttributedString:attrStr];    } \
}


// ****************************************** 数据常量 ******************************************

/// NSUserDefaults 读写
#define K_UserDefault_Write(key,value)      [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define K_UserDefault_Read(key)             [[NSUserDefaults standardUserDefaults] objectForKey:key]

/// 有效的数组
#define k_Is_Valid_Arr(arr)    (arr && [arr isKindOfClass:[NSArray class]] && [arr count] > 0)

/// 当前的语言
#define l_CurrentLanguage           ([[NSLocale preferredLanguages] objectAtIndex:0])
/// 本地换字符获取
#define k_Localized(k)              [[NSBundle mainBundle] localizedStringForKey : (k)value : @"" table : nil]
/// 加载nib文件
#define k_Load_nib(n)               [[[NSBundle mainBundle] loadNibNamed:n owner:self options:nil] objectAtIndex : 0]
/// 浮点为0判断
#define k_Is_Zero(f)                (f > -0.00001f && f < 0.00001f)

/// 弧度转化
#define k_DegreesToRadians(degrees)              ( (degrees) * M_PI / 180.0 )
/// 弧度转化
#define k_RadiansToDegrees(radians)              ( (radians) * 180.0 / M_PI )

/// 判断字符串是否为空
#define k_Is_Empty(s)               (!s || [s isEqual:[NSNull null]] || [s isEqualToString:@""] || [s isEqualToString:@"null"])
/// 判断对象是否为空
#define k_Is_Nil(s)                 (!s || [s isEqual:[NSNull null]])
/// 去除特殊json 字符 (手动拼接json 字符串)
#define JsonStr(value)              [[value stringByReplacingOccurrencesOfString:@"\"" withString:@""] \
stringByReplacingOccurrencesOfString : @"\"" withString : @""]
///  "key":"value"
#define k_Json_Str(key, value)      [NSString stringWithFormat : @"\"%@\":\"%@\"", (key ? key : @""), (value ? JsonStr(value) : @"")]
///  "key":"value"
#define k_Json_Int(key, value)      [NSString stringWithFormat : @"\"%@\":%@", (key ? key : @""), (value ? value : @"0")]
///  "key":"value"
#define k_Json_StrEx(key, value)    [NSString stringWithFormat : @"\"%@\":%@", (key ? [key stringByReplacingPercentEscapesUsingEncoding : CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8)] : @""), (value ? [value stringByReplacingPercentEscapesUsingEncoding : CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8)] : @"")]


#define S_Null_Date     @"1970-01-01"
#define ALPHA           @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
#define NUMBERS         @"0123456789"
#define ALPHANUM        @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 "
#define NUMBERSPERIOD   @"0123456789."

/// 金额显示 自动处理,单位:分  350 => 3.5
#define K_MONEY(money)          ([money intValue] % 10 != 0) ? [NSString stringWithFormat : @"%.2f", [money floatValue] / 100] : \
( ([money intValue] % 100 != 0) ? [NSString stringWithFormat : @"%.1f", [money floatValue] / 100] :                           \
[NSString stringWithFormat : @"%d", [money intValue] / 100] )
/// 金额显示 自动处理,单位:分  350 => 3.5元
#define K_MONEY_Y(money)        ([money intValue] % 10 != 0) ? [NSString stringWithFormat : @"%.2f 元", [money floatValue] / 100] : \
( ([money intValue] % 100 != 0) ? [NSString stringWithFormat : @"%.1f 元", [money floatValue] / 100] :                           \
[NSString stringWithFormat : @"%d 元", [money intValue] / 100] )
/// 金额显示 自动处理,单位:分  350 => ￥3.5
#define K_MONEY_S(money)        ([money intValue] % 10 != 0) ? [NSString stringWithFormat : @"￥%.2f", [money floatValue] / 100] : \
( ([money intValue] % 100 != 0) ? [NSString stringWithFormat : @"￥%.1f", [money floatValue] / 100] :                           \
[NSString stringWithFormat : @"￥%d", [money intValue] / 100] )
/// 金额显示 自动处理,单位:分  350 => ￥3.5元
#define K_MONEY_YS(money)       ([money intValue] % 10 != 0) ? [NSString stringWithFormat : @"￥%.2f 元", [money floatValue] / 100] : \
( ([money intValue] % 100 != 0) ? [NSString stringWithFormat : @"￥%.1f 元", [money floatValue] / 100] :                           \
[NSString stringWithFormat : @"￥%d 元", [money intValue] / 100] )


#define K_MONEY_F(money)          [NSString stringWithFormat : @"￥%.2f", money]
#define K_MONEY_FV(money)          [NSString stringWithFormat : @"￥%.2f", [money doubleValue]]

/// 距离显示 自动处理,单位:米  3470 => 3.47KM,  470 => 470M
#define K_JULI_KM(juli)         ( ([juli intValue] < 1000) ? [NSString stringWithFormat : @"%d M", [juli intValue]] :[NSString stringWithFormat:@"%.2f KM", [juli floatValue] / 1000] )
/// 距离显示 自动处理,单位:米  3470 => 3.47KM
#define K_JULI_K(juli)          ([NSString stringWithFormat:@"%.2f KM", [juli floatValue] / 1000])
/// 距离显示 自动处理,单位:米  3470 => 3470M
#define K_JULI_M(juli)          ([NSString stringWithFormat:@"%d 米", [juli intValue]])
/// 距离显示 自动处理,单位:米  3470 => 3.47千米,  470 => 470米
#define K_JULI_MI(juli)         ( ([juli intValue] < 1000) ? [NSString stringWithFormat : @"%d 米", [juli intValue]] :[NSString stringWithFormat:@"%.2f 千米", [juli floatValue] / 1000] )

/// 获取 时:分:秒
#define kGetTimes(time)     [NSString stringWithFormat:@"%02d:%02d:%02d",[time intValue]/3600,[time intValue]%3600/60,[time intValue]%60]

// ****************************************** 单例 ******************************************

/// 单例
#ifndef SINGLETON_FOR_CLASS

#import <objc/runtime.h>

#define SINGLETON_FOR_CLASS_HEADER(__CLASSNAME__)   \
\
+ (__CLASSNAME__ *)getInstance; \
+ (void)purgeGetInstance;


#define SINGLETON_FOR_CLASS(__CLASSNAME__)  \
\
static __CLASSNAME__ * _ ## __CLASSNAME__ ## _getInstance = nil; \
\
+ (__CLASSNAME__ *)getInstanceNoSynch   \
{   \
return (__CLASSNAME__ *)_ ## __CLASSNAME__ ## _getInstance; \
}   \
\
+ (__CLASSNAME__ *)getInstanceSynch \
{   \
@synchronized(self) {    \
if (nil == _ ## __CLASSNAME__ ## _getInstance) {  \
_ ## __CLASSNAME__ ## _getInstance = [[self alloc] init];   \
} \
else {  \
NSAssert2(1 == 0, @"SynthesizeSingleton: %@ ERROR: +(%@ *)getInstance method did not get swizzled.", self, self); \
}   \
}   \
return (__CLASSNAME__ *)_ ## __CLASSNAME__ ## _getInstance; \
}   \
\
+ (__CLASSNAME__ *)getInstance  \
{   \
return [self getInstanceSynch]; \
}   \
\
+ (id)allocWithZone:(NSZone *)zone  \
{   \
@synchronized(self) {    \
if (nil == _ ## __CLASSNAME__ ## _getInstance) { \
_ ## __CLASSNAME__ ## _getInstance = [super allocWithZone:zone];    \
if (nil != _ ## __CLASSNAME__ ## _getInstance) {  \
Method newGetInstanceMethod = class_getClassMethod( self, @selector(getInstanceNoSynch) );    \
method_setImplementation( class_getClassMethod( self, @selector(getInstance) ), method_getImplementation(newGetInstanceMethod) );   \
}   \
}   \
}   \
return _ ## __CLASSNAME__ ## _getInstance;  \
}   \
\
+ (void)purgeGetInstance    \
{   \
@synchronized(self) {    \
if (nil != _ ## __CLASSNAME__ ## _getInstance) {  \
Method newSharedInstanceMethod = class_getClassMethod( self, @selector(getInstanceSynch) );   \
method_setImplementation( class_getClassMethod( self, @selector(getInstance) ), method_getImplementation(newSharedInstanceMethod) );    \
_ ## __CLASSNAME__ ## _getInstance = nil;   \
}   \
}   \
}   \
\
- (id)copyWithZone:(NSZone *)zone   \
{   \
return self;    \
}

#endif

/*
 云调味色值规范
 1、买家版主色红色色值：ff5a60     卖家版主色蓝色色值：0b95ff
 2、其他字体、线、框的色值两个端都一样
 整个APP底色色值是：efefef；
 线的色值是：eaeaea；
 框的色值是：c2c2c2；
 底部导航上边的线条色值是：c3c3c3
 黑色文字色值总共有三种：
 最重323232 如：标题、重要文字
 通用808080
 最浅c2c2c2   如：输入框内提示字体
 
 

 */

#define COLOR_RED       [ZXPublic  getColor:@"ff5a60"]
#define COLOR_BG        [ZXPublic  getColor:@"efefef"]
#define COLOR_LINE      [ZXPublic  getColor:@"eaeaea"]
#define COLOR_BORDER    [ZXPublic  getColor:@"c2c2c2"]


#define COLOR_GRAY    [ZXPublic  getColor:@"c2c2c2"]
#define COLOR_DRAK    [ZXPublic  getColor:@"808080"]
#define COLOR_BLACK   [ZXPublic  getColor:@"323232"]

//JPush
#define TOKEN_KEY @"LKJDLKHASJL;KJ;LJK9829384"
#define DEVICE_TOKEN K_UserDefault_Read(TOKEN_KEY)

#define ADD_LINE(frame,superView) {    UIView* lineView = nil;\
lineView = [[UIView alloc] initWithFrame:frame];\
lineView.backgroundColor = COLOR_LINE;\
[superView addSubview:lineView];\
}

#define ADD_LINE_GRAY(frame,superView) {    UIView* lineView = nil;\
lineView = [[UIView alloc] initWithFrame:frame];\
lineView.backgroundColor = COLOR_GRAY;\
[superView addSubview:lineView];\
}

#pragma mark - 获取当前版本号
#define k_CURRENT_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

 
//设置全局的 实名认证审核状态
static BOOL g_ResetAuth;

// ****************************************** 头文件 ******************************************

#import "UIExt.h"
#import "ZXPublic.h"
#import "UIViewEx.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
//#import "TDataSource.h"
//#import "BTableCellExt.h"
#import "NSStringExo.h"
#import "UILabelEx.h"
#import "SVPullToRefresh.h"
//#import "ReqController.h"
//#import "ConfigData.h"
//#import "TConstants.h"
//#import "UIScrollViewEx.h"
//#import "PTImageCropVC.h"
#import "AFNetworking.h"
//#import "MHDatePicker.h"
#import "Masonry.h"
//#import "CXNetworkingManager.h"
//无网加载
//#import "ShowInNotNetView.h"
//是否实名认证
//#import "AuthController.h"

//进度
//#import "NJKWebViewProgressView.h"
//#import "NJKWebViewProgress.h"

//#import "QDPayPlugin.h"
typedef void(^CMDBlock)(id item);

//单元格
#import "BannerCell.h"
#import "CommonCell.h"
#import "CategoryCell.h"
#import "LiveModuleCell.h"

//models 类
#import "DataModels.h"

#define gap1 1
#define gap5 5
#define gap10 10
#endif /* Header_h */


