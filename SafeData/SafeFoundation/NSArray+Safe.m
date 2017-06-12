//
//  NSArray+Safe.m
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/9/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//

#define SAFE_VALUE(value, func1, func2)  {\
\
if ([value isKindOfClass:[NSNumber class]]) {\
return ([(NSNumber *)value func1]);\
} else if ([value isKindOfClass:[NSString class]]) {\
return ([(NSString *)value func2]);\
}\
}



#import "NSArray+Safe.h"

@implementation NSArray (Safe)

- (id)safe_objectAtIndex:(NSInteger)index
{
    if (SP_IS_KINDOF(self, NSArray) && index<self.count && index>=0) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSString*)safe_stringAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if ([obj isKindOfClass:[NSString class]]) {
        return (obj);
    }
    return nil;
}

- (NSDictionary*)safe_dictionaryAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (obj);
    }
    return nil;
}

- (NSArray*)safe_arrayAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if ([obj isKindOfClass:[NSArray class]]) {
        return (obj);
    }
    return nil;
}

- (UIImage*)safe_imageAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if ([obj isKindOfClass:[UIImage class]]) {
        return (obj);
    }
    return nil;
}

- (NSData*)safe_dataAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    if ([obj isKindOfClass:[NSData class]]) {
        return (obj);
    }
    return nil;
}

- (NSInteger)safe_integerAtIndex:(NSUInteger)index;
{
    id obj = [self safe_objectAtIndex:index];
    SAFE_VALUE(obj, integerValue, integerValue);
    
    return 0;
}

-(int)safe_intAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SAFE_VALUE(obj, intValue, intValue);
    
    return 0;
}

-(long)safe_longAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SAFE_VALUE(obj, longValue, integerValue);
    
    return 0;
}

-(long long)safe_longlongAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SAFE_VALUE(obj, longLongValue, longLongValue);
    
    return 0;
}

-(double)safe_doubleAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SAFE_VALUE(obj, doubleValue, doubleValue);
    
    return 0.0f;
}

-(float)safe_floatAtIndex:(NSUInteger)index
{
    id obj = [self safe_objectAtIndex:index];
    
    SAFE_VALUE(obj, floatValue, floatValue);
    
    return 0.0f;
}

- (id)safe_getFirstObject
{
    if (self.count>0) {
        return [self safe_objectAtIndex:0];
    }
    return nil;
}

- (id)safe_getLastObject
{
    
    if (self.count>0) {
        return [self safe_objectAtIndex:self.count-1];
    }
    return nil;
}

-(NSArray*)safe_valueForKey:(NSString *)key
{
    if (!SP_IS_KINDOF(self, NSArray) || key.length < 1)
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
    if (SP_IS_KINDOF(self, NSArray) && anObject && self.count>0) {
        NSMutableArray *temp = [ret mutableCopy];
        [temp safe_removeObject:anObject];
        ret = [NSArray arrayWithArray:temp];
    }
    return ret;
}

-(NSArray*)safe_arrayByRemoveObjects:(NSArray *)otherArray
{
    NSArray *ret = self;
    if (SP_IS_KINDOF(self, NSArray) &&SP_IS_KINDOF(otherArray, NSArray)  && otherArray.count>0 && self.count>0)
    {
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
        [temp enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSNull class]]) {
                [temp safe_removeObject:obj];
            }
        }];
        ret = [NSArray arrayWithArray:temp];
    }
    return ret;
}

-(NSArray*)safe_arrayByAddObject:(id)anObject
{
    NSArray *ret = self;
    if (SP_IS_KINDOF(self, NSArray) && anObject && self.count>0) {
        NSMutableArray *temp = [ret mutableCopy];
        [temp safe_addObject:anObject];
        ret = [NSArray arrayWithArray:temp];
    }
    return ret;
}

-(NSArray*)safe_arrayByAddObjects:(NSArray *)array
{
    NSArray *ret = self;
    if (SP_IS_KINDOF(self, NSArray) &&SP_IS_KINDOF(array, NSArray)  && array.count>0 && self.count>0)
    {
        NSMutableArray *temp = [ret mutableCopy];
        [temp safe_addObjectsFromArray:array];
        ret = [NSArray arrayWithArray:temp];
    }
    return ret;
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
    if (self.count>0 && otherArray.count>0&&SP_IS_KINDOF(self, NSArray)&&SP_IS_KINDOF(otherArray, NSArray)) {
        
        NSSet *set = [NSSet setWithArray:self];
        NSSet *set2 = [NSSet setWithArray:otherArray];
        return ([set2 isSubsetOfSet:set]);
        
    }
    return NO;
    
}

-(BOOL)safe_iSExistObject:(NSDictionary *)newDic longKey:(NSString *)longKey
{
    if (newDic && [newDic isKindOfClass:[NSDictionary class]] && longKey.length>0)
    {
        for (NSDictionary *obj1 in self)
        {
            //找到字典里面以唯一id为标识的字段相比较
            long oldid  = [obj1 safe_longForKey:longKey];
            long newid  = [newDic safe_longForKey:longKey];
            if (newid == oldid) {
                return YES;
            }
        }
    }
    return NO;
}

-(BOOL)safe_iSExistObject:(NSDictionary *)newDic stringKey:(NSString *)stringKey
{
    if (newDic && [newDic isKindOfClass:[NSDictionary class]] && stringKey.length>0)
    {
        for (NSDictionary *obj1 in self) {
            //找到字典里面以唯一字符串为标识的字段相比较
            NSString *oldStr  = [obj1 safe_stringForKey:stringKey];
            NSString *newStr  = [newDic safe_stringForKey:stringKey];
            if ([newStr isEqualToString:oldStr]) {
                return YES;
            }
        }
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
        NSLog(@"NSArraytoJsonDataError:%@",err.description);
        ret = nil;
    }
    return (ret);
}

@end

@implementation NSMutableArray (Safe)

- (BOOL)safe_addObject:(id)anObject
{
    if (SP_IS_KINDOF(self, NSMutableArray) && anObject&&![anObject isKindOfClass:[NSNull class]]) {
        @synchronized (self) {
            [self addObject:anObject];
            return YES;
        }
    }
    return NO;
}

- (BOOL)safe_addObjectsFromArray:(NSArray*)otherArray
{
    if (SP_IS_KINDOF(self, NSMutableArray) && [otherArray isKindOfClass:[NSArray class]] && (otherArray.count > 0)) {
        @synchronized (self) {
            [self addObjectsFromArray:otherArray];
            return YES;
        }
    }
    return NO;
}

- (BOOL)safe_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (SP_IS_KINDOF(self, NSMutableArray) && anObject && index <= self.count) {
        @synchronized (self) {
            [self insertObject:anObject atIndex:index];
            return YES;
        }
    }
    return NO;
}

- (BOOL)safe_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    if (SP_IS_KINDOF(self, NSMutableArray) &&SP_IS_KINDOF(objects, NSArray)  && indexes) {
        @synchronized (self) {
            [self insertObjects:objects atIndexes:indexes];
            return YES;
        }
    }
    return NO;
}

- (BOOL)safe_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
    if (SP_IS_KINDOF(self, NSMutableArray) && idx1 < self.count && idx2 < self.count && idx1!=idx2) {
        @synchronized (self) {
            [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
            return YES;
        }
    }
    return NO;
}

- (BOOL)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (SP_IS_KINDOF(self, NSMutableArray) && index < self.count && anObject) {
        @synchronized (self) {
            [self replaceObjectAtIndex:index withObject:anObject];
            return YES;
        }
    }
    return NO;
}

-(BOOL)safe_addObjectsByRemoveRepeatWithNewArray:(NSArray<NSDictionary *> *)newArray longKey:(NSString *)longKey
{
    for (NSDictionary *dic in newArray) {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            return NO;
        }
    }
    
    for (NSDictionary *dic in self) {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            return NO;
        }
    }
    
    //由于for in 在遍历的时候不能更改数组，所以使用系统提供的遍历方法
    //遍历删除旧数据里面和新数据重复的数据
    [self enumerateObjectsUsingBlock:^(NSDictionary *obj1, NSUInteger idx, BOOL * _Nonnull stop) {
        //找到字典里面以唯一id为标识的字段相比较
        long oldid  = [obj1 safe_longForKey:longKey];
        
        [newArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop) {
            long newid  = [obj2 safe_longForKey:longKey];
            if (newid == oldid) {
                [self removeObject:obj1];
            }
        }];
    }];
    
    //新数据加入到旧数据尾部
    return  [self safe_addObjectsFromArray:newArray];
}

-(BOOL)safe_addObjectsByRemoveRepeatWithNewArray:(NSArray<NSDictionary *> *)newArray stringKey:(NSString *)stringKey
{
    for (NSDictionary *dic in newArray) {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            return NO;
        }
    }
    
    for (NSDictionary *dic in self) {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            return NO;
        }
    }
    
    //遍历删除旧数据里面和新数据重复的数据
    [self enumerateObjectsUsingBlock:^(NSDictionary *obj1, NSUInteger idx, BOOL * _Nonnull stop) {
        //找到字典里面以唯一字符串为标识的字段相比较
        NSString *oldStr  = [obj1 safe_stringForKey:stringKey];
        
        [newArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *newStr  = [obj2 safe_stringForKey:stringKey];
            if ([newStr isEqualToString:oldStr]) {
                [self removeObject:obj1];
            }
        }];
    }];
    
    //新数据加入到旧数据尾部
    return  [self safe_addObjectsFromArray:newArray];
}

-(BOOL)safe_insertObjectsAtHeadByRemoveRepeatWithNewArray:(NSArray<NSDictionary *> *)newArray longKey:(NSString *)longKey
{
    for (NSDictionary *dic in newArray) {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            return NO;
        }
    }
    
    for (NSDictionary *dic in self) {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            return NO;
        }
    }
    
    //由于for in 在遍历的时候不能更改数组，所以使用系统提供的遍历方法
    //遍历删除旧数据里面和新数据重复的数据
    [self enumerateObjectsUsingBlock:^(NSDictionary *obj1, NSUInteger idx, BOOL * _Nonnull stop) {
        //找到字典里面以唯一id为标识的字段相比较
        long oldid  = [obj1 safe_longForKey:longKey];
        
        [newArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop) {
            long newid  = [obj2 safe_longForKey:longKey];
            if (newid == oldid) {
                [self removeObject:obj1];
            }
        }];
    }];
    
    //新数据加入到旧数据前部
    if (newArray.count>0) {
        NSIndexSet* indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newArray.count)];
        [self safe_insertObjects:newArray atIndexes:indexSet];
        return YES;
    }
    return NO;
}


-(BOOL)safe_insertObjectsAtHeadByRemoveRepeatWithNewArray:(NSArray<NSDictionary *> *)newArray stringKey:(NSString *)stringKey
{
    for (NSDictionary *dic in newArray) {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            return NO;
        }
    }
    
    for (NSDictionary *dic in self) {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            return NO;
        }
    }
    
    //遍历删除旧数据里面和新数据重复的数据
    [self enumerateObjectsUsingBlock:^(NSDictionary *obj1, NSUInteger idx, BOOL * _Nonnull stop) {
        //找到字典里面以唯一字符串为标识的字段相比较
        NSString *oldStr  = [obj1 safe_stringForKey:stringKey];
        
        [newArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *newStr  = [obj2 safe_stringForKey:stringKey];
            if ([newStr isEqualToString:oldStr]) {
                [self removeObject:obj1];
            }
        }];
    }];
    
    //新数据加入到旧数据前部
    if (newArray.count>0) {
        NSIndexSet* indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newArray.count)];
        [self safe_insertObjects:newArray atIndexes:indexSet];
        return YES;
    }
    return NO;
}



#pragma mark - safe_remove
- (BOOL)safe_removeLastObject
{
    if (SP_IS_KINDOF(self, NSMutableArray) && self.count > 0) {
        
        @synchronized (self) {
            [self removeLastObject];
            return YES;
        }
    }
    return NO;
}

- (BOOL)safe_removeObjectAtIndex:(NSUInteger)index
{
    if (SP_IS_KINDOF(self, NSMutableArray) && index < self.count) {
       
        @synchronized (self) {
            [self removeObjectAtIndex:index];
            return YES;
        }
    }
    return NO;
}

- (BOOL)safe_removeObject:(id)anObject
{
    if (SP_IS_KINDOF(self, NSMutableArray) && self.count>0 && anObject) {
        @synchronized (self) {
            [self removeObject:anObject];
            return YES;
        }
    }
    return NO;
}

- (BOOL)safe_removeObject:(id)anObject inRange:(NSRange)range
{
    NSUInteger index = range.location + range.length;
    if (SP_IS_KINDOF(self, NSMutableArray) &&self.count>0 && index<self.count && anObject) {
       
        @synchronized (self) {
            [self removeObject:anObject inRange:range];
            return YES;
        }
    }
    return NO;
}

-(BOOL)safe_removeObjectsInArray:(NSArray *)otherArray
{
    if (SP_IS_KINDOF(self, NSMutableArray) && SP_IS_KINDOF(otherArray, NSArray) &&self.count>0 && otherArray.count>0) {
        @synchronized (self) {
            [self removeObjectsInArray:otherArray];
            return YES;
        }
    }
    return NO;
}

-(BOOL)safe_removeObjectsInRange:(NSRange)range
{
    NSUInteger index = range.location+range.length;
    if (SP_IS_KINDOF(self, NSMutableArray) && self.count>0 && index<self.count) {
        
        @synchronized (self) {
            [self removeObjectsInRange:range];
            return YES;
        }
    }
    return NO;
}



@end
