//
//  MSVacationProgressScript.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressScript.h"
@implementation MSVacationProgressScript
+(instancetype)progressScriptWithTitle:(NSString *)title andSubTitle:(NSString *)subtitle andTimeInterval:(NSTimeInterval)timeInterval {
    MSVacationProgressScript *script = [[MSVacationProgressScript alloc]init];
    script.content.title = title;
    script.content.subTitlt = title;
    script.interval = timeInterval;
    return script;
}
-(MSVacationProgressScriptContent *)content{
    if (!_content) {
        _content = [[MSVacationProgressScriptContent alloc]init];
    }
    return _content;
}

-(BOOL)grundScript {
    if (!self.content) {return NO;}
    if (!self.content.title.length){return NO;}
    if ((self.interval<0)) {return NO;}
    return YES;
}


@end
