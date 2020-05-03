//
//  NSArray+SPSafe.h
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/9/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//

//If you think this open source library is of great help to you, please open the URL to click the Star,your approbation can encourage me, the author will publish the better open source library for guys again
//如果您认为本开源库对您很有帮助，请打开URL给作者点个赞，您的认可给作者极大的鼓励，作者还会发布更好的开源库给大家

//github address//https://github.com/lishiping/SPWebView
//github address//https://github.com/lishiping/SPDebugBar
//github address//https://github.com/lishiping/SPFastPush
//github address//https://github.com/lishiping/SPMacro
//github address//https://github.com/lishiping/SafeData
//github address//https://github.com/lishiping/SPCategory
//github address//https://github.com/lishiping/SPBaseClass

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSArray (SPSafe)

//本类是数组安全方便的使用，方便直接转化为要使用的的对象等
/********safe get method***/


- (id)safe_objectAtIndex:(NSInteger)index;

- (NSString*)safe_stringAtIndex:(NSUInteger)index;

- (NSDictionary*)safe_dictionaryAtIndex:(NSUInteger)index;

- (NSArray*)safe_arrayAtIndex:(NSUInteger)index;

- (UIImage*)safe_imageAtIndex:(NSUInteger)index;

- (NSData*)safe_dataAtIndex:(NSUInteger)index;

- (NSInteger)safe_integerAtIndex:(NSUInteger)index;

- (int)safe_intAtIndex:(NSUInteger)index;

- (long)safe_longAtIndex:(NSUInteger)index;

- (long long)safe_longlongAtIndex:(NSUInteger)index;

- (double)safe_doubleAtIndex:(NSUInteger)index;

- (float)safe_floatAtIndex:(NSUInteger)index;

- (id)safe_getFirstObject;

- (id)safe_getLastObject;

- (NSUInteger)safe_getIndexByObject:(id)object;

/****fast safe remove method***/

- (NSArray*)safe_arrayByLastObject;

- (NSArray*)safe_arrayByFirstObject;

- (NSArray*)safe_arrayByRemoveAtIndex:(NSInteger)index;

- (NSArray*)safe_arrayByRemoveObject:(id)anObject;

- (NSArray*)safe_arrayByRemoveObjects:(NSArray*)otherArray;

- (NSArray*)safe_arrayByRemoveNullObjects;

- (NSArray*)safe_subarrayWithRange:(NSRange)range;

/****fast safe add method***/

- (NSArray*)safe_arrayByAddObject:(id)anObject;

- (NSArray*)safe_arrayByAddObjects:(NSArray*)array;

/****is Contain method***/

- (BOOL)safe_containsObject:(id)anObject;

- (BOOL)safe_containsObjectsArray:(NSArray *)otherArray;


/**
 *  @author lishiping, 16-09-07 16:09:27
 
 * Return an array containing the results of invoking -valueForKey: on each of the receiver's elements. The returned array will contain NSNull elements for each instance of -valueForKey: returning nil.The principle of KVC
 */
/*该方法是取出数组中元素为字典的某一个字段再组成数组返回，例如当前数组元素是一个学生信息的字典包含，姓名，电话，学号，通过调用，[studentArray safe_valueForKey:@"name"]; 取出所有该数组中学生的姓名，然后组成一个数组返回，实现原理为KVC
 **/
- (NSArray *)safe_valueForKey:(NSString *)key;



/****get JSON  Data method***/

//得到jsondata
- (NSData *)safe_toJSONData;

//得到jsondata的编码字符串
-(NSString *)safe_toJSONString_UTF8;

//得到jsondata的编码字符串（自定义编码）
-(NSString *)safe_toJSONStringWithEncoding:(NSStringEncoding)encoding;

/**
 1. Determine whether there is a same element in an array model
 2. The type of array elements must be NSDictionary
 3. According to the dictionary only field long type (for example: userid) determine whether array element model for the same data
 4. Usually applies to the judge for APP access to the network data model
 5. The only field is the long integer data when applicable
 @ param newDic need judgment data model
 @ param longKey only fields
 @ return exists
 
 1.判断数组中是否存在相同元素模型
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段long类型（例如：userid）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据模型做判断
 5.唯一字段是long整型数据的时候适用
 @param newDic 需要判断的数据模型
 @param longKey 唯一字段
 @return 是否存在
 */
- (BOOL)safe_isExistObject:(NSDictionary*)newDic longKey:(NSString*)longKey;

/**
 1. Determine whether there is a same element in an array model
 2. The type of array elements must be NSDictionary
 3. Depending on the type of the field only string in the dictionary (for example: UUID) determine whether array element model for the same data,
 4. Usually applies to the judge for APP access to the network data model
 5. The only field is nsstrings type data when applicable
 @ param newDic need judgment data model
 @ param stringKey only fields
 @ return exists
 
 1.判断数组中是否存在相同元素模型
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段字符串类型（例如：UUID）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据模型做判断
 5.唯一字段是NSString类型数据的时候适用
 @param newDic 需要判断的数据模型
 @param stringKey 唯一字段
 @return 是否存在
 */
- (BOOL)safe_isExistObject:(NSDictionary*)newDic stringKey:(NSString*)stringKey;

@end


