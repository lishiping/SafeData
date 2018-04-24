//
//  NSMutableDictionary+SPSafe.h
//  SafeData
//
//  Created by shiping li on 2018/4/20.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+SPSafe.h"

@interface NSMutableDictionary (SPSafe)

/********safe set method***/
//safe set object
- (BOOL)safe_setObject:(nullable id)anObject forKey:(nullable id)aKey;

// safe set string
- (BOOL)safe_setString:(nullable NSString *)anObject forKey:(nullable id)aKey;

- (BOOL)safe_addEntriesFromDictionary:(nullable NSDictionary *)otherDictionary;

- (BOOL)safe_setDictionary:(NSDictionary *_Nonnull)otherDictionary;

/********safe remove method***/

- (BOOL)safe_removeObjectForKey:(nullable id)aKey;

- (BOOL)safe_removeAllObjects;

@end
