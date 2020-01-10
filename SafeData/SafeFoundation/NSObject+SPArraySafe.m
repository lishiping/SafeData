//
//  NSObject+SPArraySafe.m
//  SafeData
//
//  Created by shiping li on 2018/4/15.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import "NSObject+SPArraySafe.h"
#import "SPSafeDataMacro.h"
#import "NSArray+SPSafe.h"
#import "NSMutableArray+SPSafe.h"
#import "NSData+SPSafe.h"

@implementation NSObject (SPArraySafe)

- (id)sp_arrayObjectAtIndex:(NSInteger)index
{
    //加入断言是为了在debug下方便调试程序，如果有对象是空对象和类型问题，会停留在断言上，方便开发者查找问题，每个方法都加入，方便开发者直接找到调用地点
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
        return [(NSArray*)self safe_objectAtIndex:index];
    }
    return nil;
}

- (NSString*)sp_arrayStringAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
        return [(NSArray*)self safe_stringAtIndex:index];
    }
    return nil;
}

- (NSDictionary*)sp_arrayDictionaryAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    if (SP_IS_KIND_OF(obj, NSDictionary)) {
        return (obj);
    }
    return nil;
}

- (NSArray*)sp_arrayArrayAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    if (SP_IS_KIND_OF(obj, NSArray)) {
        return (obj);
    }
    return nil;
}

- (UIImage*)sp_arrayImageAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    if (SP_IS_KIND_OF(obj, UIImage)) {
        return (obj);
    }
    return nil;
}

- (NSData*)sp_arrayDataAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    if (SP_IS_KIND_OF(obj, NSData)) {
        return (obj);
    }
    return nil;
}

- (NSInteger)sp_arrayIntegerAtIndex:(NSUInteger)index;
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    SP_SAFE_VALUE(obj, integerValue, integerValue);
    
    return 0;
}

-(int)sp_arrayIntAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    
    SP_SAFE_VALUE(obj, intValue, intValue);
    
    return 0;
}

-(long)sp_arrayLongAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    
    SP_SAFE_VALUE(obj, longValue, integerValue);
    
    return 0;
}

-(long long)sp_arrayLonglongAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    
    SP_SAFE_VALUE(obj, longLongValue, longLongValue);
    
    return 0;
}

-(double)sp_arrayDoubleAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    
    SP_SAFE_VALUE(obj, doubleValue, doubleValue);
    
    return 0.0f;
}

-(float)sp_arrayFloatAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    id obj = [self sp_arrayObjectAtIndex:index];
    
    SP_SAFE_VALUE(obj, floatValue, floatValue);
    
    return 0.0f;
}

- (id)sp_arrayFirstObject
{
    SP_ASSERT_CLASS(self,NSArray);
    
    return [self sp_arrayObjectAtIndex:0];
}

- (id)sp_arrayLastObject
{
    SP_ASSERT_CLASS(self,NSArray);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
        return [self sp_arrayObjectAtIndex:((NSArray*)self).count-1];
    }
    return nil;
}

- (NSUInteger)sp_arrayIndexByObject:(id)object
{
    if (SP_IS_KIND_OF(self, NSArray))
    {
        [(NSArray*)self safe_getIndexByObject:object];
    }
    
    return -1;
}

-(NSArray*)sp_arrayRemoveObject:(id)anObject
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(anObject);
    
    if (SP_IS_KIND_OF(self, NSArray) &&((NSArray*)self).count>0 && anObject)
    {
        return [(NSArray*)self safe_arrayByRemoveObject:anObject];
    }
    return nil;
}

-(NSArray*)sp_arrayRemoveObjects:(NSArray *)otherArray
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(otherArray);
    
    if (SP_IS_KIND_OF(self, NSArray) &&SP_IS_KIND_OF(otherArray, NSArray) &&((NSArray*)self).count>0 && otherArray.count>0 )
    {
        return [(NSArray*)self safe_arrayByRemoveObjects:otherArray];
    }
    return nil;
}

-(NSArray*)sp_arrayRemoveNullObjects
{
    SP_ASSERT_CLASS(self,NSArray);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
        return [(NSArray*)self safe_arrayByRemoveNullObjects];
    }
    return nil;
}

- (NSArray*)sp_arrayRemoveLastObject
{
    SP_ASSERT_CLASS(self,NSArray);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
      return  [(NSArray*)self safe_arrayByLastObject];
    }
    return nil;
}

- (NSArray*)sp_arrayRemoveFirstObject
{
    SP_ASSERT_CLASS(self,NSArray);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
        return  [(NSArray*)self safe_arrayByFirstObject];
    }
    return nil;
}

- (NSArray*)sp_arrayRemoveObjectAtIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
      return [(NSArray*)self safe_arrayByRemoveAtIndex:index];
    }
    return nil;
}

- (NSArray*)sp_arrayRemoveObject:(id)anObject inRange:(NSRange)range
{
    SP_ASSERT_CLASS(self,NSArray);
    
    if (SP_IS_KIND_OF(self, NSArray) && anObject)
    {
        NSMutableArray *temp = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [temp safe_removeObject:anObject inRange:range];
        return temp;
    }
    return nil;
}

-(NSArray*)sp_arrayRemoveObjectsInRange:(NSRange)range
{
    SP_ASSERT_CLASS(self,NSArray);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
        NSMutableArray *temp = SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [temp safe_removeObjectsInRange:range];
        return temp;
    }
    return nil;
}


-(NSArray*)sp_arrayAddObject:(id)anObject
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(anObject);
    
    if (SP_IS_KIND_OF(self, NSArray) && anObject)
    {
        return [(NSArray*)self safe_arrayByAddObject:anObject];
    }
    return nil;
}

-(NSArray*)sp_arrayAddObjects:(NSArray *)array
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(array);
    
    if (SP_IS_KIND_OF(self, NSArray) && SP_IS_KIND_OF(array, NSArray))
    {
        return [(NSArray*)self safe_arrayByAddObjects:array];
    }
    return nil;
}

- (NSArray*)sp_subarrayWithRange:(NSRange)range
{
    SP_ASSERT_CLASS(self,NSArray);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
        return [(NSArray*)self safe_subarrayWithRange:range];
    }
    return nil;
}

- (NSArray*)sp_arrayInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(anObject);
    SP_ASSERT(index>=0);
    
    if (SP_IS_KIND_OF(self, NSArray) && anObject)
    {
        NSMutableArray *mArr= SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mArr safe_insertObject:anObject atIndex:index];
        return mArr;
    }
    return nil;
}

- (NSArray*)sp_arrayInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT_CLASS(objects,NSArray);
    SP_ASSERT_CLASS(indexes,NSIndexSet);
    
    if (SP_IS_KIND_OF(self, NSArray) && SP_IS_KIND_OF(objects, NSArray) && indexes)
    {
        NSMutableArray *mArr= SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mArr safe_insertObjects:objects atIndexes:indexes];
        return mArr;
    }
    return nil;
}

- (NSArray*)sp_arrayExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(idx1>=0);
    SP_ASSERT(idx2>=0);
    
    if (SP_IS_KIND_OF(self, NSArray))
    {
        NSMutableArray *mArr= SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mArr safe_exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
        return mArr;
    }
    return nil;
}

- (NSArray*)sp_arrayReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(index>=0);
    SP_ASSERT(anObject);
    
    if (SP_IS_KIND_OF(self, NSArray) && anObject)
    {
        NSMutableArray *mArr= SP_IS_KIND_OF(self, NSMutableArray)?self:[self mutableCopy];
        [mArr safe_replaceObjectAtIndex:index withObject:anObject];
        return mArr;
    }
    return nil;
}

-(BOOL)sp_arrayContainsObject:(id)anObject
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(anObject);
    
    if (SP_IS_KIND_OF(self, NSArray) && anObject)
    {
        return [(NSArray*)self safe_containsObject:anObject];
    }
    return NO;
}

-(BOOL)sp_arrayContainsObjectsArray:(NSArray *)otherArray
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT(otherArray);
    
    if (SP_IS_KIND_OF(self, NSArray)&&SP_IS_KIND_OF(otherArray, NSArray))
    {
        return [(NSArray*)self safe_containsObjectsArray:otherArray];
    }
    return NO;
}

-(NSArray*)sp_arrayValueForKey:(NSString *)key
{
    SP_ASSERT_CLASS(self,NSArray);
    SP_ASSERT_CLASS(key,NSString);
    
    if (SP_IS_KIND_OF(self, NSArray) && SP_IS_KIND_OF(key, NSString))
    {
        [(NSArray*)self safe_valueForKey:key];
    }
    return nil;
}

-(NSData*)sp_arrayToJSONData
{
    if (SP_IS_KIND_OF(self, NSArray))
    {
       return [(NSArray*)self safe_toJSONData];
    }
    
    return nil;
}

-(NSString *)sp_arrayToJSONString_UTF8
{
    return [self sp_arrayToJSONStringWithEncoding:NSUTF8StringEncoding];
}

-(NSString *)sp_arrayToJSONStringWithEncoding:(NSStringEncoding)encoding
{
    NSData *jsonData = [self sp_arrayToJSONData];
    
    if (SP_IS_KIND_OF(jsonData, NSData))
    {
        return [(NSData*)jsonData safe_getJSONStringWithEncoding:encoding];
    }
    return nil;
}


@end

