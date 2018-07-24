//
//  MyPageRouter.m
//  PT-PageRouterDemo
//
//  Created by Mac on 2018/7/24.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "MyPageRouter.h"

@implementation MyPageRouter

- (NSString *)pt_getPageFormPath
{
    return [[NSBundle mainBundle]pathForResource:@"RouterForm" ofType:@"plist"];
}

@end
