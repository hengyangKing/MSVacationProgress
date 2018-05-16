//
//  MSVacationProgressScript.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface MSVacationProgressScriptContent : NSObject
@property(nonatomic,copy)NSString *title;//title
@property(nonatomic,copy)NSString *subTitlt;//subtitle
@end
@interface MSVacationProgressScript : NSObject

@property(nonatomic,strong)MSVacationProgressScriptContent *content;
@property(nonatomic,assign)NSTimeInterval interval;//每一幕时长
@property(nonatomic,assign)NSTimeInterval transitionsTime;//转场时常;
-(BOOL)grundScript;
@end
