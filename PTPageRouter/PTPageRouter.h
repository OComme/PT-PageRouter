//
//  PTPageRouter.h
//  PT-PageRouterDemo
//
//  Created by Mac on 2018/7/16.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//  converter

#import <UIKit/UIKit.h>
#import "PTPageModel.h"

@protocol PTPageFormProtocol <NSObject>

/**
 Get the page form path from subclass
 */
- (NSString *_Nullable)pt_getPageFormPath;

@end

@protocol PTPageRouterProtocol <NSObject>

@optional
/**
basic data Configure
*/
- (void)pt_setFormData:(NSDictionary*_Nonnull)formData;

@end

@interface PTPageRouter : NSObject

/**
 get <UIViewController *> from keyPath and <NSDictionary *>formData
 */
+ (UIViewController *_Nullable)PT_getViewControllerFromKeyPath:(NSString *_Nonnull)keyPath FormData:(NSDictionary *_Nullable)formData;

/**
 get <UIViewController *> from keyPath and nil
 */
+ (UIViewController *_Nullable)PT_getViewControllerFromKeyPath:(NSString *_Nonnull)keyPath;

@end
