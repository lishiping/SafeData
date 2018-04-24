//
//  NSObject+SPDictionarySafe.m
//  SafeData
//
//  Created by shiping li on 2018/4/19.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import "NSObject+SPDictionarySafe.h"
#import "SPSafeDataMacro.h"
#import "NSDictionary+SPSafe.h"
#import "NSMutableDictionary+SPSafe.h"
#import "NSData+SPSafe.h"

@implementation NSObject (SPDictionarySafe)

- (nullable id)sp_dictionaryObjectForKey:(id)key
{
    //为什么要每个里面都加断言呢，原因是如果只在上一个sp_objectForKey里面加断言不能马上知道到底是哪个方法调用的，在每个里面加断言可以立刻知道是调用的哪个方法
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT(key);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_objectForKey:key];
    }
    return nil;
}

- (nullable NSString *)sp_dictionaryStringForKey:(id)key
{

    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT(key);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_stringForKey:key];
    }

    return nil;
}

- (nullable NSArray *)sp_dictionaryArrayForKey:(id)key
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT(key);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_arrayForKey:key];
    }
    return nil;
}

- (nullable NSDictionary *)sp_dictionaryDictionaryForKey:(id)key
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT(key);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_dictionaryForKey:key];
    }
    return nil;
}

- (nullable NSNumber *)sp_dictionaryNumberForKey:(id)key
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT(key);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_numberForKey:key];
    }
    return nil;
}

- (nullable NSData *)sp_dictionaryDataForKey:(id)key
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT(key);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_dataForKey:key];
    }
    return nil;
}

- (NSInteger)sp_dictionaryIntegerForKey:(id)key
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT(key);
    
    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_integerForKey:key];
    }
    return (0);
}

- (int)sp_dictionaryIntForKey:(id)key
{
    SP_ASSERT(key);
    SP_ASSERT_CLASS(self,NSDictionary);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_intForKey:key];
    }
    return (0);
}

- (long)sp_dictionaryLongForKey:(id)key
{
    SP_ASSERT(key);
    SP_ASSERT_CLASS(self,NSDictionary);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_longForKey:key];
    }
    return (0);
}

- (long long)sp_dictionaryLongLongForKey:(id)key
{
    SP_ASSERT(key);
    SP_ASSERT_CLASS(self,NSDictionary);
    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_longLongForKey:key];
    }
    return (0);
}

- (double)sp_dictionaryDoubleForKey:(id)key
{
    SP_ASSERT(key);
    SP_ASSERT_CLASS(self,NSDictionary);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_doubleForKey:key];
    }
    return (0.0f);
}

- (float)sp_dictionaryFloatForKey:(id)key
{
    SP_ASSERT(key);
    SP_ASSERT_CLASS(self,NSDictionary);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_floatForKey:key];
    }
    return (0.0f);
}

- (BOOL)sp_dictionaryBoolForKey:(id)key
{
    SP_ASSERT(key);
    SP_ASSERT_CLASS(self,NSDictionary);

    if (SP_IS_KIND_OF(self, NSDictionary) && key)
    {
        return [(NSDictionary*)self safe_boolForKey:key];
    }
    return (NO);
}

// add anObject
- (nullable NSDictionary *)sp_dictionarySetObject:(id)anObject forKey:(id)aKey
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT_CLASS(aKey,NSString);

    if (SP_IS_KIND_OF(self, NSDictionary))
    {
        NSMutableDictionary *mDict = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mDict safe_setObject:anObject forKey:aKey];
        return mDict;
    }

    return nil;
}

- (nullable NSDictionary *)sp_dictionaryAddEntriesFromDictionary:(nonnull NSDictionary *)otherDictionary
{
    SP_ASSERT_CLASS(otherDictionary,NSDictionary);
    SP_ASSERT_CLASS(self,NSDictionary);

    if (SP_IS_KIND_OF(self, NSDictionary))
    {
        NSMutableDictionary *mDict = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mDict safe_addEntriesFromDictionary:otherDictionary];
        return mDict;
    }

    return nil;
}

- (NSDictionary*)sp_dictionarySetDictionary:(NSDictionary<id,id> *)otherDictionary
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT_CLASS(otherDictionary,NSDictionary);
    
    if (SP_IS_KIND_OF(self, NSDictionary))
    {
        NSMutableDictionary *mDict = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mDict safe_setDictionary:otherDictionary];
        return mDict;
    }
    
    return nil;
}

- (NSDictionary*)sp_dictionaryRemoveObjectForKey:(id)aKey
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT(aKey);
    
    if (SP_IS_KIND_OF(self, NSDictionary))
    {
        NSMutableDictionary *mDict = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mDict safe_removeObjectForKey:aKey];
        return mDict;
    }
    
    return nil;
}

- (NSDictionary*)sp_dictionaryRemoveAllObjects
{
    SP_ASSERT_CLASS(self,NSDictionary);
    
    if (SP_IS_KIND_OF(self, NSDictionary))
    {
        NSMutableDictionary *mDict = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mDict safe_removeAllObjects];
        return mDict;
    }
    
    return nil;
}

- (NSString*_Nullable)sp_dictionaryStringForKeyPath:(NSString *)keyPath
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT_CLASS(keyPath,NSString);

    if (SP_IS_KIND_OF(self, NSDictionary)&&SP_IS_KIND_OF(keyPath, NSString) && keyPath.length>0)
    {
        [(NSDictionary*)self safe_stringForKeyPath:keyPath];
    }
   
    return nil;
}

- (id)sp_dictionaryObjectForKeyPath:(NSString *)keyPath
{
    SP_ASSERT_CLASS(self,NSDictionary);
    SP_ASSERT_CLASS(keyPath,NSString);

    if (SP_IS_KIND_OF(self, NSDictionary)&&SP_IS_KIND_OF(keyPath, NSString) && keyPath.length>0)
    {
        [(NSDictionary*)self safe_objectForKeyPath:keyPath];
    }
    
    return nil;

}

- (nullable NSData *)sp_dictionaryToJSONData
{
    if (SP_IS_KIND_OF(self, NSDictionary))
    {
        return [(NSDictionary*)self safe_toJSONData];
    }
    return nil;
}

-(NSString *)sp_dictionaryToJSONString_UTF8
{
    return [self sp_dictionaryToJSONStringWithEncoding:NSUTF8StringEncoding];
}

-(NSString *)sp_dictionaryToJSONStringWithEncoding:(NSStringEncoding)encoding
{
    NSString *ret = nil;
    NSData *jsonData = [self sp_dictionaryToJSONData];
    
    if (jsonData) {
        ret = [jsonData safe_getJSONStringWithEncoding:encoding];
    }
    return ret;
}


@end

