//
//  NSDictionary+Safe.h
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/10/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//

//If you feel this open source library is of great help to you, please open the URL to the point of a great, great encouragement your recognition to the author, the author will release better open source library for you again
//如果您感觉本开源库对您很有帮助，请打开URL给作者点个赞，您的认可给作者极大的鼓励，作者还会再发布更好的开源库给大家

//github address//https://github.com/lishiping/SPWebView
//github address//https://github.com/lishiping/SPDebugBar
//github address//https://github.com/lishiping/SPFastPush
//github address//https://github.com/lishiping/SPMacro
//github address//https://github.com/lishiping/SafeData
//github address//https://github.com/lishiping/SPCategory



#define SP_IS_KINDOF(obj, cls)  [(obj) isKindOfClass:[cls class]]


#if DEBUG

#define ASSERT(x)               assert((x))
#define SP_LOG(...) NSLog(__VA_ARGS__);

#else

#define ASSERT(x)
#define SP_LOG(...) 

#endif


#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

/********safe get method***/

// get string or nil
- (nullable NSString *)safe_stringForKey:(nullable id)key;

// get array or nil
- (nullable NSArray *)safe_arrayForKey:(nullable id)key;

// get dictionary or nil
- (nullable NSDictionary *)safe_dictionaryForKey:(nullable id)key;

// get number or nil
- (nullable NSNumber *)safe_numberForKey:(nullable id)key;

// get data or nil
- (nullable NSData *)safe_dataForKey:(nullable id)key;

//get NSInteger or nil
- (NSInteger)safe_integerForKey:(nullable id)key;

//OC type transform C type
// transform NSNumber or NSString to int
- (int)safe_intForKey:(nullable id)key;

// transform NSNumber or NSString to long
- (long)safe_longForKey:(nullable id)key;

// transform NSNumber or NSString to long long
- (long long)safe_longLongForKey:(nullable id)key;

// transform NSNumber or NSString to double
- (double)safe_doubleForKey:(nullable id)key;

// transform NSNumber or NSString to float
- (float)safe_floatForKey:(nullable id)key;

// transform NSNumber or NSString to BOOL
- (BOOL)safe_boolForKey:(nullable id)key;


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
- (nullable NSDictionary *)safe_dictionaryBySetObject:(nullable id)anObject forKey:(nullable id)aKey;

//safe add Entries for NSDictionary
- (nullable NSDictionary *)safe_dictionaryAddEntriesFromDictionary:(nullable NSDictionary *)otherDictionary;

/****get JSON  Data method***/

- (nullable NSData *)toJSONData;

@end



#pragma mark - NSMutableDictionary + Safe

@interface NSMutableDictionary<KeyType, ObjectType> (Safe)

//safe set object
- (BOOL)safe_setObject:(nullable ObjectType)anObject forKey:(nullable KeyType)aKey;

// safe set string
- (BOOL)safe_setString:(nullable NSString *)anObject forKey:(nullable KeyType)aKey;

- (void)safe_addEntriesFromDictionary:(nullable NSDictionary *)otherDictionary;


@end
