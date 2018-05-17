//
//  MSVacationProgressMananger.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSVacationProgressManagerCurtainConfig.h"
@class MSVacationProgressView;
@class MSVacationProgressScript;
@class MSVacationProgressViewAppearanceConfig;



@interface MSVacationProgressMananger : NSObject
+ (instancetype)shareInstance ;
///自定义展示参数显示方法 
-(void)showProgressWithScripts:(NSArray <MSVacationProgressScript *>* (^)(void))scripts andAppearanceConfig:(void (^)(MSVacationProgressViewAppearanceConfig *appear))appearConfig;

-(void)showDefaultProgress;

-(void)dissmiss;

//进度条将要展示完成block
-(void)finishProgressBlock:(MSVacationProgressManagerCurtainConfig * (^)(MSVacationProgressManagerCurtainConfig *))block;

//进度条将要展示block
-(void)willShowProgressBlock:(void(^)(void))block;

//切换脚本时block
-(void)switchingScriptBlock:(void(^)(NSUInteger index))block;

@end
