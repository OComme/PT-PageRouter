//
//  PTPageRouter.h
//  PT-PageRouterDemo
//
//  Created by Mac on 2018/7/16.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//  converter

#import <UIKit/UIKit.h>
#import "PTPageModel.h"

@protocol PTPageRouterDrotocol <NSObject>

@optional
/**
basic data Configure
*/
- (void)router_setFormData:(NSDictionary*_Nonnull)formData;

@end

@interface PTPageRouter : NSObject

/**
 get <UIViewController *> from <PTPageModel *> and <NSDictionary *>
 */
+ (UIViewController *_Nullable)Router_getViewControllerForPageModel:(PTPageModel *_Nonnull)pageModel FormData:(NSDictionary *_Nullable)formData;

/**
 get <UIViewController *> from <PTPageModel *> and nil
 */
+ (UIViewController *_Nullable)Router_getViewControllerForPageModel:(PTPageModel *_Nonnull)pageModel;

@end
