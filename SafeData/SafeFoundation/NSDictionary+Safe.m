//
//  NSDictionary+Safe.m
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/10/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//

#define VALUE_FOR_KEY(key, func1, func2)  {\
id _ret = [self objectForKey:key];\
if ([_ret isKindOfClass:[NSNumber class]]) {\
return ([(NSNumber *)_ret func1]);\
} else if ([_ret isKindOfClass:[NSString class]]) {\
return ([(NSString *)_ret func2]);\
}\
}

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (nullable NSString *)safe_stringForKey:(nullable id)key
{
    if (!key) {
        return nil;
    }
    
    id object = [self objectForKey:key];
    
    NSString *ret=nil;
    
    if ([object isKindOfClass:[NSString class]])
    {
        ret = (NSString *)object;
    }
    else if ([object isKindOfClass:[NSNumber class]])
    {
        ret = [object stringValue];
    }
    else if ([object isKindOfClass:[NSURL class]])
    {
        ret = [(NSURL *)object absoluteString];
    }
    else
    {
        ret = [object description];
    }
    return (ret);
    
}

- (nullable NSArray *)safe_arrayForKey:(nullable id)key
{
    if (!key) {
        return nil;
    }
    
    id ret = [self objectForKey:key];
    if (ret&&[ret isKindOfClass:[NSArray class]])
    {
        return ((NSArray *)ret);
    }
    return (nil);
}

- (nullable NSDictionary *)safe_dictionaryForKey:(nullable id)key
{
    if (!key) {
        return nil;
    }
    id ret = [self objectForKey:key];
    if (ret&&[ret isKindOfClass:[NSDictionary class]])
    {
        return ((NSDictionary *)ret);
    }
    return (nil);
}

- (nullable NSNumber *)safe_numberForKey:(nullable id)key
{
    if (!key) {
        return nil;
    }
    
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSNumber class]])
    {
        return ((NSNumber *)ret);
    }
    return (nil);
}

- (nullable NSData *)safe_dataForKey:(nullable id)key
{
    if (!key) {
        return nil;
    }
    
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSData class]])
    {
        return ((NSData *)ret);
    }
    return (nil);
}

- (int)safe_intForKey:(nullable id)key
{
    
    if (!key) {
        return 0;
    }
    
    VALUE_FOR_KEY(key, intValue, intValue);
    return (0);
}

- (long)safe_longForKey:(nullable id)key
{
    if (!key) {
        return 0.0f;
    }
    
    VALUE_FOR_KEY(key, longValue, longLongValue);
    return (0.0f);
}

- (long long)safe_longLongForKey:(nullable id)key
{
    if (!key) {
        return 0.0f;
    }
    VALUE_FOR_KEY(key, longLongValue,longLongValue);
    return (0.0f);
}

- (double)safe_doubleForKey:(nullable id)key
{
    if (!key) {
        return 0.0f;
    }
    VALUE_FOR_KEY(key, doubleValue,doubleValue);
    return (0.0);
}

- (NSInteger)safe_integerForKey:(nullable id)key
{
    if (!key) {
        return 0;
    }
    VALUE_FOR_KEY(key, integerValue,integerValue);
    return (0);
}

- (float)safe_floatForKey:(nullable id)key
{
    if (!key) {
        return 0.0f;
    }
    VALUE_FOR_KEY(key, floatValue,floatValue);
    return (0.0);
}

- (BOOL)safe_boolForKey:(nullable id)key
{
    if (!key) {
        return NO;
    }
    
    VALUE_FOR_KEY(key, boolValue,boolValue);
    return (NO);
}

// add anObject
- (nullable NSDictionary *)safe_dictionaryBySetObject:(nullable id)anObject forKey:(nullable id)aKey
{
    if (aKey) {
        NSMutableDictionary *mDict = [self mutableCopy];
        [mDict safe_setObject:anObject forKey:aKey];
        return ([mDict copy]);
    }
    
    return self;
}

- (nullable NSDictionary *)safe_dictionaryAddEntriesFromDictionary:(nullable NSDictionary *)otherDictionary
{
    if (otherDictionary) {
        NSMutableDictionary *dic = [self mutableCopy];
        [dic addEntriesFromDictionary:otherDictionary];
        return ([dic copy]);
    }
    
    return self;
}

- (nullable NSData *)toJSONData
{
    NSData *ret = nil;
    NSError *err = nil;
    ret = [NSJSONSerialization dataWithJSONObject:self
                                          options:0
                                            error:&err];
    if (err)
    {
        NSLog(@"DictionarytoJsonDataError:%@",err.description);
        ret = nil;
    }
    return (ret);
}

@end



#pragma mark - NSMutableDictionary + Safe
#define KeyType id
#define ObjectType id

@implementation NSMutableDictionary (Safe)

- (BOOL)safe_setObject:(nullable ObjectType)anObject forKey:(nullable KeyType)aKey;
{
    BOOL ret = NO;
    if (aKey)
    {
        [self setObject:anObject forKey:aKey];
        ret = YES;
    }
    return (ret);
}

- (BOOL)safe_setString:(nullable NSString *)anObject forKey:(nullable KeyType)aKey;
{
    BOOL ret = NO;
    if (aKey)
    {
        if([anObject isKindOfClass:[NSString class]] &&anObject.length>0)
        {
            [self setObject:anObject forKey:aKey];
        }
        else
        {
            [self removeObjectForKey:aKey];
        }
        ret = YES;
    }
    return (ret);
}

@end



