//
//  MainTabBarController.m
//  CalendarPlan
//
//  Created by lmg on 2018/7/17.
//  Copyright © 2018年 lmg. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "CPCalendarViewController.h"
#import "CPSpendingViewController.h"
#import "CPLearningViewController.h"
#import "CPExerciseViewController.h"
#import "CPSettingViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
    
}
- (void)layoutUI
{
    MainNavigationController *calendarNaVC = [self createNavWithClass:[CPCalendarViewController class] WithDefaultImageName:@"" SelectImageName:@"" title:@"日程"];
    MainNavigationController *spendNaVC = [self createNavWithClass:[CPSpendingViewController class] WithDefaultImageName:@"" SelectImageName:@"" title:@"花销"];
    MainNavigationController *learnNaVC = [self createNavWithClass:[CPLearningViewController class] WithDefaultImageName:@"" SelectImageName:@"" title:@"学习"];
    MainNavigationController *exerciseNaVC = [self createNavWithClass:[CPExerciseViewController class] WithDefaultImageName:@"" SelectImageName:@"" title:@"健康"];
    MainNavigationController *settingNaVC = [self createNavWithClass:[CPSettingViewController class] WithDefaultImageName:@"" SelectImageName:@"" title:@"设置"];
    
    self.viewControllers = @[calendarNaVC,spendNaVC,learnNaVC,exerciseNaVC,settingNaVC];
    
}
-(MainNavigationController *)createNavWithClass:(Class )class WithDefaultImageName:(NSString *)defaultImageName SelectImageName:(NSString *)selectImageName title:(NSString *)title
{
    UIViewController *controller = [class new];
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:controller];
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:defaultImageName] selectedImage:[UIImage imageNamed:selectImageName]];
    item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    nav.tabBarItem = item;
    return nav;
}


@end
