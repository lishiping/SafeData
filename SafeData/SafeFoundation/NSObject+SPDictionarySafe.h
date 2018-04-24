//
//  NSObject+SPDictionarySafe.h
//  SafeData
//
//  Created by shiping li on 2018/4/19.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SPDictionarySafe)

//由于之前写了NSDictionary+SPSafe类别是为了使用字典的时候方便转化类型，并防止崩溃，但是实际运用当中发现了问题，并不能防止崩溃，因为如果实际对象不是字典，但是如果以字典类型修饰的变量可以使用字典的类别方法，在调用类别方法的时候会崩溃，所以为了保护崩溃问题，增加了以NSObject类型的判断

//本类是字典安全方便的使用，方便直接转化为要使用的的对象等
/********sp get method***/

// get object
- (nullable id)sp_dictionaryObjectForKey:(id _Nonnull)key;

// get string or nil
- (nullable NSString *)sp_dictionaryStringForKey:(id _Nonnull)key;

// get array or nil
- (nullable NSArray *)sp_dictionaryArrayForKey:(id _Nonnull)key;

// get dictionary or nil
- (nullable NSDictionary *)sp_dictionaryDictionaryForKey:(id _Nonnull)key;

// get number or nil
- (nullable NSNumber *)sp_dictionaryNumberForKey:(id _Nonnull)key;

// get data or nil
- (nullable NSData *)sp_dictionaryDataForKey:(id _Nonnull)key;

//get NSInteger or nil
- (NSInteger)sp_dictionaryIntegerForKey:(id _Nonnull)key;

//OC type transform C type
// transform NSNumber or NSString to int
- (int)sp_dictionaryIntForKey:(id _Nonnull)key;

// transform NSNumber or NSString to long
- (long)sp_dictionaryLongForKey:(id _Nonnull)key;

// transform NSNumber or NSString to long long
- (long long)sp_dictionaryLongLongForKey:(id _Nonnull)key;

// transform NSNumber or NSString to double
- (double)sp_dictionaryDoubleForKey:(id _Nonnull)key;

// transform NSNumber or NSString to float
- (float)sp_dictionaryFloatForKey:(id _Nonnull)key;

// transform NSNumber or NSString to BOOL
- (BOOL)sp_dictionaryBoolForKey:(id _Nonnull)key;


//if anObject is nil ,mean remove value for aKey
//anObject为空则等于移除键值
- (nullable NSDictionary *)sp_dictionarySetObject:(nullable id)anObject forKey:(id _Nonnull)aKey;

//sp add Entries for NSDictionary
- (nullable NSDictionary *)sp_dictionaryAddEntriesFromDictionary:(nonnull NSDictionary *)otherDictionary;

- (nullable NSDictionary*)sp_dictionarySetDictionary:(nonnull NSDictionary *)otherDictionary;

/********sp remove method***/

- (nullable NSDictionary*)sp_dictionaryRemoveObjectForKey:(_Nonnull id)aKey;

- (nullable NSDictionary*)sp_dictionaryRemoveAllObjects;


/**
 该方法快速取出嵌套字典内的字段
 例如：NSDictionary *dic =  @{@"one":@{@"two":@{@"three":@(3)}}};
 id ret = [dic sp_stringForKeyPath:@"one.two.three"];
 得到ret为@"3";
 @param keyPath 嵌套字段路径
 @return 返回数据
 */
- (NSString*_Nullable)sp_dictionaryStringForKeyPath:(NSString *_Nonnull)keyPath;

/**
 该方法快速取出嵌套字典内的字段
 例如：NSDictionary *dic =  @{@"one":@{@"two":@{@"three":@(3)}}};
 id ret = [dic sp_objectForKeyPath:@"one.two.three"];
 得到ret为3;
 @param keyPath 嵌套字段路径
 @return 返回数据
 */
- (id _Nullable)sp_dictionaryObjectForKeyPath:(NSString *_Nonnull)keyPath;

/****get JSON  Data method***/

//得到jsondata
- (nullable NSData *)sp_dictionaryToJSONData;

//得到jsondata的编码字符串
-(NSString *_Nullable)sp_dictionaryToJSONString_UTF8;

//得到jsondata的编码字符串（自定义编码）
-(NSString *_Nullable)sp_dictionaryToJSONStringWithEncoding:(NSStringEncoding)encoding;


@end

