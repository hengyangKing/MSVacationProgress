//
//  MSVacationProgressView.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSVacationProgressScript.h"
@class MSVacationProgressView;
@class MSVacationProgressViewAppearanceConfig;

@protocol MSVacationProgressViewDelegate <NSObject>
@optional

-(void)MSVacationProgressViewWillShowAnimate:(MSVacationProgressView *)view;

-(void)MSVacationProgressViewWillFinishAnimate:(MSVacationProgressView *)view;

//每次切换脚本调用
-(void)MSVacationProgressView:(MSVacationProgressView *)view andCurrentScript:(MSVacationProgressScript *)currentScript andCurrentIndex:(NSUInteger)currentIndex;

@end
@protocol MSVacationProgressViewDataSorce <NSObject>

- (nullable NSArray<MSVacationProgressScript *> *)scriptsForMSVacationProgressView:(MSVacationProgressView *)view;
@optional
///展示完成进度动画 的剧终view
- (nullable UIView *)MSVacationProgressViewCurtainView:(MSVacationProgressView *)view;
///展示完成进度动画 的剧终view 停留时长
- (NSTimeInterval)MSVacationProgressViewCurtainViewStayTime:(MSVacationProgressView *)view;

@end

@interface MSVacationProgressView : UIView

@property(nonatomic,weak)id<MSVacationProgressViewDelegate> delegate;
@property(nonatomic,weak)id<MSVacationProgressViewDataSorce> dataSource;

+(instancetype)createWithAppearanceConfig:(void (^)(MSVacationProgressViewAppearanceConfig *))appearConfig;

-(void)show;

-(void)dissmiss;

@end
