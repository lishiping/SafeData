//
//  NSObject+SPArraySafe.h
//  SafeData
//
//  Created by shiping li on 2018/4/15.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (SPArraySafe)

//由于之前写了NSArray+SPSafe类别是为了使用数组的时候方便转化类型，并防止崩溃，但是实际运用当中发现了问题，并不能防止崩溃，因为如果实际对象不是数组，但是如果以数组类型修饰的变量可以使用数组的类别方法，在调用类别方法的时候会崩溃，所以为了保护崩溃问题，增加了以NSObject类型的判断

//本类是数组安全方便的使用，方便直接转化为要使用的的对象等
/******** get method***/

- (id)sp_arrayObjectAtIndex:(NSInteger)index;

- (NSString*)sp_arrayStringAtIndex:(NSUInteger)index;

- (NSDictionary*)sp_arrayDictionaryAtIndex:(NSUInteger)index;

- (NSArray*)sp_arrayArrayAtIndex:(NSUInteger)index;

- (UIImage*)sp_arrayImageAtIndex:(NSUInteger)index;

- (NSData*)sp_arrayDataAtIndex:(NSUInteger)index;

- (NSInteger)sp_arrayIntegerAtIndex:(NSUInteger)index;

- (int)sp_arrayIntAtIndex:(NSUInteger)index;

- (long)sp_arrayLongAtIndex:(NSUInteger)index;

- (long long)sp_arrayLonglongAtIndex:(NSUInteger)index;

- (double)sp_arrayDoubleAtIndex:(NSUInteger)index;

- (float)sp_arrayFloatAtIndex:(NSUInteger)index;

- (id)sp_arrayFirstObject;

- (id)sp_arrayLastObject;

- (NSUInteger)sp_arrayIndexByObject:(id)object;

/****fast remove method***/

- (NSArray*)sp_arrayRemoveObject:(id)anObject;

- (NSArray*)sp_arrayRemoveObjects:(NSArray*)otherArray;

- (NSArray*)sp_arrayRemoveNullObjects;

- (NSArray*)sp_arrayRemoveLastObject;

- (NSArray*)sp_arrayRemoveFirstObject;

- (NSArray*)sp_arrayRemoveObjectAtIndex:(NSUInteger)index;

- (NSArray*)sp_arrayRemoveObject:(id)anObject inRange:(NSRange)range;

-(NSArray*)sp_arrayRemoveObjectsInRange:(NSRange)range;

/****fast add method***/

- (NSArray*)sp_arrayAddObject:(id)anObject;

- (NSArray*)sp_arrayAddObjects:(NSArray*)array;

/********change method***/

- (NSArray*)sp_subarrayWithRange:(NSRange)range;

- (NSArray*)sp_arrayInsertObject:(id)anObject atIndex:(NSUInteger)index;

- (NSArray*)sp_arrayInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;

- (NSArray*)sp_arrayExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

- (NSArray*)sp_arrayReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

/****is Contain method***/

-(BOOL)sp_arrayContainsObject:(id)anObject;

-(BOOL)sp_arrayContainsObjectsArray:(NSArray *)otherArray;

/**
 *  @author lishiping, 16-09-07 16:09:27
 
 * Return an array containing the results of invoking -valueForKey: on each of the receiver's elements. The returned array will contain NSNull elements for each instance of -valueForKey: returning nil.The principle of KVC
 */
/*该方法是取出数组中元素为字典的某一个字段再组成数组返回，例如当前数组元素是一个学生信息的字典包含，姓名，电话，学号，通过调用，[studentArray sp_arrayValueForKey:@"name"]; 取出所有该数组中学生的姓名，然后组成一个数组返回，实现原理为KVC
 **/
- (NSArray *)sp_arrayValueForKey:(NSString *)key;

/****get JSON  Data method***/

//得到jsondata
- (NSData *)sp_arrayToJSONData;

//得到jsondata的编码字符串
-(NSString *)sp_arrayToJSONString_UTF8;

//得到jsondata的编码字符串（自定义编码）
-(NSString *)sp_arrayToJSONStringWithEncoding:(NSStringEncoding)encoding;

@end
