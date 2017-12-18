//
//  PublicPageRouter.h
//  PT-PageRouterDemo
//
//  Created by admin on 2017/12/18.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTPublicPageRouter.h"

typedef NSString PublicPageRouterType;


#pragma mark-testModule
///经纪人列表
static NSString *const _Nullable PublicPageRouterModuleTestHome          =\
@"ViewController&TestModule/home";

@interface PublicPageRouter : NSObject

/**
 跳转目标控制器
 
 @param modalType 类名+数据路径
 @param entity 配置参数
 @param animated 是否显示跳转动画
 */
+ (void)OpenUrlWithModalType:(PublicPageRouterType*_Nonnull)modalType DataEntity:(NSDictionary*_Nonnull)entity Animated:(BOOL)animated;


@end
