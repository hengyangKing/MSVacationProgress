//
//  MSVacationProgressAppearanceConfig.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressAppearanceConfig.h"

@implementation MSVacationProgressAppearanceConfig
#pragma mark set

-(void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
}
-(void)setInnerColor:(UIColor *)innerColor {
    _innerColor = innerColor;
}
-(void)setRadius:(CGFloat)radius {
    _radius = radius;
}

#pragma mark get

-(MSVacationProgressAppearanceConfig *(^)(UIColor *))ProgressTintColor {
    return ^(UIColor *color){
        self.tintColor = color;
        return self;
    };
}
-(MSVacationProgressAppearanceConfig *(^)(UIColor *))ProgressInnerColor {
    return ^(UIColor *color){
        self.innerColor = color;
        return self;
    };
}
-(MSVacationProgressAppearanceConfig *(^)(CGFloat))CornerRadius
{
    return ^(CGFloat f){
        self.radius = f;
        return self;
    };
}

+(instancetype)defauteAppearConfig {
    MSVacationProgressAppearanceConfig *config = [[MSVacationProgressAppearanceConfig alloc]init];
    config.CornerRadius(2.5f).ProgressTintColor(ProgressRGB(237, 237, 237)).ProgressInnerColor(ProgressRGB(21, 166, 238));
    return config;
}


@end
