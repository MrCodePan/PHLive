//
//  NSDictionary+Parameters.m
//  PZShoppingPro
//
//  Created by PZ_Chen on 16/4/18.
//  Copyright © 2016年 PZ_Chen. All rights reserved.
//

#import "NSDictionary+Parameters.h"
;

#define Verson [(__bridge NSDictionary *)CFBundleGetInfoDictionary( CFBundleGetMainBundle() ) objectForKey:@"CFBundleShortVersionString"]
@implementation NSDictionary (Parameters)

/**
 *  参数制作
 *
 *  @param dic 当前参数信息
 *
 *  @return 返回参数详情
 */



+(NSMutableDictionary *)parameters:(NSDictionary *)dic{
    dic = dic.count <= 0?@{@"author_IOS":@"PZ_Chen"}:dic;
    NSString * str_Temp = [dic JSONString];
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    NSString *str_Time = [NSString stringWithFormat:@"%llu",recordTime];
    NSDictionary * dic_Temp = @{@"timestamp":str_Time,@"plat":@"ios",@"v":@"1.0",@"data":str_Temp};
    NSString * str_Sign = [ZXPublic md5:[dic_Temp JSONString]];
    NSMutableDictionary * dic_parameters = [[NSMutableDictionary alloc] initWithDictionary:dic_Temp];
    [dic_parameters setValue:str_Sign forKey:@"sign"];
    NSLog(@"\n<------PZNSDictionary 参数制造------>\n 当前请求的参数为------> \n %@ \n\n",dic_parameters);
    return dic_parameters;
}

/**
 *  制作参数
 *
 *  @return 返回参数详情
 */
-(NSMutableDictionary *)parameters{
//    NSLog(@">>>>>%@",self);
    NSDictionary * dic = self.count <= 0?@{}:self;
    NSString * str_Temp = [dic JSONString];
        NSLog(@">>>%@",str_Temp);
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    NSString *str_Time = [NSString stringWithFormat:@"%llu",recordTime];
    NSDictionary * dic_Temp = @{@"timestamp":str_Time,@"plat":@"ios",@"v":Verson,@"data":str_Temp};
    NSString * str_Md5Temp = [NSString stringWithFormat:@"hopingtimestamp%@platios%@data%@hoping",str_Time,Verson,str_Temp];
    NSString * str_Sign = [ZXPublic md5:str_Md5Temp];
    NSMutableDictionary * dic_parameters = [[NSMutableDictionary alloc] initWithDictionary:dic_Temp];
    [dic_parameters setValue:str_Sign forKey:@"sign"];
    NSLog(@"\n<------PZNSDictionary 参数制造------>\n 当前请求的参数为------> \n %@ \n\n",dic_parameters);
    return dic_parameters;
}


@end
