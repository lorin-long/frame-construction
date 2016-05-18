//
//  JsonData.h
//  基本框架封装
//
//  Created by lorin on 16/5/17.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonData : NSObject

/**
 *  字典转成json各式数据
 *
 *  @param dict 需要转换字典
 *
 *  @return 转换之后json
 */

+(NSString *)dataDictionaryToJson:(NSMutableDictionary *)dict;
/**
 *  json转换成字典
 *
 *  @param jsonData 待转换的json数据
 *
 *  @return 转换之后的dictionary
 */
+(NSDictionary *)dataJsonDictionary:(NSString *)jsonData;

/**
 *  数组转换成JSON
 *
 *  @param array 待转换的数组
 *
 *  @return json字符串
 */
+(NSString *)dataArrayToJson:(NSArray *)array;

@end
