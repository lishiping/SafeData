//
//  NSData+SPSafe.m
//  e-mail:83118274@qq.com
//
//  Created by lishiping on 16/11/11.
//  Copyright (c) 2016年 lishiping. All rights reserved.
//
//If you think this open source library is of great help to you, please open the URL to click the Star,your approbation can encourage me, the author will publish the better open source library for guys again
//如果您认为本开源库对您很有帮助，请打开URL给作者点个赞，您的认可给作者极大的鼓励，作者还会发布更好的开源库给大家

//github address//https://github.com/lishiping/SPWebView
//github address//https://github.com/lishiping/SPDebugBar
//github address//https://github.com/lishiping/SPFastPush
//github address//https://github.com/lishiping/SPMacro
//github address//https://github.com/lishiping/SafeData
//github address//https://github.com/lishiping/SPCategory/
//github address//https://github.com/lishiping/SPBaseClass


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
    if (SP_IS_KIND_OF(self, NSData) && self.length>0)
    {
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

+ (NSData*)safe_JSONDataFromObject:(id)obj
{
    SP_ASSERT(obj);
    
    NSData *ret = nil;
    NSError *err = nil;
    if (obj) {
        ret = [NSJSONSerialization dataWithJSONObject:obj
                                              options:0
                                                error:&err];
    }
    if (err)
    {
        SP_LOG(@"Object to JsonData Error:%@",err);
        ret = nil;
    }
    return (ret);
}

-(NSString *)safe_getJSONString_NSUTF8StringEncoding
{
    return [self safe_getJSONStringWithEncoding:NSUTF8StringEncoding];
}

-(NSString *)safe_getJSONStringWithEncoding:(NSStringEncoding)encoding
{
    SP_ASSERT_CLASS(self,NSData);
    
    NSString *ret = nil;
    
    if (SP_IS_KIND_OF(self, NSData) && self.length > 0) {
        ret = [[NSString alloc] initWithData:self encoding:encoding];
    }
    return ret;
}

@end
