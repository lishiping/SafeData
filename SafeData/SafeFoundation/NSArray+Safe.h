//
//  NSArray+Safe.h
//  e-mail:83118274@qq.com
//  Created by lishiping on 16/9/19.
//  Copyright © 2016年 lishiping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSDictionary+Safe.h"

@interface NSArray (Safe)

/********safe get method***/

- (id)safe_objectAtIndex:(NSUInteger)index;

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

/**
 *  @author lishiping, 16-09-07 16:09:27
 
 * Return an array containing the results of invoking -valueForKey: on each of the receiver's elements. The returned array will contain NSNull elements for each instance of -valueForKey: returning nil.
 */
/*该方法是取出数组中元素为字典的某一个字段再组成数组返回，例如当前数组元素是一个学生信息的字典包含，姓名，电话，学号，通过调用，[studentArray safe_valueForKey:@"name"]; 取出所有该数组中学生的姓名，然后组成一个数组返回，实现原理为KVC
 **/
- (NSArray *)safe_valueForKey:(NSString *)key;

/****safe remove method***/

- (NSArray*)safe_arrayByRemoveObject:(id)anObject;

- (NSArray*)safe_arrayByRemoveObjects:(NSArray*)otherArray;

- (NSArray*)safe_arrayByRemoveNullObjects;

/****is Contain method***/

- (BOOL)safe_containsObject:(id)anObject;

- (BOOL)safe_containsObjectsArray:(NSArray *)otherArray;

/**
 1.判断数组中是否存在相同元素
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段long类型（例如：userid）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据模型做判断
 5.唯一字段是long整型数据的时候适用
 @param newDic 需要判断的数据模型
 @param longKey 唯一字段
 @return 是否存在
 */
- (BOOL)safe_iSExistObject:(NSDictionary*)newDic longKey:(NSString*)longKey;

/**
 1.判断数组中是否存在相同元素
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段字符串类型（例如：UUID）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据模型做判断
 5.唯一字段是NSString类型数据的时候适用
 @param newDic 需要判断的数据模型
 @param stringKey 唯一字段
 @return 是否存在
 */
- (BOOL)safe_iSExistObject:(NSDictionary*)newDic stringKey:(NSString*)stringKey;

/****get JSON  Data method***/

- (NSData *)toJSONData;

@end

@interface NSMutableArray (Safe)

/********safe add method***/

- (BOOL)safe_addObject:(id)anObject;

- (BOOL)safe_addObjectsFromArray:(NSArray*)otherArray;

- (BOOL)safe_insertObject:(id)anObject atIndex:(NSUInteger)index;

- (BOOL)safe_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

- (BOOL)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

/**
 1.可变数组加入新数组的时候做排重处理的方法
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段（例如：userid）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据做排重处理
 5.唯一字段是int，long等类型数据的时候适用
 @param newArray 新数组，数组元素是字典
 @param longKey 数组元素内NSDictionary中可以判断唯一数据模型的字段
 @return 检查数据元素是否是NSDictionary
 */
- (BOOL)safe_addObjectsByRemoveRepeatWithNewArray:(NSArray<NSDictionary*>*)newArray longKey:(NSString*)longKey;

/**
 1.可变数组加入新数组的时候做排重处理的方法
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段（例如：UUID）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据做排重处理
 5.唯一字段是NSString类型数据的时候适用
 @param newArray 新数组，数组元素是字典
 @param longKey 数组元素内NSDictionary中可以判断唯一数据模型的字段
 @return 检查数据元素是否是NSDictionary
 */
- (BOOL)safe_addObjectsByRemoveRepeatWithNewArray:(NSArray<NSDictionary*>*)newArray stringKey:(NSString*)stringKey;

/**
 1.新数组的插入到可变数组的最前面的时候做排重处理的方法（适用于网络获取数据加到数据流的最前面场景的时候使用）
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段（例如：UUID）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据做排重处理
 5.唯一字段是int，long等类型数据的时候适用
 @param newArray 新数组，数组元素是字典
 @param longKey 数组元素内NSDictionary中可以判断唯一数据模型的字段
 @return 检查数据元素是否是NSDictionary
 */
- (BOOL)safe_insertObjectsAtHeadByRemoveRepeatWithNewArray:(NSArray<NSDictionary*>*)newArray longKey:(NSString*)longKey;

/**
 1.新数组的插入到可变数组的最前面的时候做排重处理的方法（适用于网络获取数据加到数据流的最前面场景的时候使用）
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段（例如：UUID）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据做排重处理
 5.唯一字段是NSString类型数据的时候适用
 @param newArray 新数组，数组元素是字典
 @param stringKey 数组元素内NSDictionary中可以判断唯一数据模型的字段
 @return 检查数据元素是否是NSDictionary
 */
- (BOOL)safe_insertObjectsAtHeadByRemoveRepeatWithNewArray:(NSArray<NSDictionary*>*)newArray stringKey:(NSString*)stringKey;


/********safe remove method***/

- (BOOL)safe_removeLastObject;

- (BOOL)safe_removeObjectAtIndex:(NSUInteger)index;

- (BOOL)safe_removeObject:(id)anObject;

- (BOOL)safe_removeObject:(id)anObject inRange:(NSRange)range;

- (BOOL)safe_removeObjectsInArray:(NSArray*)otherArray;

- (BOOL)safe_removeObjectsInRange:(NSRange)range;


@end
