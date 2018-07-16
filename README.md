# PT-PageRouter

使用`PTPageRouter`

首先需要创建一张注册了页面信息的表单（规范页面跳转时的信息传递，方便组件化的开发）
```Objective-C
/*
 example Dict
 <dict>
 
 <!--介绍信息-->
 <key>descrip</key>
 <string>关于页面的详细介绍</string>
 <key>synopsis</key>
 <string>简介</string>
 <key>name</key>
 <string>类名</string>
 
 <!--必填参数-->
 <key>keys_require</key>
 <dict>
 <key>key</key>
 <string>关于“key”的介绍</string>
 </dict>
 
 <!--选填参数-->
 <key>keys_option</key>
 <dict>
 <key>key</key>
 <string>关于“key”的介绍</string>
 </dict>
 </dict>
 */
 ```
 
 然后将传入的数据转换成页面配置的模型`PTPageModel`（使用子类继承）后,经`PTPageRouter`转换成目标控制器
 
 ```Objective-C
 /**
 get <UIViewController *> from <PTPageModel *> and <NSDictionary *>
 */
+ (UIViewController *_Nullable)PT_getViewControllerForPageModel:(PTPageModel<PTPageModelProtocol> *_Nonnull)pageModel FormData:(NSDictionary *_Nullable)formData;

/**
 get <UIViewController *> from <PTPageModel *> and nil
 */
+ (UIViewController *_Nullable)PT_getViewControllerForPageModel:(PTPageModel<PTPageModelProtocol> *_Nonnull)pageModel;
 ```

当取得目标控制器的实例，就可以在自己的方法里开始跳转。
