//
//  NSDictionary+SPSafe.h
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/10/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//

//If you think this open source library is of great help to you, please open the URL to click the Star,your approbation can encourage me, the author will publish the better open source library for guys again
//如果您认为本开源库对您很有帮助，请打开URL给作者点个赞，您的认可给作者极大的鼓励，作者还会发布更好的开源库给大家

//github address//https://github.com/lishiping/SPWebView
//github address//https://github.com/lishiping/SPDebugBar
//github address//https://github.com/lishiping/SPFastPush
//github address//https://github.com/lishiping/SPMacro
//github address//https://github.com/lishiping/SafeData
//github address//https://github.com/lishiping/SPCategory
//github address//https://github.com/lishiping/SPBaseClass

#import <Foundation/Foundation.h>

@interface NSDictionary (SPSafe)

//本类是字典安全方便的使用，方便直接转化为要使用的的对象等
/********safe get method***/

// get object
- (nullable id)safe_objectForKey:(id _Nonnull)key;

// get string or nil
- (nullable NSString *)safe_stringForKey:(id _Nonnull)key;

// get array or nil
- (nullable NSArray *)safe_arrayForKey:(id _Nonnull)key;

// get dictionary or nil
- (nullable NSDictionary *)safe_dictionaryForKey:(id _Nonnull)key;

// get number or nil
- (nullable NSNumber *)safe_numberForKey:(id _Nonnull)key;

// get data or nil
- (nullable NSData *)safe_dataForKey:(id _Nonnull)key;

//get NSInteger or nil
- (NSInteger)safe_integerForKey:(id _Nonnull)key;

//OC type transform C type
// transform NSNumber or NSString to int
- (int)safe_intForKey:(id _Nonnull)key;

// transform NSNumber or NSString to long
- (long)safe_longForKey:(id _Nonnull)key;

// transform NSNumber or NSString to long long
- (long long)safe_longLongForKey:(id _Nonnull)key;

// transform NSNumber or NSString to double
- (double)safe_doubleForKey:(id _Nonnull)key;

// transform NSNumber or NSString to float
- (float)safe_floatForKey:(id _Nonnull)key;

// transform NSNumber or NSString to BOOL
- (BOOL)safe_boolForKey:(id _Nonnull)key;


/**
 该方法快速取出嵌套字典内的字段
 例如：NSDictionary *dic =  @{@"one":@{@"two":@{@"three":@(3)}}};
 id ret = [dic safe_stringForKeyPath:@"one.two.three"];
 得到ret为@"3";
 @param keyPath 嵌套字段路径
 @return 返回数据
 */
- (NSString*_Nullable)safe_stringForKeyPath:(NSString *_Nonnull)keyPath;
    
/**
 该方法快速取出嵌套字典内的字段
 例如：NSDictionary *dic =  @{@"one":@{@"two":@{@"three":@(3)}}};
   id ret = [dic safe_objectForKeyPath:@"one.two.three"];
   得到ret为3;
 @param keyPath 嵌套字段路径
 @return 返回数据
 */
- (id _Nullable)safe_objectForKeyPath:(NSString *_Nonnull)keyPath;

    
//if anObject is nil ,mean remove value for aKey
//anObject为空则等于移除键值
- (nullable NSDictionary *)safe_dictionaryBySetObject:(nullable id)anObject forKey:(id _Nonnull)aKey;

//safe add Entries for NSDictionary
- (nullable NSDictionary *)safe_dictionaryAddEntriesFromDictionary:(nullable NSDictionary *)otherDictionary;

/****get JSON  Data method***/

- (nullable NSData *)toJSONData;

@end



#pragma mark - NSMutableDictionary + Safe

@interface NSMutableDictionary<KeyType, ObjectType> (SPSafe)

//safe set object
- (BOOL)safe_setObject:(nullable ObjectType)anObject forKey:(nullable KeyType)aKey;

// safe set string
- (BOOL)safe_setString:(nullable NSString *)anObject forKey:(nullable KeyType)aKey;

- (void)safe_addEntriesFromDictionary:(nullable NSDictionary *)otherDictionary;


@end
