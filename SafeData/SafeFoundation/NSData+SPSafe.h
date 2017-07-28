//
//  NSData+SPSafe.h
//  SafeData
//
//  Created by uxin-lishiping on 2017/7/27.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SPSafe)

/********safe get object From JSONData method***/
//本类是方便JSON数据直接转为对象类型

// get object
- (nullable id)safe_JSONObj;

- (nullable id)safe_JSONObj_options:(NSJSONReadingOptions)opt;

// get string or nil
- (nullable NSString *)safe_stringJSONObj;

// get array or nil
- (nullable NSArray *)safe_arrayJSONObj;

// get dictionary or nil
- (nullable NSDictionary *)safe_dictionaryJSONObj;

// get number or nil
- (nullable NSNumber *)safe_numberJSONObj;

// get JSONdata from oc object
- (nullable NSData *)safe_JSONDataFromObject:(id _Nonnull)obj;

@end
