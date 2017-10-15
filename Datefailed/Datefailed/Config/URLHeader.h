//
//  URLHeader.h
//  TQEnglish
//
//  Created by zhiyou on 15/3/30.
//  Copyright (c) 2015年 zhiyou_zhaoxing. All rights reserved.
//

#ifndef TQEnglish_URLHeader_h
#define TQEnglish_URLHeader_h

/**
 *  银行卡号正则
 *
 *  @param str 手机号
 *
 *  @return 是否通过正则
 */
#define MATCH_BANKCARD(str) [[NSPredicate predicateWithFormat:@"^\\d{19}$"] evaluateWithObject:str]

/**
 *  手机号正则
 *
 *  @param str 手机号
 *
 *  @return 是否通过正则
 */
#define MATCH_PHONE(str) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"] evaluateWithObject:str]

/**
 *  邮箱正则
 *
 *  @param str 邮箱
 *
 *  @return 是否通过正则
 */
#define MATCH_EMAIL(str) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])\?\\.)+[\\w](?:[\\w-]*[\\w])?"] evaluateWithObject:str]

/**
 *  密码正则
 *
 *  @param str 密码
 *
 *  @return 是否通过正则
 */
#define MATCH_PASSWORLD(str) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"(?!^\\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{6,12}"] evaluateWithObject:str]

/**
 *  传真正则
 *
 *  @param str 传真
 *
 *  @return 是否通过正则
 */
#define MATCH_FAX(str) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"/^((\\+?[0-9]{2,4}\\-[0-9]{3,4}\\-)|([0-9]{3,4}\\-))?([0-9]{7,8})(\\-[0-9]+)?$/"] evaluateWithObject:str]


/**
 *  网址正则
 *
 *  @param str 网址
 *
 *  @return 是否通过正则
 */
#define MATCH_WEBSITE(str) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\w{4}\\:\\/\\/\\w+\\.\\w*\\.\\w{3，}\\/"] evaluateWithObject:str]

/**
 *  身份证正则
 *
 *  @param str 身份证号
 *
 *  @return 是否通过正则
 */
#define MATCH_IDCARD(str) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^(\\d{14}|\\d{17})(\\d|[xX])$"] evaluateWithObject:str]


#define ActionSheet_Show(SheetTitle,orther1,orther2,SheetTag) \
UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:SheetTitle delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:orther1, orther2, nil]; \
actionSheet.actionSheetStyle = UIActionSheetStyleDefault; \
actionSheet.tag = SheetTag; \
[actionSheet showInView:self.view]; \


#define SHOW_ALERT(_title_,_message_,_cancel_,_btn_,AlertTag) UIAlertView * alert = [[UIAlertView alloc]initWithTitle:_title_ message:_message_ delegate:nil cancelButtonTitle:_cancel_ otherButtonTitles:_btn_, nil];\
alert.delegate = self;\
alert.tag = AlertTag;\
[alert show];\


//定义一些宏
#define isNSNull(str) [str isEqual:[NSNull null]]
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)

//#define TIM_APPID @"1400012678"
#define TIM_APPID @"1400017282"

#define TIM_TYPE @"6596"
#define kStr_NotifactionShopClass @"kStr_NotifactionShopClass"
#define kStr_NotifactionGoodsLevel @"kStr_NotifactionGoodsLevel"
#define kStr_NotificationGoodsEmsContain @"kStr_NotificationGoodsEmsContain"//海参 新增是否含运费
#define MAX_LENTH 999999999   ///(紫草)此处做了修改 - 价格 以及库存的字段长度的限制
#define ORDER_IMAGE_TAG 70
#define ORDER_LABEL_TAG 80
#define ORDER_BTN_TAG 90
#define LUNBO_TAG 100
#define PageSize 10
#define NavBarHeight 44
#define TabBarHeight 49
#define StatusBarHeight 20
#define WindowHeight [[UIScreen mainScreen] bounds].size.height
#define WindowWidth  [[UIScreen mainScreen] bounds].size.width
#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0

#define kStrShouldNotification @"ASIHTTP_TAG_CarType"

#define SIGN_KEY @"@fruitShop@key"
#define TEXT_DARK_COLOR @"323232"
#define TEXT_LIGHT_COLOR @"808080"
#define TEXT_BESTLIGHT_COLOR @"C2C2C2"
#define BLACKGROUND_COLOR @"EFEFEF"
#define BLUE_COLOR @"0b95ff"
#define RED_COLOR @"FF5A60"

#define TABLECELL_LINE_COLOR @"D3CCCA"
#define ORANGE_COLOR @"FF5722"
#define YELLOW_COLOR @"ffb300"
#define LIGHTGARY_COLOR @"999999"
#define TEXTPH_COLOR @"CCCCCC"

#define NAV_COLOR @"FEE85A"

#define TEXT_AMOUNT_RED_COLOR [UIColor colorWithRed:253/255.0 green:79/255.0 blue:87/255.0 alpha:1];


#import "_header.h"

#define PicHeader       S_HOST
#define HttpHeader      [S_HOST substringToIndex:[S_HOST rangeOfString:@"cloudSeason"].location]
//银行卡 查询 https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=6216608000000431447&cardBinCheck=true

//#define PicHeader @"http://116.255.244.116:8080/cloudSeason"
//#define HttpHeader @"http://116.255.244.116:8080/"
//#define PicHeader @"http://114.55.32.65:8080/cloudSeason"
//#define HttpHeader @"http://114.55.32.65:8080/"
//#define PicHeader @"http://192.168.1.138:8080/cloudSeason"
//#define HttpHeader @"http://192.168.1.138:8080/"

//进入店铺
//http://192.168.1.96:8080/cloudSeason/rest/shop/enterStore.shtml
#define EnterStore_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/shop/enterStore.shtml",HttpHeader]
#define ASIHTTP_TAG_EnterStore           @"ASIHTTP_TAG_EnterStore"
//搜索商品
//http://192.168.1.96:8080/cloudSeason/rest/goods/searchGoods.shtml
#define SearchGoods_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/goods/searchGoods.shtml",HttpHeader]
#define ASIHTTP_TAG_SearchGoods           @"ASIHTTP_TAG_SearchGoods"

//新增商品
//http://192.168.1.96:8080/cloudSeason/rest/goods/addGoods.shtml
#define AddGoods_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/goods/addGoods.shtml",HttpHeader]
#define ASIHTTP_TAG_AddGoods           @"ASIHTTP_TAG_AddGoods"

//上下架商品总数
//http://192.168.1.96:8080/cloudSeason/rest/goods/findGoodsCountByState.shtml
#define GoodsCount_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/goods/findGoodsCountByState.shtml",HttpHeader]
#define ASIHTTP_TAG_GoodsCount           @"ASIHTTP_TAG_GoodsCount"
#define ASIHTTP_TAG_RefeshGoods          @"ASIHTTP_TAG_RefeshGoods"

//查询上下架商品列表
//http://192.168.1.96:8080/cloudSeason/rest/goods/goodsListByState.shtml
#define GoodsList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/goods/goodsListByState.shtml",HttpHeader]
#define ASIHTTP_TAG_GoodsList           @"ASIHTTP_TAG_GoodsList"

//商品详情
//http://192.168.1.96:8080/cloudSeason/rest/goods/findGoodsByid.shtml
#define GoodsDetails_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/goods/findGoodsByid.shtml",HttpHeader]
#define ASIHTTP_TAG_GoodsDetails           @"ASIHTTP_TAG_GoodsDetails"

//刷新商品
//http://192.168.1.96:8080/cloudSeason/rest/goods/updateGoods.shtml
#define GoodsUpdata_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/goods/updateGoods.shtml",HttpHeader]
#define ASIHTTP_TAG_GoodsUpdata           @"ASIHTTP_TAG_GoodsUpdata"

//商品下架上架
//http://192.168.1.96:8080/cloudSeason/rest/goods/updateGoodsState.shtml
#define GoodsChangeState_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/goods/updateGoodsState.shtml",HttpHeader]
#define ASIHTTP_TAG_GoodsChangeState           @"ASIHTTP_TAG_GoodsChangeState"

//删除商品
//http://192.168.1.96:8080/cloudSeason/rest/goods/deleteGoodsByid.shtml
#define GoodsDelete_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/goods/deleteGoodsByid.shtml",HttpHeader]
#define ASIHTTP_TAG_GoodsDelete           @"ASIHTTP_TAG_GoodsDelete"
//实名认证
//http://192.168.1.96:8080/cloudSeason/rest/shop/updateShopAttestationInfo.shtml
#define ShopAuth_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/shop/updateShopAttestationInfo.shtml",HttpHeader]
#define ASIHTTP_TAG_ShopAuth          @"ASIHTTP_TAG_ShopAuth"
//店铺认证信息
//http://192.168.1.96:8080/cloudSeason/rest/shop/storeAuthInfo.shtml
#define ShopAuthInfo_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/shop/storeAuthInfo.shtml",HttpHeader]
#define ASIHTTP_TAG_ShopAuthInfo          @"ASIHTTP_TAG_ShopAuthInfo"
//更改店铺Logo
//http://192.168.1.96:8080/cloudSeason/rest/shop/uploadStoreLogo.shtml
#define ShopLogo_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/shop/uploadStoreLogo.shtml",HttpHeader]
#define ASIHTTP_TAG_ShopLogo          @"ASIHTTP_TAG_ShopLogo"

//发布货源
//http://192.168.1.96:8080/cloudSeason/rest/res/addSupplyGoods.shtml
#define PubGoods_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/addSupplyGoods.shtml",HttpHeader]
#define ASIHTTP_TAG_PubGoods          @"ASIHTTP_TAG_PubGoods"
//我发布的货源列表
//http://192.168.1.96:8080/cloudSeason/rest/res/mySupplyGoods.shtml
#define PubGoodsList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/mySupplyGoods.shtml",HttpHeader]
#define ASIHTTP_TAG_PubGoodsList         @"ASIHTTP_TAG_PubGoodsList"
//货源详情
//http://192.168.1.96:8080/cloudSeason/rest/res/supplyInfo.shtml
#define PubInfo_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/supplyInfo.shtml",HttpHeader]
#define ASIHTTP_TAG_PubInfo         @"ASIHTTP_TAG_PubInfo"
//回复询价
//http://192.168.1.96:8080/cloudSeason/rest/res/replyEnquiry.shtml
#define ReplayEnquiry_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/replyEnquiry.shtml",HttpHeader]
#define ASIHTTP_TAG_ReplayEnquiry         @"ASIHTTP_TAG_ReplayEnquiry"
//忽略询价
//http://192.168.1.96:8080/cloudSeason/rest/res/ignoreEnquiry.shtml
#define IgnoreEnquiry_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/ignoreEnquiry.shtml",HttpHeader]
#define ASIHTTP_TAG_IgnoreEnquiry         @"ASIHTTP_TAG_IgnoreEnquiry"
//刷新货源
//http://192.168.1.96:8080/cloudSeason/rest/res/refreshSupplyGoods.shtml
#define RefreshGoods_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/refreshSupplyGoods.shtml",HttpHeader]
#define ASIHTTP_TAG_RefreshGoods         @"ASIHTTP_TAG_RefreshGoods"
//编辑货源库存
//http://192.168.1.96:8080/cloudSeason/rest/res/editSupplyGoods.shtml
#define EditGoods_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/editSupplyGoods.shtml",HttpHeader]
#define ASIHTTP_TAG_EditGoods         @"ASIHTTP_TAG_EditGoods"
//暂停供货
#define ASIHTTP_TAG_StopGoods         @"ASIHTTP_TAG_StopGoods"

//我的询价单详情
//http://192.168.1.96:8080/cloudSeason/rest/res/enquiryInfo.shtml
#define EnquiryInfo_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/enquiryInfo.shtml",HttpHeader]
#define ASIHTTP_TAG_EnquiryInfo         @"ASIHTTP_TAG_EnquiryInfo"
//采购大厅
//http://192.168.1.96:8080/cloudSeason/rest/res/needList.shtml
#define NeedList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/needList.shtml",HttpHeader]
#define ASIHTTP_TAG_NeedList         @"ASIHTTP_TAG_NeedList"
//采购详情
//http://192.168.1.96:8080/cloudSeason/rest/res/need.shtml
#define NeedDetails_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/need.shtml",HttpHeader]
#define ASIHTTP_TAG_NeedDetails         @"ASIHTTP_TAG_NeedDetails"
//添加报价
//http://192.168.1.96:8080/cloudSeason/rest/res/needQuote.shtml
#define AddOffer_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/needQuote.shtml",HttpHeader]
#define ASIHTTP_TAG_AddOffer         @"ASIHTTP_TAG_AddOffer"
//我的报价列表
//http://192.168.1.96:8080/cloudSeason/rest/res/myNeedQuoteList.shtml
#define OfferList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/myNeedQuoteList.shtml",HttpHeader]
#define ASIHTTP_TAG_OfferList         @"ASIHTTP_TAG_OfferList"
//我的报价详情
//http://192.168.1.96:8080/cloudSeason/rest/res/needQuoteInfo.shtml
#define OfferInfo_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/res/needQuoteInfo.shtml",HttpHeader]
#define ASIHTTP_TAG_OfferInfo         @"ASIHTTP_TAG_OfferInfo"

//修改登录密码
//http://192.168.1.96:8080/cloudSeason/rest/appuser/resetPWD.shtml
#define ResetPsd_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/resetPWD.shtml",HttpHeader]
#define ASIHTTP_TAG_ResetPsd         @"ASIHTTP_TAG_ResetPsd"
//设置支付密码
//http://192.168.1.96:8080/cloudSeason/rest/appuser/setPayPwd.shtml
#define SetPayPsd_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/setPayPwd.shtml",HttpHeader]
#define ASIHTTP_TAG_SetPayPsd         @"ASIHTTP_TAG_SetPayPsd"
//修改支付密码
//http://192.168.1.96:8080/cloudSeason/rest/appuser/resetPayPwd.shtml
#define ResetPayPsd_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/resetPayPwd.shtml",HttpHeader]
#define ASIHTTP_TAG_ResetPayPsd         @"ASIHTTP_TAG_ResetPayPsd"
//获取验证码
//http://192.168.1.96:8080/cloudSeason/rest/appuser/getCode.shtml
#define GetCode_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/getCode.shtml",HttpHeader]
#define ASIHTTP_TAG_GetCode         @"ASIHTTP_TAG_GetCode"
#define ASIHTTP_TAG_GetNewCode         @"ASIHTTP_TAG_GetNewCode"
//校验验证码
//http://192.168.1.96:8080/cloudSeason/rest/appuser/checkCode.shtml
#define CheckCode_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/checkCode.shtml",HttpHeader]
#define ASIHTTP_TAG_CheckCode         @"ASIHTTP_TAG_CheckCode"
#define ASIHTTP_TAG_CheckNewCode         @"ASIHTTP_TAG_CheckNewCode"
//改绑手机号
//http://192.168.1.96:8080/cloudSeason/rest/appuser/resetPhone.shtml
#define ResetPhone_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/resetPhone.shtml",HttpHeader]
#define ASIHTTP_TAG_ResetPhone         @"ASIHTTP_TAG_ResetPhone"

//校验支付密码
//http://192.168.1.96:8080/cloudSeason/rest/appuser/chkPayPwd.shtml
#define CheckPayPsd_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/chkPayPwd.shtml",HttpHeader]
#define ASIHTTP_TAG_CheckPayPsd         @"ASIHTTP_TAG_CheckPayPsd"
//我的账户余额
//http://192.168.1.96:8080/cloudSeason/rest/appuser/myPredeposit.shtml
#define GetMyMoney_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/myPredeposit.shtml",HttpHeader]
#define ASIHTTP_TAG_GetMyMoney         @"ASIHTTP_TAG_GetMyMoney"
//我的账户余额新接口
//http://192.168.1.96:8080/cloudSeason/rest/appuser/myPredepositNew.shtml
#define GetMyMoneyNew_URL [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/myPredepositNew.shtml",HttpHeader]
#define ASIHTTP_TAG_GetNewMyMoney         @"ASIHTTP_TAG_GetNewMyMoney"

//卖家版我的账户上的提示文字  //cloudSeason/rest/setting/postponeConfirmOrderText.shtml
#define GetSwaringStr_URL [NSString stringWithFormat:@"%@cloudSeason/setting/postponeConfirmOrderText.shtml",HttpHeader]
#define ASIHTTP_TAG_GetWaring   @"ASIHTTP_TAG_GetWaring"

//我的银行卡列表
//http://192.168.1.96:8080/cloudSeason/rest/appuser/bankList.shtml
#define BankList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/bankList.shtml",HttpHeader]
#define ASIHTTP_TAG_BankList         @"ASIHTTP_TAG_BankList"

//银行卡查询
//http://api.avatardata.cn/Bank/Query
//#define BankQuery_URL   @"http://api.avatardata.cn/Bank/Query"//海参根据https
#define BankQuery_URL    [NSString stringWithFormat:@"%@cloudSeason/rest/thirdparty/BankQuery.shtml",HttpHeader]
#define ASIHTTP_TAG_BankQuery         @"ASIHTTP_TAG_BankQuery"

//银行卡预留手机号校验
//http://api.avatardata.cn/IdCardBankMobileCertificate/Verify
//#define BankVerify_URL  @"http://api.avatardata.cn/IdCardBankMobileCertificate/Verify"//海参改为从后台请求https格式
#define BankVerify_URL  [NSString stringWithFormat:@"%@cloudSeason/rest/thirdparty/IdCardBankMobileCertificate.shtml",HttpHeader]
#define ASIHTTP_TAG_BankVerify         @"ASIHTTP_TAG_BankVerify"

//查询银行卡的开户行
#define BankArea_URL [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/bankBranchList.shtml",HttpHeader]
#define ASIHTTP_TAG_BankArea          @"ASIHTTP_TAG_BankArea"
//添加银行卡
//http://192.168.1.96:8080/cloudSeason/rest/appuser/addBank.shtml
#define AddBank_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/addBank.shtml",HttpHeader]
#define ASIHTTP_TAG_AddBank         @"ASIHTTP_TAG_AddBank"

//解绑银行卡
//http://192.168.1.96:8080/cloudSeason/rest/appuser/delBank.shtml
#define DelBank_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/delBank.shtml",HttpHeader]
#define ASIHTTP_TAG_DelBank         @"ASIHTTP_TAG_DelBank"

//微信支付宝绑定
//http://192.168.1.96:8080/cloudSeason/rest/appuser/payBinding.shtml
#define PayBinding_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/payBinding.shtml",HttpHeader]
#define ASIHTTP_TAG_PayBinding         @"ASIHTTP_TAG_PayBinding"

//微信支付宝解除绑定
//http://192.168.1.96:8080/cloudSeason/rest/appuser/payUnBinding.shtml
#define PayUnBinding_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/payUnBinding.shtml",HttpHeader]
#define ASIHTTP_TAG_PayUnBinding         @"ASIHTTP_TAG_PayUnBinding"

//我的银行卡-提现
//http://192.168.1.96:8080/cloudSeason/rest/appuser/banks.shtml
#define MyBanks_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/banks.shtml",HttpHeader]
#define ASIHTTP_TAG_MyBanks         @"ASIHTTP_TAG_MyBanks"

//提现申请
//http://192.168.1.96:8080/cloudSeason/rest/appuser/applyCash.shtml
#define Apply_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/applyCash.shtml",HttpHeader]
#define ASIHTTP_TAG_Apply         @"ASIHTTP_TAG_Apply"

//我的返佣
//http://192.168.1.96:8080/cloudSeason/rest/appuser/myFyList.shtml
#define MyFyList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/myFyList.shtml",HttpHeader]
#define ASIHTTP_TAG_MyFyList         @"ASIHTTP_TAG_MyFyList"

//我的账单
//http://192.168.1.96:8080/cloudSeason/rest/appuser/myBillList.shtml
#define MyBillList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/myBillList.shtml",HttpHeader]
#define ASIHTTP_TAG_MyBillList         @"ASIHTTP_TAG_MyBillList"
//我的各个订单数量
//http://192.168.1.96:8080/cloudSeason/rest/order/stateCountList.shtml
#define OrderListCount_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/order/stateCountList.shtml",HttpHeader]
#define ASIHTTP_TAG_OrderListCount         @"ASIHTTP_TAG_OrderListCount"
//我的订单列表
//http://192.168.1.96:8080/cloudSeason/rest/order/sellerSearchOrder.shtml
#define OrderList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/order/sellerSearchOrder.shtml",HttpHeader]
#define ASIHTTP_TAG_OrderList        @"ASIHTTP_TAG_OrderList"
//订单详情
//http://192.168.1.96:8080/cloudSeason/rest/order/findOrderInfoByid.shtml
#define OrderDetails_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/order/findOrderInfoByid.shtml",HttpHeader]
#define ASIHTTP_TAG_OrderDetails        @"ASIHTTP_TAG_OrderDetails"
//删除已取消订单
//http://192.168.1.96:8080/cloudSeason/rest/order/deleteOrderGoods.shtml
#define OrderDel_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/order/deleteOrderGoods.shtml",HttpHeader]
#define ASIHTTP_TAG_OrderDel        @"ASIHTTP_TAG_OrderDel"
//信E付 中的 收款人的订单
#define libQd_URL  [NSString stringWithFormat:@"%@cloudSeason/pay/prePay.shtml",HttpHeader]
#define ASIHTTP_TAG_libQd        @"ASIHTTP_TAG_libQd"


//立即发货
//http://192.168.1.96:8080/cloudSeason/rest/order/addShippingInfo.shtml
#define SendGoods_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/order/addShippingInfo.shtml",HttpHeader]
#define ASIHTTP_TAG_SendGoods        @"ASIHTTP_TAG_SendGoods"
//获取目前合作的物流公司的名字 •	/web/Logistic/getLogisticNames.shtml
#define SendGoodsWuLiuMinZi_URL [NSString stringWithFormat:@"%@cloudSeason/web/Logistic/getLogisticNames.shtml",HttpHeader]
#define ASIHTTP_TAG_SendGoodsWuLiuMinZi @"ASIHTTP_TAG_SendGoodsWuLiuMinZi"


//修改订单价格
//http://192.168.1.96:8080/cloudSeason/rest/order/updateOrderPrice.shtml
#define ChangePrice_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/order/updateOrderPrice.shtml",HttpHeader]
#define ASIHTTP_TAG_ChangePrice        @"ASIHTTP_TAG_ChangePrice"
//销售额
//http://192.168.1.96:8080/cloudSeason/rest/shop/sales.shtml
#define Sales_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/shop/sales.shtml",HttpHeader]
#define ASIHTTP_TAG_Sales        @"ASIHTTP_TAG_Sales"
//订单量
//http://192.168.1.96:8080/cloudSeason/rest/shop/orders.shtml
#define Orders_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/shop/orders.shtml",HttpHeader]
#define ASIHTTP_TAG_Orders        @"ASIHTTP_TAG_Orders"
//销售额
//http://192.168.1.96:8080/cloudSeason/rest/shop/favStatistics.shtml
#define FavStatistics_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/shop/favStatistics.shtml",HttpHeader]
#define ASIHTTP_TAG_FavStatistics        @"ASIHTTP_TAG_FavStatistics"
//浏览量
//http://192.168.1.96:8080/cloudSeason/rest/shop/viewStatistics.shtml
#define ViewStatistics_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/shop/viewStatistics.shtml",HttpHeader]
#define ASIHTTP_TAG_ViewStatistics        @"ASIHTTP_TAG_ViewStatistics"

//消息列表
//http://192.168.1.96:8080/cloudSeason/rest/appuser/msgList.shtml
#define MsgList_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/msgList.shtml",HttpHeader]
#define ASIHTTP_TAG_MsgList           @"ASIHTTP_TAG_MsgList"
//消息详情
//http://192.168.1.96:8080/cloudSeason/rest/appuser/readMsg.shtml
#define MsgDetails_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/readMsg.shtml",HttpHeader]
#define ASIHTTP_TAG_MsgDetails           @"ASIHTTP_TAG_MsgDetails"
//消息删除
//http://192.168.1.96:8080/cloudSeason/rest/appuser/delMessage.shtml
#define MsgDel_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/delMessage.shtml",HttpHeader]
#define ASIHTTP_TAG_MsgDel           @"ASIHTTP_TAG_MsgDetails"
//审核
//http://192.168.1.96:8080/cloudSeason/setting/checkForIos.shtml
#define Check_URL   [NSString stringWithFormat:@"%@cloudSeason/setting/checkForIos.shtml",HttpHeader]
#define ASIHTTP_TAG_Check           @"ASIHTTP_TAG_Check"
//贷款提交个人基本信息
//http://192.168.1.96:8080/cloudSeason/finan/updateFinanInfoOne.shtml  •	rest/finan/updateFinanBasic.shtml
#define LoanBaseData_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/finan/updateFinanBasic.shtml",HttpHeader]
#define ASIHTTP_TAG_Loan           @"ASIHTTP_TAG_Loan"
//获得自己的基本数据
//rest/finan/beforeAuthInfo.shtml
#define GetLoanBaseData_URL [NSString stringWithFormat:@"%@cloudSeason/rest/finan/beforeAuthInfo.shtml",HttpHeader]
#define ASIHTTP_TAG_GetLoan                 @"ASIHTTP_TAG_GetLoan"
//判断金融贷款时的信息是否填写正确
//rest/finan/beforeUpdate.shtml
#define GetZhuangTai_URL [NSString stringWithFormat:@"%@cloudSeason/rest/finan/beforeUpdate.shtml",HttpHeader]
#define ASIHTTP_TAG_LoanZhuangTai           @"ASIHTTP_TAG_LoanZhuangTai"
//贷款前2页的信息 rest/finan/showFinanBasic.shtml
#define GetBeforeTwoPage_URL [NSString stringWithFormat:@"%@cloudSeason/rest/finan/showFinanBasic.shtml",HttpHeader]
#define ASIHTTP_TAG_GetBeforeTwoPage        @"ASIHTTP_TAG_GetBeforeTwoPage"

//判断是否结过婚   rest/finan/isMarryFromBasic.shtml
#define GetIsMarray_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/finan/isMarryFromBasic.shtml",HttpHeader]
#define ASIHTTP_TAG_GetIsMarray      @"ASIHTTP_TAG_GetIsMarray"

//首页热销和店铺的 Tag 西瓜请求数据
#define ASIHTTP_TAG_GetReXiaoData  @"ASIHTTP_TAG_GetReXiaoData"

//首页公告  http://114.55.116.245:8080/cloudSeason/rest/appuser/wzggAppList.shtml
#define GetAnnouncement_URL  [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/wzggAppList.shtml",HttpHeader]
#define ASIHTTP_TAG_Announcement    @"ASIHTTP_TAG_Announcement"




//拉入黑名单的 URL rest/appuser/userInBlack.shtml
#define GetHeiMingDan_URL [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/userInBlack.shtml",HttpHeader]
#define ASIHTTP_TAG_GetHeiMingDan  @"ASIHTTP_TAG_GetHeiMingDan"

//物流 /cloudSeason/web/Logistic/logisticsIndex.shtml
#define GetFinancialWare_URL [NSString stringWithFormat:@"%@cloudSeason/web/Logistic/logisticsIndex.shtml",HttpHeader]
#define ASIHTTP_TAG_GetFinancialWare  @"ASIHTTP_TAG_GetFinancialWare"


//图文详情  /cloudSeason/web/goods/goodsGraphicDetails.shtml?goodsId=2

// [NSString stringWithFormat:@"%@cloudSeason/web/Logistic/logisticsIndex.shtml",HttpHeader]



// 线下支付图片上传
#define MPayPictureLoad_URL [NSString stringWithFormat:@"%@cloudSeason/rest/order/uploadPayPic.shtml",HttpHeader]
#define ASIHTTP_TAG_MPayPictureLoad  @"ASIHTTP_TAG_MPayPictureLoad"


// 线下充值图片上传
#define MPayPictureLoad_Chong_URL [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/uploadPayPic.shtml",HttpHeader]
#define ASIHTTP_TAG_Chong_MPayPictureLoad  @"ASIHTTP_TAG_Chong_MPayPictureLoad"

//退出登录
//http://192.168.1.96:8080/cloudSeason/rest/appuser/exit.shtml
#define Exit_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/exit.shtml",HttpHeader]
#define ASIHTTP_TAG_Exit           @"ASIHTTP_TAG_Exit"

/**
 *  快递查询  --->>>没有使用
 *
 *  @param type   快递公司代号
 *  @param postid 快递单号
 *
 *  @return 快递查询Url
 */
#define REQUEST_IMG_Z_KUAIDI(type,postid) [NSString stringWithFormat:@"http://www.kuaidi100.com/query?type=%@&postid=%@",type,postid]
#define ASIHTTP_TAG_KUAIDI           @"ASIHTTP_TAG_KUAIDI"



//热门搜索
//http://122.114.117.168:8088/api/shop/gethotkeyword.aspx
#define HotKeyword_URL   [NSString stringWithFormat:@"%@/api/shop/gethotkeyword.aspx",HttpHeader]
#define ASIHTTP_TAG_HotKeyword           @"ASIHTTP_TAG_HotKeyword"

//首页轮播   ----->未使用
//http://122.114.117.168:8088/api/slider/getslider.aspx
#define Carousel_URL   @"http://app.topkea.com/api/slider/getslider.aspx"
#define ASIHTTP_TAG_Carousel           @"ASIHTTP_TAG_Carousel"


//海参新增  图片金融 图片资料上传
#define FinanceUploadPicture_URL   [NSString stringWithFormat:@"%@cloudSeason/rest/finan/updateFinanPic.shtml",HttpHeader]
#define ASIHTTP_TAG_FinanceUploadPicture        @"ASIHTTP_TAG_FinanceUploadPicture"

// 金融图片资料加载
#define FinancePictureLoad_URL [NSString stringWithFormat:@"%@cloudSeason/rest/finan/showFinanBasic.shtml",HttpHeader]
#define ASIHTTP_TAG_FinanceLoad  @"ASIHTTP_TAG_FinanceLoad"



// 线下支付图片上传
#define MPayPictureLoad_URL [NSString stringWithFormat:@"%@cloudSeason/rest/order/uploadPayPic.shtml",HttpHeader]
#define ASIHTTP_TAG_MPayPictureLoad  @"ASIHTTP_TAG_MPayPictureLoad"


// 线下充值图片上传
#define MPayPictureLoad_Chong_URL [NSString stringWithFormat:@"%@cloudSeason/rest/appuser/uploadPayPic.shtml",HttpHeader]
#define ASIHTTP_TAG_Chong_MPayPictureLoad  @"ASIHTTP_TAG_Chong_MPayPictureLoad"

#endif
