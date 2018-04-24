#pod 'SafeData',                   # 加入SafeData

create category to protect array data and dictionary data To prevent the crash


#本开源库非常实用

V1.0.0 全新改版新增加NSObject的类别为了数组和字典的类型判断，防止假类型数据使用字典和数组类别崩溃问题

关于数组
1.检查数据类型保护数组防止插入空数组，防止数组越界。
2.取出数组元素并判断类型，返回是否是想要的类型，如果是则返回，不是想要的类型返回nil
3.在feed流数据的应用场景下，加入排重数组内数据模型相同的内容，（feed流数据模型如果返回重复的，则使用排重方法去除重复数据）
4.扩展了不可变数组直接可以增加和删除元素
5.扩展了可变数组的线程安全方法
6.使用KVC扩展了数组中直接取出元素字段的值组成数组，具体看代码NSArray+SPSafe.h,line65
7.得到JSONdata或者JSONdata的字符串

关于字典
1.取出字典value并判断类型，返回是否是想要的类型，如果是则返回，不是想要的类型返回nil
2.扩展了嵌套取出字典value值，NSDictionary+SPSafe.h,line86
3.扩展了可变字典的线程安全方法
4.得到JSONdata或者JSONdata的字符串

关于Data
1.扩展了jsondata直接转为OC对象，并判断类型是否是想要的类型
2.扩展了jsondata编码转为字符串方法

