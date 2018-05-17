//
//  MSVacationProgressManagerCurtainConfig.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/17.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressManagerCurtainConfig.h"

@implementation MSVacationProgressManagerCurtainConfig
+(instancetype)defauteCurtainConfig {
    MSVacationProgressManagerCurtainConfig *config = [[MSVacationProgressManagerCurtainConfig alloc]init];
    config.showCurtainView(YES).autoDismissCurtainView(YES).curtainViewShowTime(1.5);
    return config;
}

-(void)setShowCurtain:(BOOL)showCurtain {
    _showCurtain = showCurtain;
}
-(void)setAutoDismissCurtain:(BOOL)autoDismissCurtain {
    _autoDismissCurtain = autoDismissCurtain;
}
-(void)setShowCurtainTime:(NSTimeInterval)showCurtainTime {
    _showCurtainTime = showCurtainTime;
}
-(void)setCurtain:(UIView *)curtain {
    _curtain = curtain;
}


-(MSVacationProgressManagerCurtainConfig *(^)(BOOL))showCurtainView {
    return ^(BOOL show){
        self.showCurtain = show;
        return self;
    };
}
-(MSVacationProgressManagerCurtainConfig *(^)(BOOL))autoDismissCurtainView {
    return ^(BOOL dismiss){
        self.autoDismissCurtain = dismiss;
        return self;
    };
}
-(MSVacationProgressManagerCurtainConfig *(^)(NSTimeInterval))curtainViewShowTime {
    return ^(NSTimeInterval time){
        self.showCurtainTime = time;
        return self;
    };
}
-(MSVacationProgressManagerCurtainConfig *(^)(UIView *))CurtainView {
    return ^(UIView *view){
        self.curtain = view;
        return self;
    };
}
@end
