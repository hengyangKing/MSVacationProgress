//
//  MSVacationProgressManagerCurtainConfig.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/17.
//  Copyright © 2018年 king. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSVacationProgressManagerCurtainConfig : NSObject

//是否需要展示落幕页面
@property(nonatomic,copy,readonly)MSVacationProgressManagerCurtainConfig *(^showCurtainView)(BOOL);
//落幕页面是否需要自动消失
@property(nonatomic,copy,readonly)MSVacationProgressManagerCurtainConfig *(^autoDismissCurtainView)(BOOL);
//若需要自动消失 展示时常
@property(nonatomic,copy,readonly)MSVacationProgressManagerCurtainConfig *(^curtainViewShowTime)(NSTimeInterval);

//需要展示的落幕页面
@property(nonatomic,copy,readonly)MSVacationProgressManagerCurtainConfig *(^CurtainView)(UIView *);


@property(nonatomic,assign,readonly)BOOL showCurtain;

@property(nonatomic,assign,readonly)BOOL autoDismissCurtain;

@property(nonatomic,assign,readonly)NSTimeInterval showCurtainTime;

@property(nonatomic,strong,readonly)UIView *curtain;

+(instancetype)defauteCurtainConfig;

@end
