//
//  JsonData.m
//  基本框架封装
//
//  Created by lorin on 16/5/17.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import "JsonData.h"

@implementation JsonData
+(NSString *)dataDictionaryToJson:(NSMutableDictionary *)dict{
    if (dict==nil) {
        return nil;
    }
    NSError *error=nil;
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"转换json数据失败:%@",error);
        return nil;
    }
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}
+(NSDictionary *)dataJsonDictionary:(NSString *)jsonData{
    if (jsonData==nil) {
        return nil;
    }
    NSData *tempJson=[jsonData dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:tempJson options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"json解析失败:%@",error);
    }
    return dict;
}
+(NSString *)dataArrayToJson:(NSArray *)array{
    if (array==nil) {
        return nil;
    }
    NSError *error=nil;
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"转换json数据失败:%@",error);
        return nil;
    }
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}
@end
