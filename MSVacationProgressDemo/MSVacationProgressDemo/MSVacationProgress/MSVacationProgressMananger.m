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
@interface MSVacationProgressMananger()<MSVacationProgressViewDelegate,MSVacationProgressViewDataSorce>
@property(nonatomic,strong)MSVacationProgressView *progressView;
@property(nonatomic,strong)NSArray <MSVacationProgressScript *> *scripts;
@property(nonatomic,strong)MSVacationProgressViewAppearanceConfig *appearConfig;
@end
@implementation MSVacationProgressMananger
#pragma mark lazy
-(MSVacationProgressView *)progressView {
    if (!_progressView) {
        _progressView = [MSVacationProgressView createWithAppearanceConfig:^(MSVacationProgressViewAppearanceConfig *config) {
            
            
        }];
    }
    return _progressView;
}
-(MSVacationProgressViewAppearanceConfig *)appearConfig {
    if (!_appearConfig) {
        _appearConfig = [MSVacationProgressViewAppearanceConfig defauteAppearConfig];
    }
    return _appearConfig;
}

#pragma mark public func
+(instancetype)showMSVacationProgressWithScripts:(NSArray <MSVacationProgressScript *>* (^)(void))scripts andAppearanceConfig:(void (^)(MSVacationProgressViewAppearanceConfig *appear))appearConfig{
    NSArray <MSVacationProgressScript *> *scriptDatas;
    if (scripts) {
        scriptDatas = scripts();
    }else{
        return nil;
    }
    if (!scriptDatas.count) {
        return nil;
    }
    MSVacationProgressMananger *manager = [[MSVacationProgressMananger alloc]init];
    manager.scripts  = [NSArray arrayWithArray:scriptDatas];
    !appearConfig?:appearConfig(manager.appearConfig);
    
    return manager;
}



+(instancetype)showDefaultProgress{
    //需要判断是否是首次布置作业
    
    MSVacationProgressMananger *manager = [[MSVacationProgressMananger alloc]init];
    return manager;
}

+(void)dissmiss {
    
}

-(void)dealloc
{
    
}
#pragma ProgressView datasource
- (nullable NSArray<MSVacationProgressScript *> *)scriptsForMSVacationProgressView:(MSVacationProgressView *)view {
    return self.scripts;
}
- (nullable UIView *)MSVacationProgressViewCurtainView:(MSVacationProgressView *)view {
    return [MSVacationProgressCurtainView curtainView];
}
- (NSTimeInterval)MSVacationProgressViewCurtainViewStayTime:(MSVacationProgressView *)view {
    return 3.0f;
}
@end
