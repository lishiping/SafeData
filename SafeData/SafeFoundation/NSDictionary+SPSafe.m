//
//  NSDictionary+SPSafe.m
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/10/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//

#import "NSDictionary+SPSafe.h"
#import "NSData+SPSafe.h"
#import "SPSafeDataMacro.h"
#import "NSMutableDictionary+SPSafe.h"

@implementation NSDictionary (Safe)

- (nullable id)safe_objectForKey:(id)key
{
    //为什么要每个里面都加断言呢，原因是如果只在上一个safe_objectForKey里面加断言不能马上知道到底是哪个方法调用的，在每个里面加断言可以离开知道是调用的哪个方法
    SP_ASSERT(key);
    
    if (key)
    {
        return [self objectForKey:key];
    }
    return nil;
}

- (nullable NSString *)safe_stringForKey:(id)key
{
    SP_ASSERT(key);
    
    NSString *ret=nil;
    
    id object = [self safe_objectForKey:key];
    
    if (SP_IS_KIND_OF(object, NSString))
    {
        ret = (NSString *)object;
    }
    else if (SP_IS_KIND_OF(object, NSNumber))
    {
        ret = [object stringValue];
    }
    else if (SP_IS_KIND_OF(object, NSURL))
    {
        ret = [(NSURL *)object absoluteString];
    }
    else
    {
        ret = [object description];
    }
    
    return (ret);
}

- (nullable NSArray *)safe_arrayForKey:(id)key
{
    SP_ASSERT(key);
    
    id object = [self safe_objectForKey:key];
    if (SP_IS_KIND_OF(object, NSArray))
    {
        return object;
    }
    
    return nil;
}

- (nullable NSDictionary *)safe_dictionaryForKey:(id)key
{
    SP_ASSERT(key);
    
    NSDictionary *ret = nil;
    
    id object = [self safe_objectForKey:key];
    if (SP_IS_KIND_OF(object, NSDictionary))
    {
        ret = object;
    }
    
    return (ret);
}

- (nullable NSNumber *)safe_numberForKey:(id)key
{
    SP_ASSERT(key);
    
    NSNumber *ret = nil;
    
    id object= [self safe_objectForKey:key];
    if (SP_IS_KIND_OF(object, NSNumber))
    {
        ret = object;
    }
    
    return (ret);
}

- (nullable NSData *)safe_dataForKey:(id)key
{
    SP_ASSERT(key);
    
    NSData *ret = nil;
    id object= [self safe_objectForKey:key];
    if (SP_IS_KIND_OF(object, NSData))
    {
        ret = object;
    }
    
    return (ret);
}

- (NSInteger)safe_integerForKey:(id)key
{
    SP_ASSERT(key);
    
    SP_VALUE_FOR_KEY(key, integerValue,integerValue);
    return (0);
}

- (int)safe_intForKey:(id)key
{
    SP_ASSERT(key);
    
    SP_VALUE_FOR_KEY(key, intValue, intValue);
    return (0);
}

- (long)safe_longForKey:(id)key
{
    SP_ASSERT(key);
    
    SP_VALUE_FOR_KEY(key, longValue, integerValue);
    return (0);
}

- (long long)safe_longLongForKey:(id)key
{
    SP_ASSERT(key);
    
    SP_VALUE_FOR_KEY(key, longLongValue,longLongValue);
    return (0);
}

- (double)safe_doubleForKey:(id)key
{
    SP_ASSERT(key);
    
    SP_VALUE_FOR_KEY(key, doubleValue,doubleValue);
    return (0.0f);
}

- (float)safe_floatForKey:(id)key
{
    SP_ASSERT(key);
    
    SP_VALUE_FOR_KEY(key, floatValue,floatValue);
    return (0.0f);
}

- (BOOL)safe_boolForKey:(id)key
{
    SP_ASSERT(key);
    
    SP_VALUE_FOR_KEY(key, boolValue,boolValue);
    return (NO);
}

- (NSString*_Nullable)safe_stringForKeyPath:(NSString *)keyPath
{
    SP_ASSERT_CLASS(keyPath,NSString);
    
    NSString *ret = nil;
    id object = [self safe_objectForKeyPath:keyPath];
    
    if (SP_IS_KIND_OF(object, NSString))
    {
        ret = (NSString *)object;
    }
    else if (SP_IS_KIND_OF(object, NSNumber))
    {
        ret = [object stringValue];
    }
    else if (SP_IS_KIND_OF(object, NSURL))
    {
        ret = [(NSURL *)object absoluteString];
    }
    else
    {
        ret = [object description];
    }
    
    return ret;
}

- (id)safe_objectForKeyPath:(NSString *)keyPath
{
    SP_ASSERT_CLASS(keyPath,NSString);
    
    if (SP_IS_KIND_OF(keyPath, NSString)&& keyPath.length>0)
    {
        NSDictionary *dic = self;
        
        NSString *keyPathtemp = [keyPath stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSArray *arr = [keyPathtemp componentsSeparatedByString:@"."];
        
        for (int i = 0; i<arr.count; i++)
        {
            NSString *str = arr[i];
            @try {
                dic = [dic safe_objectForKey:str];
            } @catch (NSException *exception) {
                SP_LOG(@"safe_objectForKeyPath error:%@", exception);
            } @finally {
            }
        }
        return dic;
    }
    else
    {
        SP_LOG(@"keyPath  is not NSString ,or self is not NSDictionary");
        return nil;
    }
}


// add anObject
- (nullable NSDictionary *)safe_dictionaryBySetObject:(id)anObject forKey:(id)aKey
{
    SP_ASSERT_CLASS(aKey,NSString);
    
    NSMutableDictionary *mDict = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
    [mDict safe_setObject:anObject forKey:aKey];
    return ([mDict copy]);
}

- (nullable NSDictionary *)safe_dictionaryAddEntriesFromDictionary:(nullable NSDictionary *)otherDictionary
{
    SP_ASSERT_CLASS(otherDictionary,NSDictionary);
    
    if (SP_IS_KIND_OF(otherDictionary, NSDictionary)&&otherDictionary.count>0) {
        NSMutableDictionary *mDict = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mDict safe_addEntriesFromDictionary:otherDictionary];
        return ([mDict copy]);
    }
    
    return self;
}

- (nullable NSData *)safe_toJSONData
{
    NSData *ret = nil;
    NSError *err = nil;
    
    if (self.allKeys.count>0)
    {
        ret = [NSJSONSerialization dataWithJSONObject:self
                                              options:0
                                                error:&err];
        if (err)
        {
            SP_LOG(@"Dictionary to JsonData Error:%@",err);
            ret = nil;
        }
    }
    return (ret);
}

-(NSString *)safe_toJSONString_NSUTF8StringEncoding
{
    return [self safe_toJSONStringWithEncoding:NSUTF8StringEncoding];
}

-(NSString *)safe_toJSONStringWithEncoding:(NSStringEncoding)encoding
{
    NSString *ret = nil;
    NSData *jsonData = [self safe_toJSONData];
    
    if (jsonData) {
        ret = [jsonData safe_getJSONStringWithEncoding:encoding];
    }
    return ret;
}


@end

