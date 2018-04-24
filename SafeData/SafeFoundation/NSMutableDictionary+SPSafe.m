//
//  NSMutableDictionary+SPSafe.m
//  SafeData
//
//  Created by shiping li on 2018/4/20.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import "NSMutableDictionary+SPSafe.h"
#import "SPSafeDataMacro.h"

@implementation NSMutableDictionary (SPSafe)

- (BOOL)safe_setObject:(id)anObject forKey:(id)aKey
{
    SP_ASSERT(aKey);
    
    if (aKey)
    {
        @synchronized (self)
        {
            if (anObject)
            {
                [self setObject:anObject forKey:aKey];
                return YES;
            }
            //如果anObject设置为nil代表移除该键值对
            else if([self safe_objectForKey:aKey])
            {
                [self removeObjectForKey:aKey];
            }
        }
    }
    return NO;
}

- (BOOL)safe_setString:(NSString *)anObject forKey:(id)aKey
{
    SP_ASSERT_CLASS(anObject, NSString);
    SP_ASSERT(aKey);
    
    if (SP_IS_KIND_OF(anObject, NSString))
    {
        return [self safe_setObject:anObject forKey:aKey];
    }
    else if(SP_IS_KIND_OF(anObject, NSNumber))
    {
        return [self safe_setObject:[(NSNumber*)anObject stringValue] forKey:aKey];
    }
    else
    {
        return [self safe_setObject:nil forKey:aKey];
    }
}

- (BOOL)safe_addEntriesFromDictionary:(nullable NSDictionary *)otherDictionary
{
    SP_ASSERT_CLASS(otherDictionary,NSDictionary);
    
    if (SP_IS_KIND_OF(otherDictionary, NSDictionary) && otherDictionary.allKeys.count>0)
    {
        @synchronized (self)
        {
            [self addEntriesFromDictionary:otherDictionary];
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)safe_setDictionary:(NSDictionary *)otherDictionary
{
    SP_ASSERT_CLASS(otherDictionary,NSDictionary);
    
    if (SP_IS_KIND_OF(otherDictionary, NSDictionary) && otherDictionary.allKeys.count>0)
    {
        @synchronized (self)
        {
            [self setDictionary:otherDictionary];
            return YES;
        }
    }
    
    return NO;
}


- (BOOL)safe_removeObjectForKey:(id)aKey
{
    SP_ASSERT(self.allKeys.count>0);
    SP_ASSERT(aKey);
    
    if([self safe_objectForKey:aKey])
    {
        @synchronized (self)
        {
            [self removeObjectForKey:aKey];
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)safe_removeAllObjects
{
    SP_ASSERT(self.allKeys.count>0);

    if(self.allKeys.count>0)
    {
        @synchronized (self)
        {
            [self removeAllObjects];
            return YES;
        }
    }
    
    return NO;
}

@end

