//
//  MSVacationProgress.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSVacationProgressAppearanceConfig;
@interface MSVacationProgress : UIView

+(instancetype)MSVacationProgressWithConfig:(void (^)(MSVacationProgressAppearanceConfig *))config;

- (void)setProgress:(float)progress andInterval:(NSTimeInterval)interval animatedFinish:(void(^)(void))finish;

@end
