//
//  MSVacationProgressView.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSVacationProgressScript.h"
#import "MSVacationProgressViewAppearanceConfig.h"
@class MSVacationProgressView;

@protocol MSVacationProgressViewDelegate <NSObject>
@optional

-(void)MSVacationProgressViewWillShowAnimate:(MSVacationProgressView *)view;

-(void)MSVacationProgressViewWillFinishAnimate:(MSVacationProgressView *)view;

//每次切换脚本调用
-(void)MSVacationProgressViewSwitchingScript:(MSVacationProgressView *)view andCurrentScript:(MSVacationProgressScript *)currentScript andCurrentIndex:(NSUInteger)currentIndex;

@end
@protocol MSVacationProgressViewDataSorce <NSObject>

- (nullable NSArray<MSVacationProgressScript *> *)scriptsForMSVacationProgressView:(MSVacationProgressView *)view;
@end

@interface MSVacationProgressView : UIView

@property(nonatomic,weak)id<MSVacationProgressViewDelegate> delegate;
@property(nonatomic,weak)id<MSVacationProgressViewDataSorce> dataSource;

+(instancetype)createWithAppearanceConfig:(void (^)(MSVacationProgressViewAppearanceConfig *))appearConfig;


-(void)show;

-(void)dismiss;



@end
