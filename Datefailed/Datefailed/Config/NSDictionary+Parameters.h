//
//  NSDictionary+Parameters.h
//  PZShoppingPro
//
//  Created by PZ_Chen on 16/4/18.
//  Copyright © 2016年 PZ_Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Parameters)

/**
 *  参数制作
 *
 *  @param dic 当前参数信息
 *
 *  @return 返回参数详情
 */
+(NSMutableDictionary *)parameters:(NSDictionary *)dic;


/**
 *  制作参数
 *
 *  @return 返回参数详情
 */
-(NSMutableDictionary *)parameters;

@end
