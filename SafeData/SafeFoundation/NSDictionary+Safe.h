//
//  NSDictionary+Safe.h
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/10/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//

#define SP_IS_KINDOF(obj, cls)  [(obj) isKindOfClass:[cls class]]


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

@end
