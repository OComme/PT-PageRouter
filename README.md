# PT-PageRouter

使用`PTPageRouter`是为了：

- 解耦页面跳转（方便组件化开发）
- 规范跳转时的信息传递

其使用需要创建一张注册了页面配置信息的表单，表单中的页面需遵循`PTPageRouterDrotocol`协议以标识其为`Router`的参与者

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

传入的数据被转换成页面配置的模型`PTPageModel`（子类）后,`PTPageRouter`使用这个配置模型生成目标控制器

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

拿到目标控制器实例，就可以在自己的方法里实现跳转及相关逻辑了。
