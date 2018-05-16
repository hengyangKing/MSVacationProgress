//
//  MSVacationProgressMananger.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MSVacationProgressScript;
@class MSVacationProgressViewAppearanceConfig;
@interface MSVacationProgressMananger : NSObject
+(instancetype)showMSVacationProgressWithScripts:(NSArray <MSVacationProgressScript *>* (^)(void))scripts andAppearanceConfig:(void (^)(MSVacationProgressViewAppearanceConfig *appear))appearConfig;

+(instancetype)showDefaultProgress;

+(void)dissmiss;

@end
