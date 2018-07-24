//
//  ViewController.m
//  PT-PageRouterDemo
//
//  Created by admin on 2017/12/18.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "ViewController.h"
#import "MyPageRouter.h"

@interface ViewController ()<PTPageRouterProtocol>

@end

@implementation ViewController

- (void)pt_setFormData:(NSDictionary *)formData
{
    self.title = formData[@"title"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
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
- (void)event_modal:(id)sender {
    
    UIViewController *resultVc = [MyPageRouter PT_getViewControllerFromKeyPath:@"TestModule/home" FormData:@{@"title":@"MMP"}];
    [self.navigationController pushViewController:resultVc animated:YES];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
