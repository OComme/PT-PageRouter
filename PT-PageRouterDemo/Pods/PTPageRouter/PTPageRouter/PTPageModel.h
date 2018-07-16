//
//  PTPageModel.h
//  PT-PageRouterDemo
//
//  Created by Mac on 2018/7/14.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//
//  Page configuration model

#import <Foundation/Foundation.h>

@protocol PTPageModelProtocol <NSObject>

/**
 Get the page model from the path in the form data
 */
- (void)pt_upDatePageInfo;

@end

@interface PTPageModel : NSObject

/**
 The page describes the path of information in the form
 */
@property (nonnull,nonatomic,copy) NSString *path;

/**
 class name
 */
@property (nonnull,nonatomic,copy) NSString *name;

/**
 synopsis string
 */
@property (nonnull,nonatomic,copy) NSString *synopsis;

/**
 description string
 */
@property (nonnull,nonatomic,copy) NSString *descrip;

/**
 Form data must configured keys
 */
@property (nullable,nonatomic,copy) NSDictionary <NSString *,id>*keys_require;

/**
 Form data selects configured keys
 */
@property (nullable,nonatomic,copy) NSDictionary <NSString *,id>*keys_option;


@end
