//
//  MSVacationProgressAppearanceConfig.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ProgressRGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface MSVacationProgressAppearanceConfig : NSObject
+(instancetype)defauteAppearConfig;

#pragma mark set

//进度条背景色
@property(nonatomic,copy,readonly)MSVacationProgressAppearanceConfig *(^ProgressTintColor)(UIColor *);
//进度条进度色
@property(nonatomic,copy,readonly)MSVacationProgressAppearanceConfig *(^ProgressInnerColor)(UIColor *);
//圆角
@property(nonatomic,copy,readonly)MSVacationProgressAppearanceConfig *(^CornerRadius)(CGFloat);


//get


@property(nonatomic,strong,readonly)UIColor *tintColor;

@property(nonatomic,strong,readonly)UIColor *innerColor;

@property(nonatomic,assign,readonly)CGFloat radius;

@end
