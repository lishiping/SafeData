//
//  SPSafeDataMacro.h
//  SafeData
//
//  Created by shiping li on 2018/4/20.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#ifndef SPSafeDataMacro_h
#define SPSafeDataMacro_h


#endif /* SPSafeDataMacro_h */

#ifndef SP_SAFE_VALUE//(value, func1, func2)
#define SP_SAFE_VALUE(value, func1, func2)  {\
\
if ([value isKindOfClass:[NSNumber class]]) {\
return ([(NSNumber *)value func1]);\
} else if ([value isKindOfClass:[NSString class]]) {\
return ([(NSString *)value func2]);\
}\
}
#endif

#ifndef SP_IS_KIND_OF//(obj, cls)
#define SP_IS_KIND_OF(obj, cls) [(obj) isKindOfClass:[cls class]] //类型判断
#endif

#if DEBUG

#ifndef SP_LOG//(...)
#define SP_LOG(...) NSLog(__VA_ARGS__)
#endif

#ifndef SP_ASSERT//(obj)
#define SP_ASSERT(obj)               assert((obj)) //断言实例对象
#endif

#ifndef SP_ASSERT_CLASS//(obj, cls)
#define SP_ASSERT_CLASS(obj, cls)  SP_ASSERT((obj) && SP_IS_KIND_OF(obj,cls))//断言实例有值和类型
#endif

#else

#ifndef SP_LOG
#define SP_LOG(...)
#endif

#ifndef SP_ASSERT
#define SP_ASSERT(obj)
#endif

#ifndef SP_ASSERT_CLASS
#define SP_ASSERT_CLASS(obj, cls)
#endif

#endif

#ifndef SP_VALUE_FOR_KEY
#define SP_VALUE_FOR_KEY(key, func1, func2)  {\
if (![self isKindOfClass:[NSDictionary class]]||!key) {\
return (0.0f);\
}\
id _ret = [self objectForKey:key];\
if ([_ret isKindOfClass:[NSNumber class]]) {\
return ([(NSNumber *)_ret func1]);\
} else if ([_ret isKindOfClass:[NSString class]]) {\
return ([(NSString *)_ret func2]);\
}\
}
#endif


