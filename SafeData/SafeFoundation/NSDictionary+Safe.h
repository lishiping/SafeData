//
//  NSDictionary+Safe.h
//  CarHomeImageBrowse
//
//  Created by uxin-lishiping on 16/10/19.
//  Copyright © 2016年 uxin-lishiping. All rights reserved.
//


#define VALUE_FOR_KEY(key, func1, func2)  {\
id _ret = [self objectForKey:key];\
if ([_ret isKindOfClass:[NSNumber class]]) {\
return ([(NSNumber *)_ret func1]);\
} else if ([_ret isKindOfClass:[NSString class]]) {\
return ([(NSString *)_ret func2]);\
}\
}

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

/********safe get method***/

- (NSString *)safe_stringForKey:(id)key;             // get string or nil

- (NSArray *)safe_arrayForKey:(id)key;               // get array or nil

- (NSDictionary *)safe_dictionaryForKey:(id)key;     // get dictionary or nil
- (NSNumber *)safe_numberForKey:(id)key;             // get number or nil

- (NSData *)safe_dataForKey:(id)key;                 // get NSData

- (NSInteger)safe_integerForKey:(id)key;                 // 值为数字、字符串都返回NSInteger

//OC type transform C type

- (int)safe_intForKey:(id)key;                   // 值为数字、字符串都返回int

- (long)safe_longForKey:(id)key;                 // 值为数字、字符串都返回long

- (long long)safe_longLongForKey:(id)key;        // 值为数字、字符串都返回long long

- (double)safe_doubleForKey:(id)key;             // 值为数字、字符串都返回double

- (float)safe_floatForKey:(id)key;                       // 值为数字、字符串都返回float
- (BOOL)safe_boolForKey:(id)key;                         // 值为布尔、数字、字符串都返回bool

@end
