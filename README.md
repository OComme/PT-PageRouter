# PT-PrefixHeader

`PTDefineHeader`，引入常用的自定义方法

```Objective-C
#import "PTDefineHeader.h"
```

`PTPublicPageRouter`，用以跳转页面

```Objective-C
#import "PTPublicPageRouter.h"

/**
 通过本地路径实现跳转
 
 @param url 传入路径
 @param formData 附加数据
 @param animated 是否显示跳转动画
 */
+ (void)OpenUrl:(NSURL*_Nonnull)url FormData:(NSDictionary*_Nullable)formData  Animated:(BOOL)animated;
```
 
 
