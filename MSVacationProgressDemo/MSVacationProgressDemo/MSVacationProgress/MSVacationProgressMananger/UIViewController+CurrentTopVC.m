//
//  UIViewController+CurrentTopVC.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "UIViewController+CurrentTopVC.h"

@implementation UIViewController (CurrentTopVC)

+(UIViewController * _Nullable)currentTopVC {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    // window Add subView, 寻找nextResponder的VC,这种结构不考虑了,建议修改结构
    if (!result)  return nil;
    
    return [result topVC];
}
- (BOOL)isCurrentTopVC
{
    return self == [UIViewController currentTopVC];
}
#pragma mark - pricate
- (UIViewController*)topVC
{
    if ([self isKindOfClass:[UITabBarController class]])
    {
        UITabBarController* tabBarController = (UITabBarController*)self;
        return [tabBarController.selectedViewController topVC];
    }
    else if ([self isKindOfClass:[UINavigationController class]])
    {
        UINavigationController* navigationController = (UINavigationController*)self;
        return [navigationController.topViewController topVC];
    }
    else if (self.presentedViewController)
    {
        return [self.presentedViewController topVC];
    }
    else if (self.childViewControllers.count > 0)
    {
        return [self.childViewControllers.lastObject topVC];
    }
    return self;
}

@end
