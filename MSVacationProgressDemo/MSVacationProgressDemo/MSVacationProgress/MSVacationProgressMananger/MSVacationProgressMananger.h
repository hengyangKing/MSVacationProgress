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

-(void)showDefaultProgressWithFinishBlock:(void(^)(void))block;

-(void)dissmiss;

//进度条将要展示完成block
-(void)finishProgressBlock:(void (^)(void))block;

//进度条将要展示block
-(void)willShowProgressBlock:(void(^)(void))block;

//切换脚本时block
-(void)switchingScriptBlock:(void(^)(NSUInteger index))block;

//添加自定义终场页面
-(void)addCurtainWithConfig:(MSVacationProgressManagerCurtainConfig *)config ;
//是否已经加载过动画
@property(nonatomic,assign,readonly)BOOL isLoaded;

//正在展示动画标识
@property(nonatomic,assign,readonly)BOOL isLoading;

@property(nonatomic,strong,readonly)MSVacationProgressManagerCurtainConfig *curtainConfig;

@end
