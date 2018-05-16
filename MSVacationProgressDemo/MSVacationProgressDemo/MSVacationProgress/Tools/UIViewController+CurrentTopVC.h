//
//  UIViewController+CurrentTopVC.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CurrentTopVC)
/**
 获取视图栈最顶层视图
 */
+(UIViewController * _Nullable)currentTopVC;

/**
 当前VC是否位于视图栈顶层
 */
-(BOOL)isCurrentTopVC;

@end
