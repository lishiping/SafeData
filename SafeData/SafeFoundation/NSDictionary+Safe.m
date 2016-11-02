//
//  NSDictionary+Safe.m
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/10/19.
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

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (NSString *)safe_stringForKey:(id)key;
{
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

- (NSArray *)safe_arrayForKey:(id)key
{
    id ret = [self objectForKey:key];
    if (ret&&[ret isKindOfClass:[NSArray class]])
    {
        return ((NSArray *)ret);
    }
    return (nil);
}

- (NSDictionary *)safe_dictionaryForKey:(id)key
{
    id ret = [self objectForKey:key];
    if (ret&&[ret isKindOfClass:[NSDictionary class]])
    {
        return ((NSDictionary *)ret);
    }
    return (nil);
}

- (NSNumber *)safe_numberForKey:(id)key
{
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSNumber class]])
    {
        return ((NSNumber *)ret);
    }
    return (nil);
}

- (NSData *)safe_dataForKey:(id)key
{
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSData class]])
    {
        return ((NSData *)ret);
    }
    return (nil);
}

- (int)safe_intForKey:(id)key{
    VALUE_FOR_KEY(key, intValue, intValue);
    return (0);
}

- (long)safe_longForKey:(id)key
{
    VALUE_FOR_KEY(key, longValue, intValue);
    return (0);
}

- (long long)safe_longLongForKey:(id)key;
{
    VALUE_FOR_KEY(key, longLongValue,longLongValue);
    return (0);
}

- (double)safe_doubleForKey:(id)key;
{
    VALUE_FOR_KEY(key, doubleValue,doubleValue);
    return (0.0);
}

- (NSInteger)safe_integerForKey:(id)key
{
    VALUE_FOR_KEY(key, integerValue,integerValue);
    return (0);
}

- (float)safe_floatForKey:(id)key
{
    VALUE_FOR_KEY(key, floatValue,floatValue);
    return (0);
}

- (BOOL)safe_boolForKey:(id)key
{
    VALUE_FOR_KEY(key, boolValue,boolValue);
    return (NO);
}

@end
