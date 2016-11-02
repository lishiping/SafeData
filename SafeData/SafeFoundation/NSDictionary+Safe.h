//
//  NSDictionary+Safe.h
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/10/19.
//  Copyright © 2016年 uxin-lishiping. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

/********safe get method***/

// get string or nil
- (NSString *)safe_stringForKey:(id)key;

// get array or nil
- (NSArray *)safe_arrayForKey:(id)key;

// get dictionary or nil
- (NSDictionary *)safe_dictionaryForKey:(id)key;

// get number or nil
- (NSNumber *)safe_numberForKey:(id)key;

// get data or nil
- (NSData *)safe_dataForKey:(id)key;

//get NSInteger or nil
- (NSInteger)safe_integerForKey:(id)key;

//OC type transform C type
// transform NSNumber or NSString to int
- (int)safe_intForKey:(id)key;

// transform NSNumber or NSString to long
- (long)safe_longForKey:(id)key;

// transform NSNumber or NSString to long long
- (long long)safe_longLongForKey:(id)key;

// transform NSNumber or NSString to double
- (double)safe_doubleForKey:(id)key;

// transform NSNumber or NSString to float
- (float)safe_floatForKey:(id)key;

// transform NSNumber or NSString to BOOL
- (BOOL)safe_boolForKey:(id)key;

@end
