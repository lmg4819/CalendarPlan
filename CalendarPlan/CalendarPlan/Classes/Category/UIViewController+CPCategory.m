//
//  UIViewController+CPCategory.m
//  CalendarPlan
//
//  Created by lmg on 2018/7/17.
//  Copyright © 2018年 lmg. All rights reserved.
//

#import "UIViewController+CPCategory.h"
#import <Aspects.h>

@implementation UIViewController (CPCategory)

+(void)load
{
    [self aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info){
        UIViewController *vc = info.instance;
        vc.view.backgroundColor = [UIColor whiteColor];
        
    } error:nil];
}

@end
