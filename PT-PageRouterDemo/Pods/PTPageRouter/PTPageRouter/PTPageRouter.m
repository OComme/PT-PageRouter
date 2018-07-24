//
//  PTPageRouter.m
//  PT-PageRouterDemo
//
//  Created by Mac on 2018/7/16.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "PTPageRouter.h"

@interface PTPageRouter ()

/**
 Page jump configuration
 */
@property (nonnull,nonatomic,strong) PTPageModel *pageModel;

@property (nullable,nonatomic,copy) NSDictionary *formData;

@property (nonnull,nonatomic,copy) NSString *formPath;

@end

@implementation PTPageRouter

+ (UIViewController *)PT_getViewControllerFromKeyPath:(NSString *)keyPath
{
    return [self PT_getViewControllerFromKeyPath:keyPath FormData:nil];
}

+ (UIViewController *)PT_getViewControllerFromKeyPath:(NSString *)keyPath FormData:(NSDictionary *)formData
{
    PTPageRouter *router = [self new];
    router.pageModel = [router produce_pageModelWithKeyPath:keyPath];
    NSAssert(router.pageModel, @"Key Path unAviable");
    
    router.formData  = formData;
    
    BOOL enable = [router check_pageConfigureAvailability] && [router check_formDataAvailability];
    if (enable == NO) {
        return nil;
    }
    UIViewController <PTPageRouterProtocol>* vc = [NSClassFromString(router.pageModel.name)new];
    if ([vc respondsToSelector:@selector(pt_setFormData:)] && formData) {
        [vc pt_setFormData:router.formData];
    }
    return vc;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert([self isMemberOfClass:[PTPageRouter class]] == NO, @"PTPageRouter cannot be used directly as an abstract class ");
        NSAssert([self conformsToProtocol:@protocol(PTPageFormProtocol)] && [self respondsToSelector:@selector(pt_getPageFormPath)], ([NSString stringWithFormat:@"%@ need follow the form protocol PTPageFormProtocol",self.class]));
        _formPath = [(id<PTPageFormProtocol>)self pt_getPageFormPath];
        
        NSAssert(_formPath && [[NSFileManager defaultManager] fileExistsAtPath:_formPath], @"The PTPageFormProtocol callback cannot be empty");
    }
    return self;
}

/**
 Check the page configuration
 */
- (BOOL)check_pageConfigureAvailability
{
    Class vcClass = NSClassFromString(self.pageModel.name);
    BOOL classAvailability  = (vcClass != nil);
    BOOL methodAvailability = NO;
    if (classAvailability) {
        methodAvailability  = ([vcClass conformsToProtocol:@protocol(PTPageRouterProtocol)]);
    }
    NSAssert(classAvailability, ([NSString stringWithFormat:@"%@ Class name unavailable",self.pageModel.synopsis]));
    NSAssert(methodAvailability, ([NSString stringWithFormat:@"%@ need follow the jump protocol PTPageRouterProtocol",self.pageModel.synopsis]));

    return classAvailability && methodAvailability;
}

/**
 Check the data form
 */
- (BOOL)check_formDataAvailability
{
    if (self.pageModel.keys_require == nil && self.pageModel.keys_option == nil) {
        NSAssert(self.formData == nil, ([NSString stringWithFormat:@"%@ doesn't contains an unallowed key",self.pageModel.synopsis]));
        return (self.formData == nil);
    }
    NSAssert(self.formData, ([NSString stringWithFormat:@"%@ need contain the necessary keys",self.pageModel.synopsis]));
    if (self.formData == nil) {
        return NO;
    }

    BOOL enable = YES;
    NSSet <NSString *>* keysSet = [NSSet setWithArray:self.formData.allKeys];
    if (self.pageModel.keys_option != nil && self.pageModel.keys_require != nil) {
        NSMutableArray *keysAll = [NSMutableArray new];
        [keysAll addObjectsFromArray:self.pageModel.keys_option.allKeys];
        [keysAll addObjectsFromArray:self.pageModel.keys_require.allKeys];
        enable = [keysSet isSubsetOfSet:[NSSet setWithArray:keysAll]];
        NSAssert(enable, ([NSString stringWithFormat:@"%@ doesn't contains an unallowed key",self.pageModel.synopsis]));
    }else if (self.pageModel.keys_require) {
        enable = [[NSSet setWithArray:self.pageModel.keys_require.allKeys] isSubsetOfSet:keysSet];
        NSAssert(enable, ([NSString stringWithFormat:@"%@ need contain the necessary keys",self.pageModel.synopsis]));
    }
    
    return enable;
}

- (PTPageModel *)produce_pageModelWithKeyPath:(NSString *)path
{
    if (path.length == 0) {
        return nil;
    }
    NSArray *keyArray = [path componentsSeparatedByString:@"/"];
    NSDictionary *formData = [NSDictionary dictionaryWithContentsOfFile:self.formPath];
    
    for (NSString *key in keyArray) {
        if ([formData[key] isKindOfClass:[NSDictionary class]] == NO) {
            return  nil;
        }
        formData = formData[key];
    }
    PTPageModel *pageModel = [PTPageModel new];
    [pageModel setValuesForKeysWithDictionary:formData];
    return pageModel;
}

@end
