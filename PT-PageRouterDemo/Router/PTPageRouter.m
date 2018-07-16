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

@end

@implementation PTPageRouter

+ (UIViewController *)Router_getViewControllerForPageModel:(PTPageModel *)pageModel
{
    return [self Router_getViewControllerForPageModel:pageModel FormData:nil];
}

+ (UIViewController *)Router_getViewControllerForPageModel:(PTPageModel *)pageModel FormData:(NSDictionary *)formData
{
    PTPageRouter *router = [PTPageRouter new];
    router.pageModel    = pageModel;
    router.formData     = formData;
    
    BOOL enable = [router check_pageConfigureAvailability] && [router check_formDataAvailability];
    if (enable == NO) {
        return nil;
    }
    UIViewController <PTPageRouterDrotocol>* vc = [NSClassFromString(router.pageModel.name)new];
    if ([vc respondsToSelector:@selector(router_setFormData:)] && formData) {
        [vc router_setFormData:router.formData];
    }
    return vc;
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
        methodAvailability  = ([vcClass conformsToProtocol:@protocol(PTPageRouterDrotocol)]);
    }
    NSAssert(classAvailability, ([NSString stringWithFormat:@"%@ Class name unavailable",self.pageModel.synopsis]));
    NSAssert(methodAvailability, ([NSString stringWithFormat:@"%@ does not follow the jump protocol PTPageRouterDrotocol",self.pageModel.synopsis]));

    return classAvailability && methodAvailability;
}

/**
 Check the data form
 */
- (BOOL)check_formDataAvailability
{
    if (self.pageModel.keys_require == nil && self.pageModel.keys_options == nil) {
        NSAssert(self.formData == nil, ([NSString stringWithFormat:@"%@ contains an unallowed key",self.pageModel.synopsis]));
        return (self.formData == nil);
    }
    NSAssert(self.formData, ([NSString stringWithFormat:@"%@ doesn't contain the necessary keys",self.pageModel.synopsis]));
    if (self.formData == nil) {
        return NO;
    }

    BOOL enable = YES;
    NSSet <NSString *>* keysSet = [NSSet setWithArray:self.formData.allKeys];
    if (self.pageModel.keys_options != nil && self.pageModel.keys_require != nil) {
        NSMutableArray *keysAll = [NSMutableArray new];
        [keysAll addObjectsFromArray:self.pageModel.keys_options];
        [keysAll addObjectsFromArray:self.pageModel.keys_require];
        enable = [keysSet isSubsetOfSet:[NSSet setWithArray:keysAll]];
        NSAssert(enable, ([NSString stringWithFormat:@"%@ contains an unallowed key",self.pageModel.synopsis]));
    }else if (self.pageModel.keys_require) {
        enable = [[NSSet setWithArray:self.pageModel.keys_require] isSubsetOfSet:keysSet];
        NSAssert(enable, ([NSString stringWithFormat:@"%@ doesn't contain the necessary keys",self.pageModel.synopsis]));
    }
    
    return enable;
}

@end
