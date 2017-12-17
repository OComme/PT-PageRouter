//
//  ViewController.m
//  PT-PrefixHeaderDemo
//
//  Created by BlanBok on 2017/12/17.
//  Copyright © 2017年 OComme. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)router_setParamentDict:(NSDictionary *)dict
{
    self.title = dict[@"title"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self add_button];
    
    
}

- (void)add_button
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(event_modal:) forControlEvents:UIControlEventTouchUpInside];
}


/**
 点击跳转
 */
- (IBAction)event_modal:(id)sender {
    [PublicModalRouter OpenUrlWithModalType:PublicModalRouterModuleTestHome DataEntity:@{@"title":@"MMP"} Animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
