//
//  CPLoginViewController.m
//  CalendarPlan
//
//  Created by lmg on 2018/7/17.
//  Copyright © 2018年 lmg. All rights reserved.
//

#import "CPLoginViewController.h"
#import "MainTabBarController.h"

@interface CPLoginViewController ()

@end

@implementation CPLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}

- (void)layoutUI{
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake((LSWIDTH-200)/2, (LSHEIGHT-44)/2, 200, 44)];
    loginBtn.backgroundColor = [UIColor greenColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginBtn];
    
}
- (void)loginBtnClicked
{
    MainTabBarController *vc = [MainTabBarController new];
    [UIApplication sharedApplication].delegate.window.rootViewController = vc;
}

@end
