//
//  NSMutableArray+SPSafe.h
//  SafeData
//
//  Created by shiping li on 2018/4/19.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+SPSafe.h"

@interface NSMutableArray (SPSafe)

/********safe add method***/

- (BOOL)safe_addObject:(id)anObject;

- (BOOL)safe_addObjectsFromArray:(NSArray*)otherArray;

- (BOOL)safe_insertObject:(id)anObject atIndex:(NSUInteger)index;

- (BOOL)safe_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;

- (BOOL)safe_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

- (BOOL)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;


/********safe remove method***/

- (BOOL)safe_removeLastObject;

- (BOOL)safe_removeObjectAtIndex:(NSInteger)index;

- (BOOL)safe_removeObject:(id)anObject;

- (BOOL)safe_removeObject:(id)anObject inRange:(NSRange)range;

- (BOOL)safe_removeObjectsInArray:(NSArray*)otherArray;

- (BOOL)safe_removeObjectsInRange:(NSRange)range;

#pragma mark - feed流数据模型使用
/**
 1. The variable array in the new array do line of heavy processing method (excluding the same model data)
 2. The type of array elements must be NSDictionary
 3. According to the dictionary only fields (e.g., userid) determine whether array element model for the same data
 4. Usually applies to APP access network data do heavy processing
 5. The only field is int, long and other types of data when applicable
 @ param newArray new array, the array element is a dictionary
 @ param longKey array element can be judged from the NSDictionary in the fields of data modelCheck data element is NSDictionary
 
 1.可变数组加入新数组的时候做排重处理的方法(排除相同模型的数据)（适用于网络获取数据加到数据流场景的时候使用）
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
 1. The variable array in the new array do line of heavy processing method (excluding the same model data)
 2. The type of array elements must be NSDictionary
 3. The only fields according to the dictionary (for example: UUID) determine whether array element model for the same data
 4. Usually applies to APP access network data do heavy processing
 5. The only field is nsstrings type data when applicable
 @ param newArray new array, the array element is a dictionary
 @ param longKey array element can be judged from the NSDictionary in the fields of data modelCheck data element is NSDictionary
 
 1.可变数组加入新数组的时候做排重处理的方法(排除相同模型的数据)（适用于网络获取数据加到数据流场景的时候使用）
 2.数组元素必须是NSDictionary类型
 3.根据字典中的唯一字段（例如：UUID）判断数组元素模型是否为相同数据，
 4.通常适用于APP获取网络数据做排重处理
 5.唯一字段是NSString类型数据的时候适用
 @param newArray 新数组，数组元素是字典
 @param stringKey 数组元素内NSDictionary中可以判断唯一数据模型的字段
 @return 检查数据元素是否是NSDictionary
 */
- (BOOL)safe_addObjectsByRemoveRepeatWithNewArray:(NSArray<NSDictionary*>*)newArray stringKey:(NSString*)stringKey;

/**
 1. New array is inserted into the array variable when I was in the front of the line of heavy processing method (applicable to the network to get the data to the data flow using the front of the scene)
 2. The type of array elements must be NSDictionary
 3. The only fields according to the dictionary (for example: UUID) determine whether array element model for the same data
 4. Usually applies to APP access network data do heavy processing
 5. The only field is int, long and other types of data when applicable
 @ param newArray new array, the array element is a dictionary
 @ param longKey array element can be judged from the NSDictionary in the fields of data modelCheck data element is NSDictionary
 
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
 1. New array is inserted into the array variable when I was in the front of the line of heavy processing method (applicable to the network to get the data to the data flow using the front of the scene)
 2. The type of array elements must be NSDictionary
 3. The only fields according to the dictionary (for example: UUID) determine whether array element model for the same data,
 4. Usually applies to APP access network data do heavy processing
 5. The only field is nsstrings type data when applicable
 @ param newArray new array, the array element is a dictionary
 @ param stringKey array element can be judged from the NSDictionary in the fields of data modelCheck data element is NSDictionary
 
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

@end
