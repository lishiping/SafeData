//
//  NSArray+Safe.h
//
//  Created by lishiping on 16/9/19.
//  Copyright © 2016年 uxin-lishiping. All rights reserved.
//



#define VALUE(value, func1, func2)  {\
\
if ([value isKindOfClass:[NSNumber class]]) {\
return ([(NSNumber *)value func1]);\
} else if ([value isKindOfClass:[NSString class]]) {\
return ([(NSString *)value func2]);\
}\
}


#import <Foundation/Foundation.h>

@interface NSArray (Safe)

/********safe get method***/

- (id)safe_objectAtIndex:(NSInteger)index;

- (NSString*)safe_stringAtIndex:(NSInteger)index;

- (NSDictionary*)safe_dictionaryAtIndex:(NSInteger)index;

- (NSArray*)safe_arrayAtIndex:(NSInteger)index;

- (NSData*)safe_dataAtIndex:(NSInteger)index;

- (int)safe_intAtIndex:(NSInteger)index;

- (long)safe_longAtIndex:(NSInteger)index;

- (long long)safe_longlongAtIndex:(NSInteger)index;

- (id)safe_getFirstObject;

- (id)safe_getLastObject;

/**
 *  @author lishiping, 16-09-07 16:09:27

* Return an array containing the results of invoking -valueForKey: on each of the receiver's elements. The returned array will contain NSNull elements for each instance of -valueForKey: returning nil.
*/
/*该方法是取出数组中元素为字典的某一个字段再组成数组返回，例如当前数组元素是一个学生信息的字典包含，姓名，电话，学号，通过调用，[studentArray safe_valueForKey:@"name"]; 取出所有该数组中学生的姓名，然后组成一个数组返回
**/
- (NSArray *)safe_valueForKey:(NSString *)key;

/****safe remove method***/

- (NSArray*)safe_arrayByRemoveObject:(id)anObject;

- (NSArray*)safe_arrayByRemoveObjects:(NSArray*)otherArray;

- (NSArray*)safe_arrayByRemoveNullObjects;

/****is Contain method***/

- (BOOL)safe_containsObject:(id)anObject;

- (BOOL)safe_containsObjectsArray:(NSArray *)otherArray;

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

/********safe remove method***/

- (BOOL)safe_removeLastObject;

- (BOOL)safe_removeObjectAtIndex:(NSUInteger)index;

- (BOOL)safe_removeObject:(id)anObject;

- (BOOL)safe_removeObject:(id)anObject inRange:(NSRange)range;

- (BOOL)safe_removeObjectsInArray:(NSArray*)otherArray;

- (BOOL)safe_removeObjectsInRange:(NSRange)range;


@end
