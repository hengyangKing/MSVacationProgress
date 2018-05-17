//
//  MSVacationProgressViewAppearanceConfig.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressViewAppearanceConfig.h"
#import "MSVacationProgressAppearanceConfig.h"

#define ProgressFONT(A) [UIFont fontWithName:@"PingFangSC-Regular"size:A]?[UIFont fontWithName:@"PingFangSC-Regular"size:A]:[UIFont systemFontOfSize:A]

@implementation MSVacationProgressViewAppearanceConfig

-(void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
}
-(void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
}
-(void)setSubTitleFont:(UIFont *)subTitleFont {
    _subTitleFont = subTitleFont;
}
-(void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
}
-(void)setSubTitleColor:(UIColor *)subTitleColor {
    _subTitleColor = subTitleColor;
}
-(void)setTransitions:(MSProgressAnnouncerTransitionsType)transitions {
    _transitions = transitions;
}
-(void)setProgressConfig:(MSVacationProgressAppearanceConfig *)progressConfig {
    _progressConfig = progressConfig;
}
-(void)setProgressH:(CGFloat)progressH {
    _progressH = progressH;
    
}
-(MSVacationProgressViewAppearanceConfig *(^)(UIColor *))BGcolor {
    return ^(UIColor *color){
        self.bgColor = color;
        return self;
    };
}
-(MSVacationProgressViewAppearanceConfig *(^)(UIFont *))TitleTextFont {
    return ^(UIFont *font){
        self.titleFont = font;
        return self;
    };
}
-(MSVacationProgressViewAppearanceConfig *(^)(UIFont *))SubTitleTextFont {
    return ^(UIFont *font){
        self.subTitleFont = font;
        return self;
    };
}
-(MSVacationProgressViewAppearanceConfig *(^)(UIColor *))TitleTextColor {
    return ^(UIColor *color){
        self.titleColor = color;
        return self;
    };
}
-(MSVacationProgressViewAppearanceConfig *(^)(UIColor *))SubTitleTextColor {
    return ^(UIColor *color){
        self.subTitleColor = color;
        return self;
    };
}
-(MSVacationProgressViewAppearanceConfig *(^)(CGFloat))ProgressBarH {
    return ^(CGFloat h){
        self.progressH = h;
        return self;
    };
}
-(MSVacationProgressViewAppearanceConfig *(^)(MSProgressAnnouncerTransitionsType))TransitionsType {
    return ^(MSProgressAnnouncerTransitionsType type){
        self.transitions = type;
        return self;
    };
}
-(MSVacationProgressViewAppearanceConfig *(^)(MSVacationProgressAppearanceConfig *))ProgressAppearanceConfig {
    return ^(MSVacationProgressAppearanceConfig *config){
        self.progressConfig = config;
        return self;
    };
}
+(instancetype)defauteAppearConfig {
    MSVacationProgressViewAppearanceConfig *config = [[MSVacationProgressViewAppearanceConfig alloc]init];
    
    config.BGcolor(ProgressRGB(245, 246, 247)).TitleTextFont(ProgressFONT(15)).SubTitleTextFont(ProgressFONT(12)).TitleTextColor(ProgressRGB(85, 85, 85)).SubTitleTextColor(ProgressRGB(85, 85, 85)).TransitionsType(AnnouncerTransitionsTypeIsUpward).ProgressAppearanceConfig([MSVacationProgressAppearanceConfig defauteAppearConfig]).ProgressBarH(5.0f);
    
    return config;
}
@end
