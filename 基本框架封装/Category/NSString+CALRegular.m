//
//  NSString+CALRegular.m
//  基本框架封装
//
//  Created by lorin on 16/5/13.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import "NSString+CALRegular.h"

@implementation NSString (CALRegular)
#pragma mark - Test Numbers
// 1
- (BOOL)cal_isNumber {
    NSString *rules              = @"^[0-9]*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 2
- (BOOL)cal_checkMoreNumber:(NSInteger)quantity {
    NSString *rules              = [NSString stringWithFormat:@"^\\d{%ld}$", quantity];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 3
- (BOOL)cal_checkAtLeastNumber:(NSInteger)quantity {
    NSString *rules              = [NSString stringWithFormat:@"^\\d{%ld,}$", quantity];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 4
- (BOOL)cal_checkLimitsNumber:(NSInteger)fistNumber lastNumber:(NSInteger)lastNumber {
    NSString *rules              = [NSString stringWithFormat:@"^\\d{%ld,%ld}$", fistNumber, lastNumber];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 5
- (BOOL)cal_isNonZeroStartNumber {
    NSString *rules              = @"^(0|[1-9][0-9]*)$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 6
- (BOOL)cal_isNonZeroStartNumberHaveOneOrTwoDecimal {
    NSString *rules              = @"^([1-9][0-9]*)+(.[0-9]{1,2})?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHRS %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 7
- (BOOL)cal_isHaveOneOrTwoDecimalPositiveOrNegative {
    NSString *rules              = @"^(\\-)?\\d+(\\.\\d{1,2})?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 8
- (BOOL)cal_realContainDecimal {
    NSString *rules              = @"^(\\-|\\+)?\\d+(\\.\\d+)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 9
- (BOOL)cal_isPositiveRealHaveTwoDecimal {
    NSString *rules              = @"^[0-9]+(.[0-9]{2})?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 10
- (BOOL)cal_isHaveOneOrThreeDecimalPositiveOrNegative {
    NSString *rules              = @"^[0-9]+(.[0-9]{1,3})?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 11
- (BOOL)cal_isNonZeroPositiveInteger {
    NSString *rules              = @"^[1-9]\\d*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 12
- (BOOL)cal_isNonZeroNegativeInteger {
    NSString *rules              = @"^-[1-9]\\d*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 13
- (BOOL)cal_isNonNegativeInteger {
    NSString *rules              = @"^\\d+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 14
- (BOOL)cal_isNonPositiveInteger {
    NSString *rules              = @"^-[1-9]\\d*";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 15
- (BOOL)cal_isNonNegativeFloat {
    NSString *rules              = @"^\\d(\\.\\d+)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 16
- (BOOL)cal_isNonPositiveFloat {
    NSString *rules              = @"^((-\\d+(\\.\\d+)?)|(0+(\\.0+)?))$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 17
- (BOOL)cal_isPositiveFloat {
    NSString *rules              = @"^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 18
- (BOOL)cal_isNagativeFloat {
    NSString *rules              = @"^-([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*)$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 19
- (BOOL)cal_isFloat {
    NSString *rules              = @"^(-?\\d+)(\\.\\d+)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

#pragma mark - Test String
// 1
- (BOOL)cal_isChineseCharacter {
    NSString *rules              = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 2
- (BOOL)cal_isEnglishAndNumbers {
    NSString *rules              = @"^[A-Za-z0-9]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 3
- (BOOL)cal_limitinglength:(NSInteger)fistRange lastRange:(NSInteger)lastRange {
    NSString *rules              = [NSString stringWithFormat:@"^.{%ld,%ld}$", fistRange, lastRange];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 4
- (BOOL)cal_isLettersString {
    NSString *rules              = @"^[A-Za-z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 5
- (BOOL)cal_isCapitalLetters {
    NSString *rules              = @"^[A-Z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 6
- (BOOL)cal_isLowercaseLetters {
    NSString *rules              = @"^[a-z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 7
- (BOOL)cal_isNumbersAndLettersOrUnderlineString {
    NSString *rules              = @"^\\w+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 8
- (BOOL)cal_isChineseCharacterAndEnglishAndNumbersAndUnderlineString {
    NSString *rules              = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 9
- (BOOL)cal_isDoesNotContainUnderscoresChineseCharacterAndEnglishAndNumbersString {
    NSString *rules              = @"^[\u4E00-\u9FA5A-Za-z0-9]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 10
- (BOOL)cal_isContainSpecialCharacterString {
    NSString *rules              = @"[^%&',;=?$\x22]+";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 11
- (BOOL)cal_isContainCharacter:(NSString *)charater{
    NSString *rules              = [NSString stringWithFormat:@"[^%@\x22]+", charater];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

#pragma mark - Special Needs
// 1
- (BOOL)cal_checkEmailAddress {
    NSString *rules              = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 2
- (BOOL)cal_checkDomainName {
    NSString *rules              = @"[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 3
- (BOOL)cal_checkURL {
    NSString *rules              = @"^http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 4
- (BOOL)cal_checkPhoneNumber {
    NSString *rules              = @"^1+[34578]{1}+\\d{9}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 5
- (BOOL)cal_checkTelePhoneNumber {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString *MOBILE    = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString *CM        = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    NSString *CU        = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    NSString *CT        = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    NSString *PHS       = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs    = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:self]   ||
    [regextestphs evaluateWithObject:self]      ||
    [regextestct evaluateWithObject:self]       ||
    [regextestcu evaluateWithObject:self]       ||
    [regextestcm evaluateWithObject:self];
}

// 6
- (BOOL)cal_checkDomesticPhoneNumber {
    NSString *rules              = @"\\d{3}-\\d{8}|\\d{4}-\\d{7}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 7
- (BOOL)cal_checkIdentityCard {
    NSString *rules              = @"^\\d{15}|\\d{18}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 8
- (BOOL)cal_checkShortIdentityCard {
    NSString *rules              = @"^([0-9]){7,18}(x|X)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 9
- (BOOL)cal_checkAccount {
    NSString *rules              = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 10
- (BOOL)cal_checkPassword {
    NSString *rules              = @"^[a-zA-Z]\\w{5,17}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 11
- (BOOL)cal_checkStrongPassword:(NSInteger)briefest longest:(NSInteger)longest {
    NSString *rules              = [NSString stringWithFormat:@"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{%ld,%ld}$", briefest, longest];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 12
- (BOOL)cal_checkChinaDateFormat {
    NSString *rules              = @"^\\d{4}-\\d{1,2}-\\d{1,2}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 13
- (BOOL)cal_checkAbroadDateFormat {
    NSString *rules              = @"^\\d{1,2}-\\d{1,2}-\\d{4}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 14
- (BOOL)cal_checkMonth {
    NSString *rules              = @"^(0?[1-9]|1[0-2])$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 15
- (BOOL)cal_checkDay {
    NSString *rules              = @"^((0?[1-9])|((1|2)[0-9])|30|31)$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 25
- (BOOL)cal_checkXMLFile {
    NSString *rules              = @"^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 26
- (BOOL)cal_checkChineseCharacter {
    NSString *rules              = @"[\u4e00-\u9fa5]";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 27
- (BOOL)cal_checkDoubleByteCharacters {
    NSString *rules              = @"[^\\x00-\\xff]";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 28
- (BOOL)cal_checkBlankLines {
    NSString *rules              = @"\\n\\s*\\r";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 29
- (BOOL)cal_checkHTMLSign {
    NSString *rules              = @"<(\\S*?)[^>]*>.*?</\\1>|<.*? />";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
    
}

// 30
- (BOOL)cal_checkFirstAndLastSpaceCharacters {
    NSString *rules              = @"^\\s*|\\s*$或(^\\s*)|(\\s*$)";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 31
- (BOOL)cal_checkQQNumber {
    NSString *rules              = @"[1-9][0-9]{4,}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 32
- (BOOL)cal_checkPostalCode {
    NSString *rules              = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 33
- (BOOL)cal_checkIPv4InternetProtocol {
    NSString *rules              = @"((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

/*
 NSString *rules              = @"";
 NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
 
 return [stringPredicate evaluateWithObject:self];
 
 NSString *string = self;
 
 string = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
 string = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
 string = [self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
 
 return string;
 */
@end

/*
 一、校验数字的表达式
 1 数字：^[0-9]*$
 2 n位的数字：^\d{n}$
 3 至少n位的数字：^\d{n,}$
 4 m-n位的数字：^\d{m,n}$
 5 零和非零开头的数字：^(0|[1-9][0-9]*)$
 6 非零开头的最多带两位小数的数字：^([1-9][0-9]*)+(.[0-9]{1,2})?$
 7 带1-2位小数的正数或负数：^(\-)?\d+(\.\d{1,2})?$
 8 正数、负数、和小数：^(\-|\+)?\d+(\.\d+)?$
 9 有两位小数的正实数：^[0-9]+(.[0-9]{2})?$
 10 有1~3位小数的正实数：^[0-9]+(.[0-9]{1,3})?$
 11 非零的正整数：^[1-9]\d*$ 或 ^([1-9][0-9]*){1,3}$ 或 ^\+?[1-9][0-9]*$
 12 非零的负整数：^\-[1-9][]0-9"*$ 或 ^-[1-9]\d*$
 13 非负整数：^\d+$ 或 ^[1-9]\d*|0$
 14 非正整数：^-[1-9]\d*|0$ 或 ^((-\d+)|(0+))$
 15 非负浮点数：^\d+(\.\d+)?$ 或 ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$
 16 非正浮点数：^((-\d+(\.\d+)?)|(0+(\.0+)?))$ 或 ^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+|0$
 17 正浮点数：^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$ 或 ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$
 18 负浮点数：^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$ 或 ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$
 19 浮点数：^(-?\d+)(\.\d+)?$ 或 ^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$
 
 二、校验字符的表达式
 1 汉字：^[\u4e00-\u9fa5]{0,}$
 2 英文和数字：^[A-Za-z0-9]+$ 或 ^[A-Za-z0-9]{4,40}$
 3 长度为3-20的所有字符：^.{3,20}$
 4 由26个英文字母组成的字符串：^[A-Za-z]+$
 5 由26个大写英文字母组成的字符串：^[A-Z]+$
 6 由26个小写英文字母组成的字符串：^[a-z]+$
 7 由数字和26个英文字母组成的字符串：^[A-Za-z0-9]+$
 8 由数字、26个英文字母或者下划线组成的字符串：^\w+$ 或 ^\w{3,20}$
 9 中文、英文、数字包括下划线：^[\u4E00-\u9FA5A-Za-z0-9_]+$
 10 中文、英文、数字但不包括下划线等符号：^[\u4E00-\u9FA5A-Za-z0-9]+$ 或 ^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$
 11 可以输入含有^%&',;=?$\"等字符：[^%&',;=?$\x22]+
 12 禁止输入含有~的字符：[^~\x22]+
 
 
 三、特殊需求表达式
 1 Email地址：^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
 2 域名：[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?
 3 InternetURL：[a-zA-z]+://[^\s]* 或 ^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$ 或 ^http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?
 4 手机号码：^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$
 5 电话号码("XXX-XXXXXXX"、"XXXX-XXXXXXXX"、"XXX-XXXXXXX"、"XXX-XXXXXXXX"、"XXXXXXX"和"XXXXXXXX)：^(\(\d{3,4}-)|\d{3.4}-)?\d{7,8}$
 6 国内电话号码(0511-4405222、021-87888822)：\d{3}-\d{8}|\d{4}-\d{7}
 7 身份证号(15位、18位数字)：^\d{15}|\d{18}$
 8 短身份证号码(数字、字母x结尾)：^([0-9]){7,18}(x|X)?$ 或 ^\d{8,18}|[0-9x]{8,18}|[0-9X]{8,18}?$
 9 帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
 10 密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：^[a-zA-Z]\w{5,17}$
 11 强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$
 12 日期格式：^\d{4}-\d{1,2}-\d{1,2} 国外日期格式：^\d{1,2}-\d{1,2}-\d{4}
 13 一年的12个月(01～09和1～12)：^(0?[1-9]|1[0-2])$
 14 一个月的31天(01～09和1～31)：^((0?[1-9])|((1|2)[0-9])|30|31)$
 15 钱的输入格式：
 16    1.有四种钱的表示形式我们可以接受:"10000.00" 和 "10,000.00", 和没有 "分" 的 "10000" 和 "10,000"：^[1-9][0-9]*$
 17    2.这表示任意一个不以0开头的数字,但是,这也意味着一个字符"0"不通过,所以我们采用下面的形式：^(0|[1-9][0-9]*)$
 18    3.一个0或者一个不以0开头的数字.我们还可以允许开头有一个负号：^(0|-?[1-9][0-9]*)$
 19    4.这表示一个0或者一个可能为负的开头不为0的数字.让用户以0开头好了.把负号的也去掉,因为钱总不能是负的吧.下面我们要加的是说明可能的小数部分：^[0-9]+(.[0-9]+)?$
 20    5.必须说明的是,小数点后面至少应该有1位数,所以"10."是不通过的,但是 "10" 和 "10.2" 是通过的：^[0-9]+(.[0-9]{2})?$
 21    6.这样我们规定小数点后面必须有两位,如果你认为太苛刻了,可以这样：^[0-9]+(.[0-9]{1,2})?$
 22    7.这样就允许用户只写一位小数.下面我们该考虑数字中的逗号了,我们可以这样：^[0-9]{1,3}(,[0-9]{3})*(.[0-9]{1,2})?$
 23    8.1到3个数字,后面跟着任意个 逗号+3个数字,逗号成为可选,而不是必须：^([0-9]+|[0-9]{1,3}(,[0-9]{3})*)(.[0-9]{1,2})?$
 24    备注：这就是最终结果了,别忘了"+"可以用"*"替代如果你觉得空字符串也可以接受的话(奇怪,为什么?)最后,别忘了在用函数时去掉去掉那个反斜杠,一般的错误都在这里
 25 xml文件：^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$
 26 中文字符的正则表达式：[\u4e00-\u9fa5]
 27 双字节字符：[^\x00-\xff]    (包括汉字在内，可以用来计算字符串的长度(一个双字节字符长度计2，ASCII字符计1))
 28 空白行的正则表达式：\n\s*\r    (可以用来删除空白行)
 29 HTML标记的正则表达式：<(\S*?)[^>]*>.*?</\1>|<.*? />    (网上流传的版本太糟糕，上面这个也仅仅能部分，对于复杂的嵌套标记依旧无能为力)
 30 首尾空白字符的正则表达式：^\s*|\s*$或(^\s*)|(\s*$)    (可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式)
 31 腾讯QQ号：[1-9][0-9]{4,}    (腾讯QQ号从10000开始)
 32 中国邮政编码：[1-9]\d{5}(?!\d)    (中国邮政编码为6位数字)
 33 IP地址：\d+\.\d+\.\d+\.\d+    (提取IP地址时有用)
 34 IP地址：((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))    (由@飞龙三少 提供,感谢共享
 */

