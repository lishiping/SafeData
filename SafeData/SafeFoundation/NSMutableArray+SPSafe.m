//
//  NSMutableArray+SPSafe.m
//  SafeData
//
//  Created by shiping li on 2018/4/19.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import "NSMutableArray+SPSafe.h"
#import "NSDictionary+SPSafe.h"
#import "SPSafeDataMacro.h"

@implementation NSMutableArray (SPSafe)

- (BOOL)safe_addObject:(id)anObject
{
    SP_ASSERT(anObject);
    
    if (anObject)
    {
        @synchronized (self)
        {
            @try {
                [self addObject:anObject];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

- (BOOL)safe_addObjectsFromArray:(NSArray*)otherArray
{
    SP_ASSERT_CLASS(otherArray,NSArray);
    
    if (SP_IS_KIND_OF(otherArray, NSArray) && (otherArray.count > 0))
    {
        @synchronized (self) {
            @try {
                [self addObjectsFromArray:otherArray];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"error:%@", exception);
            } @finally {
            }
        }
    }
    
    return NO;
}

- (BOOL)safe_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    SP_ASSERT(anObject);
    SP_ASSERT(index>=0);
    
    if (anObject && index <= self.count) {
        @synchronized (self) {
            @try {
                [self insertObject:anObject atIndex:index];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

- (BOOL)safe_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    SP_ASSERT_CLASS(objects,NSArray);
    SP_ASSERT_CLASS(indexes,NSIndexSet);
    
    if (SP_IS_KIND_OF(objects, NSArray)  && indexes)
    {
        @synchronized (self) {
            @try {
                [self insertObjects:objects atIndexes:indexes];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

- (BOOL)safe_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
    SP_ASSERT(self.count>0);
    SP_ASSERT(idx1>=0);
    SP_ASSERT(idx2>=0);
    
    if (idx1 < self.count && idx2 < self.count && idx1!=idx2)
    {
        @synchronized (self)
        {
            @try {
                [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
                 return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

- (BOOL)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    SP_ASSERT(self.count>0);
    SP_ASSERT(index>=0);
    SP_ASSERT(anObject);
    
    if (index < self.count && anObject)
    {
        @synchronized (self)
        {
            @try {
                [self replaceObjectAtIndex:index withObject:anObject];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

#pragma mark - safe_remove
- (BOOL)safe_removeLastObject
{
    SP_ASSERT(self.count>0);
    
    if (self.count > 0)
    {
        @synchronized (self)
        {
            @try {
                [self removeLastObject];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"remove error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

- (BOOL)safe_removeObjectAtIndex:(NSInteger)index
{
    SP_ASSERT(self.count>0);
    SP_ASSERT(index>=0);
    
    if (index < self.count &&index>=0)
    {
        @synchronized (self)
        {
            @try {
                [self removeObjectAtIndex:index];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"remove error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

- (BOOL)safe_removeObject:(id)anObject
{
    SP_ASSERT(anObject);
    SP_ASSERT(self.count>0);
    
    if (self.count>0 && anObject)
    {
        @synchronized (self)
        {
            @try {
                [self removeObject:anObject];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"remove error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

- (BOOL)safe_removeObject:(id)anObject inRange:(NSRange)range
{
    SP_ASSERT(self.count>0);
    SP_ASSERT(anObject);

    NSUInteger index = range.location + range.length;
    if (self.count>0 && index<self.count && anObject)
    {
        @synchronized (self) 
        {
            @try {
                [self removeObject:anObject inRange:range];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"remove error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

-(BOOL)safe_removeObjectsInArray:(NSArray *)otherArray
{
    SP_ASSERT_CLASS(otherArray,NSArray);
    SP_ASSERT(self.count>0);
    
    if (self.count>0 && SP_IS_KIND_OF(otherArray, NSArray) && otherArray.count>0)
    {
        @synchronized (self)
        {
            @try {
                [self removeObjectsInArray:otherArray];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"remove error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

-(BOOL)safe_removeObjectsInRange:(NSRange)range
{
    SP_ASSERT(self.count>0);
    
    NSUInteger index = range.location+range.length;
    if (self.count>0 && index<self.count)
    {
        @synchronized (self)
        {
            @try {
                [self removeObjectsInRange:range];
                return YES;
            } @catch (NSException *exception) {
                SP_LOG(@"remove error:%@", exception);
            } @finally {
            }
        }
    }
    return NO;
}

#pragma mark - feed流数据模型使用
-(BOOL)safe_addObjectsByRemoveRepeatWithNewArray:(NSArray<NSDictionary *> *)newArray longKey:(NSString *)longKey
{
    SP_ASSERT_CLASS(newArray,NSArray);
    SP_ASSERT_CLASS(longKey,NSString);
    
    if (!SP_IS_KIND_OF(newArray, NSArray) || !SP_IS_KIND_OF(longKey, NSString))
    {
        return NO;
    }
    //由于for in 在遍历的时候不能更改数组，所以使用系统提供的枚举器遍历方法
    //遍历删除旧数据里面和新数据重复的数据，因为新数据才是最新的
    
    __block BOOL ret = NO;
    
    [newArray enumerateObjectsUsingBlock:^(NSDictionary *obj1, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (SP_IS_KIND_OF(obj1, NSDictionary))
        {
            //找到字典模型里面以唯一id为标识的字段相比较
            long newid  = [obj1 safe_longForKey:longKey];
            
            [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (SP_IS_KIND_OF(obj2, NSDictionary)) {
                    long oldid  = [obj2 safe_longForKey:longKey];
                    if (newid == oldid) {
                        [self safe_removeObject:obj2];
                    }
                    
                }else
                {
                    ret = YES;
                    *stop = YES;
                }
            }];
        }
        else
        {
            ret = YES;
            *stop = YES;
        }
    }];
    
    //如果不是元素不是字典类型，就不会再添加
    if (ret) {
        return NO;
    }
    //新数据加入到旧数据尾部
    return  [self safe_addObjectsFromArray:newArray];
}

-(BOOL)safe_addObjectsByRemoveRepeatWithNewArray:(NSArray<NSDictionary *> *)newArray stringKey:(NSString *)stringKey
{
    SP_ASSERT_CLASS(newArray,NSArray);
    SP_ASSERT_CLASS(stringKey,NSString);
    
    if (!SP_IS_KIND_OF(newArray, NSArray) || !SP_IS_KIND_OF(stringKey, NSString))
    {
        return NO;
    }
    //由于for in 在遍历的时候不能更改数组，所以使用系统提供的枚举器遍历方法
    //遍历删除旧数据里面和新数据重复的数据，因为新数据才是最新的
    
    __block BOOL ret = NO;
    
    [newArray enumerateObjectsUsingBlock:^(NSDictionary *obj1, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (SP_IS_KIND_OF(obj1, NSDictionary))
        {
            //找到字典模型里面以唯一id为标识的字段相比较
            NSString *newStr  = [obj1 safe_stringForKey:stringKey];
            
            [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (SP_IS_KIND_OF(obj2, NSDictionary))
                {
                    
                    NSString *oldStr  = [obj2 safe_stringForKey:stringKey];
                    if ([newStr isEqualToString:oldStr]) {
                        [self safe_removeObject:obj2];
                    }
                    
                }else
                {
                    ret = YES;
                    *stop = YES;
                }
            }];
        }
        else
        {
            ret = YES;
            *stop = YES;
        }
    }];
    
    //如果元素不是字典类型，就不会再添加
    if (ret) {
        return NO;
    }
    //新数据加入到旧数据尾部
    return  [self safe_addObjectsFromArray:newArray];
}

-(BOOL)safe_insertObjectsAtHeadByRemoveRepeatWithNewArray:(NSArray<NSDictionary *> *)newArray longKey:(NSString *)longKey
{
    SP_ASSERT_CLASS(newArray,NSArray);
    SP_ASSERT_CLASS(longKey,NSString);
    
    if (!SP_IS_KIND_OF(newArray, NSArray) || !SP_IS_KIND_OF(longKey, NSString))
    {
        return NO;
    }
    //由于for in 在遍历的时候不能更改数组，所以使用系统提供的枚举器遍历方法
    //遍历删除旧数据里面和新数据重复的数据，因为新数据才是最新的
    
    __block BOOL ret = NO;
    
    [newArray enumerateObjectsUsingBlock:^(NSDictionary *obj1, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (SP_IS_KIND_OF(obj1, NSDictionary))
        {
            //找到字典模型里面以唯一id为标识的字段相比较
            long newid  = [obj1 safe_longForKey:longKey];
            
            [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (SP_IS_KIND_OF(obj2, NSDictionary)) {
                    long oldid  = [obj2 safe_longForKey:longKey];
                    if (newid == oldid) {
                        [self safe_removeObject:obj2];
                    }
                    
                }else
                {
                    ret = YES;
                    *stop = YES;
                }
            }];
        }
        else
        {
            ret = YES;
            *stop = YES;
        }
    }];
    
    //如果元素不是字典类型，就不会再添加
    if (ret) {
        return NO;
    }
    
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
    SP_ASSERT_CLASS(newArray,NSArray);
    SP_ASSERT_CLASS(stringKey,NSString);
    
    if (!SP_IS_KIND_OF(newArray, NSArray) || !SP_IS_KIND_OF(stringKey, NSString))
    {
        return NO;
    }
    //由于for in 在遍历的时候不能更改数组，所以使用系统提供的枚举器遍历方法
    //遍历删除旧数据里面和新数据重复的数据，因为新数据才是最新的
    
    __block BOOL ret = NO;
    
    [newArray enumerateObjectsUsingBlock:^(NSDictionary *obj1, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (SP_IS_KIND_OF(obj1, NSDictionary))
        {
            //找到字典模型里面以唯一id为标识的字段相比较
            NSString *newStr  = [obj1 safe_stringForKey:stringKey];
            
            [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (SP_IS_KIND_OF(obj2, NSDictionary))
                {
                    
                    NSString *oldStr  = [obj2 safe_stringForKey:stringKey];
                    if ([newStr isEqualToString:oldStr]) {
                        [self safe_removeObject:obj2];
                    }
                    
                }else
                {
                    ret = YES;
                    *stop = YES;
                }
            }];
        }
        else
        {
            ret = YES;
            *stop = YES;
        }
    }];
    
    //如果元素不是字典类型，就不会再添加
    if (ret) {
        return NO;
    }
    
    //新数据加入到旧数据前部
    if (newArray.count>0) {
        NSIndexSet* indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newArray.count)];
        [self safe_insertObjects:newArray atIndexes:indexSet];
        return YES;
    }
    return NO;
}

@end
