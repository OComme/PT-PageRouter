
//
//  PTPageModel.m
//  PT-PageRouterDemo
//
//  Created by Mac on 2018/7/14.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "PTPageModel.h"

@implementation PTPageModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert([self isMemberOfClass:[PTPageModel class]] == NO, @"PTPageModel cannot be used directly as an abstract class ");
        NSAssert([self conformsToProtocol:@protocol(PTPageModelProtocol)] && [self respondsToSelector:@selector(pt_upDatePageInfo)], ([NSString stringWithFormat:@"%@ need follow the jump protocol PTPageModelProtocol",self.class]));
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
