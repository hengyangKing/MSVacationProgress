//
//  MSVacationProgressScript.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressScript.h"

@implementation MSVacationProgressScript
-(BOOL)grundScript {
    if (!self.content) {return NO;}
    if (!self.content.title.length){return NO;}
    if ((self.transitionsTime<0)||(self.interval<0)) {return NO;}
    return YES;
}
@end
