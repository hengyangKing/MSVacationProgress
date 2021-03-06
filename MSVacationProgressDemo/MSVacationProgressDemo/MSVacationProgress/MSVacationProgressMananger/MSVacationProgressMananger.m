//
//  MSVacationProgressMananger.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressMananger.h"
#import "MSVacationProgressViewAppearanceConfig.h"
#import "MSVacationProgressView.h"
#import "MSVacationProgressCurtainView.h"
#import "UIViewController+CurrentTopVC.h"
#import "Masonry.h"

//swizzling
#import <objc/runtime.h>

#define ProgressToken @"isShow"
#define kProgressKey NSStringFromClass([self class])
@interface MSVacationProgressMananger()<MSVacationProgressViewDelegate,MSVacationProgressViewDataSorce>
{
    MSVacationProgressManagerCurtainConfig * _curtainConfig;
    BOOL _isLoading;
}
@property(nonatomic,strong)MSVacationProgressView *progressView;
@property(nonatomic,strong)NSArray <MSVacationProgressScript *> *scripts;
@property(nonatomic,strong)MSVacationProgressViewAppearanceConfig *appearConfig;


@property(nonatomic,copy)void (^willFinishBlock)(void);
@property(nonatomic,copy)void (^willShowBlock)(void);
@property(nonatomic,copy)void (^switchingScriptBlock)(NSUInteger index);
@end
@implementation MSVacationProgressMananger
static MSVacationProgressMananger *_shareInstance;
+ (instancetype)shareInstance {
    if(_shareInstance == nil) {
        _shareInstance = [[MSVacationProgressMananger alloc] init];
    }
    return _shareInstance;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[super allocWithZone:zone]init];
    });
    return _shareInstance;
}
-(id)copyWithZone:(NSZone *)zone {
    return _shareInstance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _shareInstance;
}

#pragma mark lazy
-(MSVacationProgressView *)progressView {
    if (!_progressView) {
        _progressView = [MSVacationProgressView createWithAppearanceConfig:nil];
        _progressView.delegate = self;
        _progressView.dataSource = self;
    }
    return _progressView;
}
-(MSVacationProgressViewAppearanceConfig *)appearConfig {
    if (!_appearConfig) {
        _appearConfig = [MSVacationProgressViewAppearanceConfig defauteAppearConfig];
    }
    return _appearConfig;
}
-(MSVacationProgressManagerCurtainConfig *)curtainConfig {
    if (!_curtainConfig) {
        _curtainConfig = [MSVacationProgressManagerCurtainConfig defauteCurtainConfig];
        _curtainConfig.CurtainView([MSVacationProgressCurtainView curtainView]);
    }
    return _curtainConfig;
}
#pragma mark public func
-(void)showProgressWithScripts:(NSArray <MSVacationProgressScript *>* (^)(void))scripts andAppearanceConfig:(void (^)(MSVacationProgressViewAppearanceConfig *appear))appearConfig {
    NSArray <MSVacationProgressScript *> *scriptDatas;
    if (scripts) {
        scriptDatas = scripts();
    }else{return;}
    if (!scriptDatas.count) {return ;}
    self.scripts  = [NSArray arrayWithArray:scriptDatas];
    !appearConfig?:appearConfig(self.appearConfig);
    if (!self.appearConfig) {return;}
    [self progressShow];
}
-(void)showDefaultProgress{
    //需要判断是否是首次布置作业
    
//    if (self.isLoaded) {return;}
    
    [self showProgressWithScripts:^NSArray<MSVacationProgressScript *> *{
        MSVacationProgressScript *script0 = [MSVacationProgressScript progressScriptWithTitle:@"信息读取中..." andSubTitle:@"正在读取您管理的班级信息" andTimeInterval:1.5f];
        MSVacationProgressScript *script1 = [MSVacationProgressScript progressScriptWithTitle:@"学习情况分析中..." andSubTitle:@"针对性分析全部学生的薄弱知识点" andTimeInterval:1.5f];
        MSVacationProgressScript *script2 = [MSVacationProgressScript progressScriptWithTitle:@"作业包准备中..." andSubTitle:@"针对每位学生生成个性化暑假作业" andTimeInterval:1.5f];
        return @[script0,script1,script2];
    } andAppearanceConfig:nil];
}
-(void)showDefaultProgressWithFinishBlock:(void(^)(void))block {
    [self finishProgressBlock:block];
    [self showDefaultProgress];
}
-(void)dissmiss {
    _isLoading = NO;
    
    //取消调换
    [self swizzlingFunc];
    [self.progressView dismiss];
    [[NSUserDefaults standardUserDefaults] setObject:ProgressToken forKey:kProgressKey];
}
-(void)finishProgressBlock:(void (^)(void))block {
    [self setWillFinishBlock:block];
}
-(void)willShowProgressBlock:(void (^)(void))block {
    [self setWillShowBlock:block];
}
-(void)switchingScriptBlock:(void (^)(NSUInteger))block {
    [self setSwitchingScriptBlock:block];
}
-(void)addCurtainWithConfig:(MSVacationProgressManagerCurtainConfig *)config {
    if (config.showCurtain && config.curtain) {
        __weak typeof(self) weakself = self;
        [self.progressView insertSubview:config.curtain atIndex:self.progressView.subviews.count];
        [config.curtain mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.mas_equalTo(weakself.progressView);
        }];
        if(config.autoDismissCurtain && config.showCurtainTime > 0){
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(config.showCurtainTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakself dissmiss];
                [config.curtain removeFromSuperview];
            });
        }
    }
}
-(BOOL)isLoaded {
    NSString *isShowProgress=[[NSUserDefaults standardUserDefaults]objectForKey:kProgressKey];
    return isShowProgress.length;
}
-(BOOL)isLoading {
    return _isLoading;
}
#pragma mark funcs
-(void)progressShow {
    UIView *topview = [UIViewController currentTopVC].view;
    if (topview) {
        [topview insertSubview:self.progressView atIndex:topview.subviews.count];
        //调换
        [self swizzlingFunc];

        [self.progressView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.mas_equalTo(topview);
        }];
        [self.progressView show];
    }
}
-(void)swizzlingFunc {
    UIView *superView = self.progressView.superview;
    Method sys_add = class_getInstanceMethod([superView class], @selector(addSubview:));
    Method manager_add = class_getInstanceMethod([superView class], @selector(MS_addSubview:));
    method_exchangeImplementations(sys_add, manager_add);
}
#pragma ProgressView datasource
- (nullable NSArray<MSVacationProgressScript *> *)scriptsForMSVacationProgressView:(MSVacationProgressView *)view {
    return self.scripts;
}
-(void)MSVacationProgressViewWillShowAnimate:(MSVacationProgressView *)view {
    _isLoading = YES;
    !self.willShowBlock?:self.willShowBlock();
}

-(void)MSVacationProgressViewWillFinishAnimate:(MSVacationProgressView *)view {
    
    !self.willFinishBlock?:self.willFinishBlock();
    if (self.curtainConfig.showCurtain) {
        [self addCurtainWithConfig:self.curtainConfig];
    }else{
        [self dissmiss];
    }
}

//每次切换脚本调用
-(void)MSVacationProgressViewSwitchingScript:(MSVacationProgressView *)view andCurrentScript:(MSVacationProgressScript *)currentScript andCurrentIndex:(NSUInteger)currentIndex {
    !self.switchingScriptBlock?:self.switchingScriptBlock(currentIndex);
}
@end

@implementation UIView (Swizzling)
-(void)MS_addSubview:(UIView *)view {
    NSUInteger index = (self.subviews.count>0)?(self.subviews.count - 1):0;
    [self insertSubview:view atIndex:index];
}
@end
