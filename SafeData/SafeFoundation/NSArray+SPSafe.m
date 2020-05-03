//
//  NSArray+SPSafe.m
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/9/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//


#import "NSArray+SPSafe.h"

#import "NSDictionary+SPSafe.h"
#import "NSData+SPSafe.h"
#import "NSMutableArray+SPSafe.h"
#import "SPSafeDataMacro.h"

@implementation NSArray (SPSafe)

- (id)safe_objectAtIndex:(NSInteger)index
{
    SP_ASSERT(index>=0);
    SP_ASSERT(self.count>0);
    
    if (self.count>0 && index<self.count && index>=0)
    {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSString*)safe_stringAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if (SP_IS_KIND_OF(obj, NSString))
    {
        return obj;
    }else if (SP_IS_KIND_OF(obj, NSNumber))
    {
        return [(NSNumber *)obj stringValue];
    }
    
    return nil;
}

- (NSDictionary*)safe_dictionaryAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if (SP_IS_KIND_OF(obj, NSDictionary)) {
        return (obj);
    }
    return nil;
}

- (NSArray*)safe_arrayAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if (SP_IS_KIND_OF(obj, NSArray)) {
        return (obj);
    }
    return nil;
}

- (UIImage*)safe_imageAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if (SP_IS_KIND_OF(obj, UIImage)) {
        return (obj);
    }
    return nil;
}

- (NSData*)safe_dataAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if (SP_IS_KIND_OF(obj, NSData)) {
        return (obj);
    }
    return nil;
}

- (NSInteger)safe_integerAtIndex:(NSUInteger)index;
{
    id obj = [self safe_objectAtIndex:index];
    SP_SAFE_VALUE(obj, integerValue, integerValue);
    
    return 0;
}

-(int)safe_intAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SP_SAFE_VALUE(obj, intValue, intValue);
    
    return 0;
}

-(long)safe_longAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SP_SAFE_VALUE(obj, longValue, integerValue);
    
    return 0;
}

-(long long)safe_longlongAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SP_SAFE_VALUE(obj, longLongValue, longLongValue);
    
    return 0;
}

-(double)safe_doubleAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SP_SAFE_VALUE(obj, doubleValue, doubleValue);
    
    return 0.0f;
}

-(float)safe_floatAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SP_SAFE_VALUE(obj, floatValue, floatValue);
    
    return 0.0f;
}

- (id)safe_getFirstObject
{
    return [self safe_objectAtIndex:0];
}

- (id)safe_getLastObject
{
    return [self safe_objectAtIndex:self.count-1];
}

- (NSUInteger)safe_getIndexByObject:(id)object
{
    __block NSUInteger index = -1;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (object==obj)
        {
            index = idx;
            *stop = YES;
        }
    }];
    
    return index;
}

- (NSArray*)safe_arrayByLastObject
{
    return [self safe_arrayByRemoveAtIndex:self.count-1];
}

- (NSArray*)safe_arrayByFirstObject
{
    return [self safe_arrayByRemoveAtIndex:0];
}

- (NSArray*)safe_arrayByRemoveAtIndex:(NSInteger)index
{
    SP_ASSERT(index>0);
    SP_ASSERT(self.count>0);

    if (self.count>0 && index>=0 && index<self.count)
    {
        NSMutableArray *temp = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [temp safe_removeObjectAtIndex:index];
        return temp;
    }
    return nil;
}

-(NSArray*)safe_arrayByRemoveObject:(id)anObject
{
    SP_ASSERT(self.count>0);
    SP_ASSERT(anObject);
    
    if (self.count>0 && anObject)
    {
        NSMutableArray *temp = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [temp safe_removeObject:anObject];
        return temp;
    }
    return nil;
}

-(NSArray*)safe_arrayByRemoveObjects:(NSArray *)otherArray
{
    SP_ASSERT_CLASS(otherArray,NSArray);
    SP_ASSERT(self.count>0);
    
    if (otherArray.count>0 && self.count>0)
    {
        NSMutableArray *temp = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [temp safe_removeObjectsInArray:otherArray];
        return temp;
    }
    return nil;
}

-(NSArray*)safe_arrayByRemoveNullObjects
{
    SP_ASSERT(self.count>0);
    
    if (self.count>0) {
        NSMutableArray *temp = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [temp enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSNull class]]) {
                [temp safe_removeObject:obj];
            }
        }];
        return temp;
    }
    return nil;
}

-(NSArray*)safe_subarrayWithRange:(NSRange)range
{
    NSUInteger num = range.location+range.length;
    if (self.count>=num && num>=0) {
        return [self subarrayWithRange:range];
    }
    return self;
}
-(NSArray*)safe_arrayByAddObject:(id)anObject
{
    SP_ASSERT(anObject);
    
    if (anObject)
    {
        NSMutableArray *temp = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [temp safe_addObject:anObject];
        return temp;
    }
    return self;
}

-(NSArray*)safe_arrayByAddObjects:(NSArray *)array
{
    SP_ASSERT_CLASS(array, NSArray);
    
    if (SP_IS_KIND_OF(array, NSArray) && array.count>0)
    {
        NSMutableArray *temp = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [temp safe_addObjectsFromArray:array];
        return temp;
    }
    return self;
}

-(BOOL)safe_containsObject:(id)anObject
{
    SP_ASSERT(anObject);
    SP_ASSERT(self.count>0);
    
    if (anObject && self.count>0 && !SP_IS_KIND_OF(anObject, NSNull)) {
        return [self containsObject:anObject];
    }
    return NO;
}

-(BOOL)safe_containsObjectsArray:(NSArray *)otherArray
{
    SP_ASSERT_CLASS(otherArray, NSArray);
    SP_ASSERT(self.count>0);
    
    if (self.count>0 &&SP_IS_KIND_OF(otherArray, NSArray)&& otherArray.count>0)
    {
        NSSet *set = [NSSet setWithArray:self];
        NSSet *set2 = [NSSet setWithArray:otherArray];
        return ([set2 isSubsetOfSet:set]);
    }
    return NO;
}

-(NSArray*)safe_valueForKey:(NSString *)key
{
    SP_ASSERT_CLASS(key,NSString);
    SP_ASSERT(self.count>0);
    
    if (self.count>0 && SP_IS_KIND_OF(key, NSString) && key.length>0)
    {
        NSArray *tmp = [self valueForKey:key];
        if (SP_IS_KIND_OF(tmp, NSArray) && tmp.count>0)
        {
            NSMutableArray *arr = [tmp mutableCopy];
            for (id obj in arr)
            {
                if (!obj || SP_IS_KIND_OF(obj, NSNull))
                {
                    [arr safe_removeObject:obj];
                }
            }
            return ([arr copy]);
        }
    }
    return nil;
}

-(NSData*)safe_toJSONData
{
    SP_ASSERT(self.count>0);
    
    NSData *ret = nil;
    NSError *err = nil;
    
    if (self.count > 0)
    {
        ret = [NSJSONSerialization dataWithJSONObject:self
                                              options:0
                                                error:&err];
    }
    
    if (err)
    {
        SP_LOG(@"NSArraytoJsonDataError:%@",err.description);
        ret = nil;
    }
    return (ret);
}

-(NSString *)safe_toJSONString_UTF8
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

-(BOOL)safe_isExistObject:(NSDictionary *)newDic longKey:(NSString *)longKey
{
    SP_ASSERT(self.count>0);
    SP_ASSERT_CLASS(newDic,NSDictionary);
    SP_ASSERT_CLASS(longKey,NSString);
    
    __block BOOL ret = NO;
    if (SP_IS_KIND_OF(newDic, NSDictionary) &&SP_IS_KIND_OF(longKey, NSString)&& longKey.length>0)
    {
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if (SP_IS_KIND_OF(obj, NSDictionary))
            {
                //找到字典里面以唯一id为标识的字段相比较
                long oldid  = [obj safe_longForKey:longKey];
                long newid  = [newDic safe_longForKey:longKey];
                if (newid == oldid)
                {
                    ret = YES;
                    *stop =YES;
                }
            }
            else
            {
                ret = NO;
                *stop =YES;
            }
        }];
    }
    return ret;
}

-(BOOL)safe_isExistObject:(NSDictionary *)newDic stringKey:(NSString *)stringKey
{
    SP_ASSERT(self.count>0);
    SP_ASSERT_CLASS(newDic,NSDictionary);
    SP_ASSERT_CLASS(stringKey,NSString);
    
    __block BOOL ret = NO;
    
    if ([newDic isKindOfClass:[NSDictionary class]] && stringKey.length>0)
    {
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if (SP_IS_KIND_OF(obj, NSDictionary))
            {
                //找到字典里面以唯一字符串为标识的字段相比较
                NSString *oldStr  = [obj safe_stringForKey:stringKey];
                NSString *newStr  = [newDic safe_stringForKey:stringKey];
                if ([newStr isEqualToString:oldStr]) {
                    ret = YES;
                    *stop = YES;
                }
            }
            else
            {
                ret = NO;
                *stop =YES;
            }
        }];
    }
    return NO;
}

@end


