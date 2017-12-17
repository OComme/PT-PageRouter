//
//  PublicModalRouter.m
//  PT-PrefixHeaderDemo
//
//  Created by BlanBok on 2017/12/17.
//  Copyright © 2017年 OComme. All rights reserved.
//

#import "PublicModalRouter.h"

@implementation PublicModalRouter

+ (void)OpenUrlWithModalType:(PublicModalRouterType *)modalType DataEntity:(NSDictionary *)entity Animated:(BOOL)animated
{
    [PTPublicPageRouter OpenUrl:[self Get_urlWithType:modalType] FormData:entity Animated:animated];
}

+ (NSURL*)Get_urlWithType:(NSString*)modalType
{
    NSArray *array = [modalType componentsSeparatedByString:@"&"];
    NSArray *keyArray = @[PTPublicPageRouterKeyClass,PTPublicPageRouterKeyPath];
    NSString *resultStr = @"?";
    for (NSUInteger idx = 0; idx < MIN(array.count, keyArray.count); idx ++) {
        resultStr = [resultStr stringByAppendingFormat:@"%@%@=%@",(resultStr.length == 1)?@"":@"&",keyArray[idx],array[idx]];
    }
    NSString *path = [[NSBundle mainBundle]pathForResource:@"RouterForm" ofType:@"plist"];
    resultStr = [path stringByAppendingString:resultStr];
    
    return [NSURL URLWithString:[resultStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
}


@end
