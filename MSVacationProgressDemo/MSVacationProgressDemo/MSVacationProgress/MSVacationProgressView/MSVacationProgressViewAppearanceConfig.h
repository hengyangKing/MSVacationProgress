//
//  MSVacationProgressViewAppearanceConfig.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSVacationProgressAppearanceConfig;
//转场类型
typedef NS_ENUM(NSUInteger, MSProgressAnnouncerTransitionsType) {
    AnnouncerTransitionsTypeIsLeftward,//向左
    AnnouncerTransitionsTypeIsRightward,//向右
    AnnouncerTransitionsTypeIsUpward,//向上
    AnnouncerTransitionsTypeIsDownward,//向下
    
};

@interface MSVacationProgressViewAppearanceConfig : NSObject
+(instancetype)defauteAppearConfig;

@property(nonatomic,copy,readonly)MSVacationProgressViewAppearanceConfig *(^TransitionsType)(MSProgressAnnouncerTransitionsType);//设置转场方式

@property(nonatomic,copy,readonly)MSVacationProgressViewAppearanceConfig *(^BGcolor)(UIColor *);

@property(nonatomic,copy,readonly)MSVacationProgressViewAppearanceConfig *(^TitleTextFont)(UIFont *);

@property(nonatomic,copy,readonly)MSVacationProgressViewAppearanceConfig *(^SubTitleTextFont)(UIFont *);

@property(nonatomic,copy,readonly)MSVacationProgressViewAppearanceConfig *(^TitleTextColor)(UIColor *);

@property(nonatomic,copy,readonly)MSVacationProgressViewAppearanceConfig *(^SubTitleTextColor)(UIColor *);

@property(nonatomic,copy,readonly)MSVacationProgressViewAppearanceConfig *(^ProgressBarH)(CGFloat);

///进度条外观
@property(nonatomic,copy,readonly)MSVacationProgressViewAppearanceConfig *(^ProgressAppearanceConfig)(MSVacationProgressAppearanceConfig *);


@property(nonatomic,strong,readonly)UIColor *bgColor;

@property(nonatomic,strong,readonly)UIFont *titleFont;

@property(nonatomic,strong,readonly)UIFont *subTitleFont;

@property(nonatomic,strong,readonly)UIColor *titleColor;

@property(nonatomic,strong,readonly)UIColor *subTitleColor;

@property(nonatomic,assign,readonly)CGFloat progressH;

@property(nonatomic,assign,readonly)MSProgressAnnouncerTransitionsType transitions;

@property(nonatomic,strong,readonly)MSVacationProgressAppearanceConfig *progressConfig;

@end
