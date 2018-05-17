//
//  MSVacationProgressScript.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSVacationProgressScriptContent.h"

@interface MSVacationProgressScript : NSObject

@property(nonatomic,strong)MSVacationProgressScriptContent *content;
@property(nonatomic,assign)NSTimeInterval interval;//每一幕时长
-(BOOL)grundScript;
+(instancetype)progressScriptWithTitle:(NSString *)title andSubTitle:(NSString *)subtitle andTimeInterval:(NSTimeInterval)timeInterval;
@end
