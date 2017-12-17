//
//  PublicModalRouter.h
//  PT-PrefixHeaderDemo
//
//  Created by BlanBok on 2017/12/17.
//  Copyright © 2017年 OComme. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString PublicModalRouterType;


#pragma mark-testModule
///经纪人列表
static NSString *const _Nullable PublicModalRouterModuleTestHome          =\
                                @"ViewController&TestModule/home";

@interface PublicModalRouter : NSObject

/**
 跳转目标控制器
 
 @param modalType 类名+数据路径
 @param entity 配置参数
 @param animated 是否显示跳转动画
 */
+ (void)OpenUrlWithModalType:(PublicModalRouterType*_Nonnull)modalType DataEntity:(NSDictionary*_Nonnull)entity Animated:(BOOL)animated;

@end
