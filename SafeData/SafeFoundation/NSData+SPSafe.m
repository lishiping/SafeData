//
//  NSData+SPSafe.m
//  SafeData
//
//  Created by uxin-lishiping on 2017/7/27.
//  Copyright © 2017年 lishiping. All rights reserved.
//


#define SP_IS_KIND_OF(obj, cls) [(obj) isKindOfClass:[cls class]]

#if DEBUG

#define SP_LOG(...) NSLog(__VA_ARGS__)

#define SP_ASSERT(obj)               assert((obj)) //断言实例对象

#define SP_ASSERT_CLASS(obj, cls)  SP_ASSERT((obj) && SP_IS_KIND_OF(obj,cls))//断言实例有值和类型


#else

#define SP_LOG(...)

#define SP_ASSERT(obj)

#define SP_ASSERT_CLASS(obj, cls)

#endif


#import "NSData+SPSafe.h"

@implementation NSData (SPSafe)

-(nullable id)safe_JSONObj
{
    return [self safe_JSONObj_options:NSJSONReadingMutableContainers];
}

-(nullable id)safe_JSONObj_options:(NSJSONReadingOptions)opt
{
    SP_ASSERT_CLASS(self,NSData);
    
    id ret = nil;
    if (SP_IS_KIND_OF(self, NSData) && self.length>0) {
        NSError *error;
        ret = [NSJSONSerialization JSONObjectWithData:self options:opt error:&error];
        
        if (error) {
            ret = nil;
            SP_ASSERT(!error);
            SP_LOG(@"JSON to object error %@",error);
        }
    }
    return ret;
}

- (nullable NSString *)safe_stringJSONObj
{
    id ret = [self safe_JSONObj];
    if (SP_IS_KIND_OF(ret, NSString)) {
        return ret;
    }
    return nil;
}

- (nullable NSArray *)safe_arrayJSONObj
{
    id ret = [self safe_JSONObj];
    if (SP_IS_KIND_OF(ret, NSArray)) {
        return ret;
    }
    return nil;
}

- (nullable NSDictionary *)safe_dictionaryJSONObj
{
    id ret = [self safe_JSONObj];
    if (SP_IS_KIND_OF(ret, NSDictionary)) {
        return ret;
    }
    return nil;
}

- (nullable NSNumber *)safe_numberJSONObj
{
    id ret = [self safe_JSONObj];
    if (SP_IS_KIND_OF(ret, NSNumber)) {
        return ret;
    }
    return nil;
}

- (nullable NSData *)safe_JSONDataFromObject:(id _Nonnull)obj
{
    SP_ASSERT(obj);
    
    NSData *ret = nil;
    NSError *err = nil;
    ret = [NSJSONSerialization dataWithJSONObject:obj
                                          options:0
                                            error:&err];
    if (err)
    {
        SP_LOG(@"Object to JsonData Error:%@",err);
        ret = nil;
    }
    return (ret);
}

@end
