//
//  NSArray+Safe.m
//
//  Created by lishiping on 16/9/19.
//  Copyright © 2016年 uxin-lishiping. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)

- (id)safe_objectAtIndex:(NSInteger)index
{
    return (((index >= 0) && ([self count] > index)) ? [self objectAtIndex:index] : nil);
}

- (NSString*)safe_stringAtIndex:(NSInteger)index
{
    if ((index >= 0) && ([self count] > index)) {
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSString class]]) {
            return (obj);
        }
    }
    return nil;
}

- (NSDictionary*)safe_dictionaryAtIndex:(NSInteger)index
{
    if ((index >= 0) && ([self count] > index)) {
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            return (obj);
        }
    }
    return nil;
}

- (NSArray*)safe_arrayAtIndex:(NSInteger)index
{
    if ((index >= 0) && ([self count] > index)) {
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSArray class]]) {
            return (obj);
        }
    }
    return nil;
}

- (NSData*)safe_dataAtIndex:(NSInteger)index
{
    if ((index >= 0) && ([self count] > index)) {
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSData class]]) {
            return (obj);
        }
    }
    return nil;
}

- (id)safe_getFirstObject
{
    if (self.count>0) {
        id obj =  [self safe_objectAtIndex:0];
        return obj;
    }
    return nil;
}

- (id)safe_getLastObject
{
    NSUInteger index = self.count-1;
    if (index) {
        id obj =  [self safe_objectAtIndex:index];
        return obj;
    }
    return nil;
}

-(NSArray*)safe_valueForKey:(NSString *)key
{
    if (key.length < 1)
    {
        return (nil);
    }
    NSArray *tmp = [self valueForKey:key];
    if (tmp&&[tmp isKindOfClass:[NSArray class]] &&tmp.count>0)
    {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
        for (id obj in tmp)
        {
            if (obj && ![obj isKindOfClass:[NSNull class]])
            {
                [arr addObject:obj];
            }
        }
        return ([arr copy]);
    }
    return nil;
}

-(NSArray*)safe_arrayByRemoveObject:(id)anObject
{
    NSArray *ret = self;
    if (anObject&&self.count>0) {
        NSMutableArray *temp = [ret mutableCopy];
        [temp safe_removeObject:anObject];
        ret = [NSArray arrayWithArray:temp];
    }
    return ret;
}

-(NSArray*)safe_arrayByRemoveObjects:(NSArray *)otherArray
{
    NSArray *ret = self;
    if (otherArray &&otherArray.count>0 &&self.count>0) {
        NSMutableArray *temp = [ret mutableCopy];
        [temp safe_removeObjectsInArray:otherArray];
        ret = [NSArray arrayWithArray:temp];
    }
    return ret;
}

-(NSArray*)safe_arrayByRemoveNullObjects
{
    NSArray *ret = self;
    if (self.count>0) {
        NSMutableArray *temp = [ret mutableCopy];
        for (id obj in self) {
            if (![obj isKindOfClass:[NSNull class]]) {
                [temp safe_addObject:obj];
            }
        }
        ret = [NSArray arrayWithArray:temp];
    }
    return ret;
}

-(int)safe_intAtIndex:(NSInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    VALUE(obj, intValue, intValue);
    
    return 0;
}

-(long)safe_longAtIndex:(NSInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    VALUE(obj, longValue, integerValue);

    return 0;
}

-(long long)safe_longlongAtIndex:(NSInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    VALUE(obj, longLongValue, longLongValue);
    
    return 0;
}

-(BOOL)safe_containsObject:(id)anObject
{
    if (anObject&&self.count>0&&![anObject isKindOfClass:[NSNull class]]) {
        return [self containsObject:anObject];
    }
    return NO;
}

-(BOOL)safe_containsObjectsArray:(NSArray *)otherArray
{
    if (self.count>0 && otherArray.count>0&&[otherArray isKindOfClass:[NSArray class]]) {
        
        NSSet *set = [NSSet setWithArray:self];
        NSSet *set2 = [NSSet setWithArray:otherArray];
        return ([set2 isSubsetOfSet:set]);
        
    }
    return NO;

}

-(NSData*)toJSONData
{
    NSData *ret = nil;
    NSError *err = nil;
    ret = [NSJSONSerialization dataWithJSONObject:self
                                          options:0
                                            error:&err];
    if (err)
    {
        ret = nil;
    }
    return (ret);
}

@end

@implementation NSMutableArray (Safe)

- (BOOL)safe_addObject:(id)anObject
{
    if (anObject&&![anObject isKindOfClass:[NSNull class]]) {
        [self addObject:anObject];
        return YES;
    }
    return NO;
}

- (BOOL)safe_addObjectsFromArray:(NSArray*)otherArray
{
    if (otherArray && [otherArray isKindOfClass:[NSArray class]] && (otherArray.count > 0)) {
        [self addObjectsFromArray:otherArray];
        return YES;
    }
    return NO;
}

- (BOOL)safe_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= self.count) {
        [self insertObject:anObject atIndex:index];
        return YES;
    }
    return NO;
}

- (BOOL)safe_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
    if (idx1 < self.count && idx2 < self.count) {
        [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
        return YES;
    }
    return NO;
}

- (BOOL)safe_removeLastObject
{
    if (self.count > 0) {
        [self removeLastObject];
        return YES;
    }
    return NO;
}

- (BOOL)safe_removeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
        return YES;
    }
    return NO;
}

- (BOOL)safe_removeObject:(id)anObject
{
    if (anObject&&self.count>0) {
        [self removeObject:anObject];
        return YES;
    }
    return NO;
}

- (BOOL)safe_removeObject:(id)anObject inRange:(NSRange)range
{
    NSUInteger index = range.location + range.length;
    if (anObject && index < self.count) {
        [self removeObject:anObject inRange:range];
        return YES;
    }
    return NO;
}


-(BOOL)safe_removeObjectsInArray:(NSArray *)otherArray
{
    if (otherArray&&[otherArray isKindOfClass:[NSArray class] ]&&otherArray.count>0) {
        [self removeObjectsInArray:otherArray];
        return YES;
    }
    return NO;
}

-(BOOL)safe_removeObjectsInRange:(NSRange)range
{
    NSInteger index = range.location+range.length;
    if (self.count>0&&index<self.count) {
        [self removeObjectsInRange:range];
        return YES;
    }
    return NO;
}

- (BOOL)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index < self.count && anObject) {
        [self replaceObjectAtIndex:index withObject:anObject];
        return YES;
    }
    return NO;
}

@end
